use std::{env, fs, ptr};
use winapi::ctypes::c_void;
use winapi::shared::minwindef::{LPARAM, LRESULT, UINT, WPARAM};
use winapi::shared::windef::{HBITMAP, HDC, HWND, RECT};
use winapi::um::winuser::{
    BeginPaint, CreateWindowExW, DefWindowProcW, DispatchMessageW, EndPaint, GetClientRect,
    GetMessageW, GetSystemMetrics, LoadCursorW, LoadIconW, PostQuitMessage, RegisterClassExW,
    ShowWindow, TranslateMessage, UpdateWindow, CW_USEDEFAULT, IDC_ARROW, IDI_APPLICATION,
    MSG, PAINTSTRUCT, SM_CXSCREEN, SM_CYSCREEN, WS_EX_LAYERED, WS_EX_TOPMOST, WS_EX_TOOLWINDOW,
    WS_POPUP, WS_VISIBLE, WNDCLASSEXW, WM_DESTROY, WM_LBUTTONDOWN, WM_PAINT,
};
use winapi::um::wingdi::{
    BitBlt, CreateCompatibleDC, DeleteDC, SelectObject, SRCCOPY, BI_RGB, BITMAPINFO, BITMAPINFOHEADER,
    CreateDIBSection,
};
use winapi::um::libloaderapi::GetModuleHandleW;
use winapi::um::winnt::LPCWSTR;
use winapi::um::objbase::COINIT_APARTMENTTHREADED;
use winapi::um::combaseapi::{CoInitializeEx, CoUninitialize};
use rand::Rng;
use png::{Decoder, Transformations};

const WINDOW_CLASS: &str = "ImageWindowClass\0";

fn to_wstring(value: &str) -> Vec<u16> {
    value.encode_utf16().chain(std::iter::once(0)).collect()
}

unsafe extern "system" fn window_proc(
    hwnd: HWND,
    msg: UINT,
    wparam: WPARAM,
    lparam: LPARAM,
) -> LRESULT {
    match msg {
        WM_PAINT => {
            let mut ps: PAINTSTRUCT = std::mem::zeroed();
            let hdc = BeginPaint(hwnd, &mut ps);
            
            let hbitmap = winapi::um::winuser::GetWindowLongPtrW(
                hwnd,
                winapi::um::winuser::GWLP_USERDATA
            ) as HBITMAP;
            
            if !hbitmap.is_null() {
                let mut rect: RECT = std::mem::zeroed();
                GetClientRect(hwnd, &mut rect);
                
                let hdc_mem = CreateCompatibleDC(hdc);
                let old_bitmap = SelectObject(hdc_mem, hbitmap as *mut c_void);
                
                BitBlt(
                    hdc,
                    0,
                    0,
                    rect.right,
                    rect.bottom,
                    hdc_mem,
                    0,
                    0,
                    SRCCOPY,
                );
                
                SelectObject(hdc_mem, old_bitmap);
                DeleteDC(hdc_mem);
            }
            
            EndPaint(hwnd, &ps);
            0
        }
        WM_LBUTTONDOWN => {
            winapi::um::winuser::DestroyWindow(hwnd);
            0
        }
        WM_DESTROY => {
            PostQuitMessage(0);
            0
        }
        _ => DefWindowProcW(hwnd, msg, wparam, lparam),
    }
}

// Load PNG with transparency support
unsafe fn load_png_as_bitmap(path: &str) -> Result<HBITMAP, String> {
    // Read PNG file
    let data = fs::read(path).map_err(|e| format!("File error: {}", e))?;
    
    // Create PNG decoder
    let mut decoder = Decoder::new(data.as_slice());
    decoder.set_transformations(Transformations::ALPHA | Transformations::EXPAND);
    
    let mut reader = decoder.read_info()
        .map_err(|e| format!("PNG decode error: {}", e))?;
    
    let info = reader.info();
    let width = info.width as i32;
    let height = info.height as i32;
    
    // Allocate image buffer
    let mut img_data = vec![0; reader.output_buffer_size()];
    let output_info = reader.next_frame(&mut img_data)
        .map_err(|e| format!("PNG frame error: {}", e))?;
    
    let color_type = output_info.color_type;
    let bit_depth = output_info.bit_depth as u8;
    
    // Create BITMAPINFO structure
    let mut bmi: BITMAPINFO = std::mem::zeroed();
    bmi.bmiHeader.biSize = std::mem::size_of::<BITMAPINFOHEADER>() as u32;
    bmi.bmiHeader.biWidth = width;
    bmi.bmiHeader.biHeight = -height; // Negative for top-down DIB
    bmi.bmiHeader.biPlanes = 1;
    bmi.bmiHeader.biBitCount = 32;
    bmi.bmiHeader.biCompression = BI_RGB;
    
    // Create DIB section
    let mut bits_ptr: *mut c_void = ptr::null_mut();
    let hdc_screen = winapi::um::winuser::GetDC(ptr::null_mut());
    let hbitmap = CreateDIBSection(
        hdc_screen,
        &bmi,
        winapi::um::wingdi::DIB_RGB_COLORS,
        &mut bits_ptr,
        ptr::null_mut(),
        0
    );
    winapi::um::winuser::ReleaseDC(ptr::null_mut(), hdc_screen);
    
    if hbitmap.is_null() {
        return Err("Failed to create DIB section".to_string());
    }
    
    // Copy PNG data to bitmap
    let src = img_data.as_ptr();
    let dst = bits_ptr as *mut u8;
    let bytes_per_row = (width * 4) as usize;
    
    for y in 0..height as usize {
        let src_row = src.add(y * output_info.line_size);
        let dst_row = dst.add(y * bytes_per_row);
        
        for x in 0..width as usize {
            let src_pixel = src_row.add(x * output_info.line_size / width as usize);
            let dst_pixel = dst_row.add(x * 4);
            
            // Convert RGBA to BGRA
            *dst_pixel.add(0) = *src_pixel.add(2); // B
            *dst_pixel.add(1) = *src_pixel.add(1); // G
            *dst_pixel.add(2) = *src_pixel.add(0); // R
            
            // Handle alpha channel if present
            if output_info.color_type == png::ColorType::Rgba {
                *dst_pixel.add(3) = *src_pixel.add(3); // A
            } else {
                *dst_pixel.add(3) = 255; // Opaque
            }
        }
    }
    
    Ok(hbitmap)
}

fn main() {
    let args: Vec<String> = env::args().collect();
    if args.len() < 2 {
        eprintln!("Usage: show_image.exe <image-path>");
        std::process::exit(1);
    }

    let path = &args[1];
    let is_png = path.to_lowercase().ends_with(".png");

    // Initialize COM for PNG loading
    unsafe {
        CoInitializeEx(ptr::null_mut(), COINIT_APARTMENTTHREADED);
    }

    let hbitmap = if is_png {
        // Load PNG using our custom loader
        unsafe { load_png_as_bitmap(path) }
    } else {
        // Load other formats using Windows API
        let image_path = to_wstring(path);
        unsafe {
            let hbitmap = winapi::um::winuser::LoadImageW(
                ptr::null_mut(),
                image_path.as_ptr() as _,
                winapi::um::winuser::IMAGE_BITMAP,
                0,
                0,
                winapi::um::winuser::LR_LOADFROMFILE,
            ) as HBITMAP;
            
            if hbitmap.is_null() {
                Err("Failed to load image".to_string())
            } else {
                Ok(hbitmap)
            }
        }
    };

    let hbitmap = match hbitmap {
        Ok(bmp) => bmp,
        Err(e) => {
            eprintln!("{}", e);
            unsafe { CoUninitialize(); }
            std::process::exit(1);
        }
    };

    unsafe {
        // Get bitmap dimensions
        let mut bitmap_info: winapi::um::wingdi::BITMAP = std::mem::zeroed();
        winapi::um::wingdi::GetObjectW(
            hbitmap as _,
            std::mem::size_of::<winapi::um::wingdi::BITMAP>() as _,
            &mut bitmap_info as *mut _ as _,
        );
        
        let width = bitmap_info.bmWidth;
        let height = bitmap_info.bmHeight;
        
        // Get screen dimensions
        let screen_width = GetSystemMetrics(SM_CXSCREEN);
        let screen_height = GetSystemMetrics(SM_CYSCREEN);
        
        // Calculate safe ranges for random position
        let max_x = screen_width.saturating_sub(width);
        let max_y = screen_height.saturating_sub(height);
        
        // Generate random position with safe defaults
        let mut rng = rand::thread_rng();
        let pos_x = if max_x > 0 {
            rng.gen_range(0..max_x)
        } else {
            0
        };
        let pos_y = if max_y > 0 {
            rng.gen_range(0..max_y)
        } else {
            0
        };
        
        // Register window class
        let instance = GetModuleHandleW(ptr::null_mut());
        let class_name = to_wstring(WINDOW_CLASS);
        let mut wc: WNDCLASSEXW = std::mem::zeroed();
        wc.cbSize = std::mem::size_of::<WNDCLASSEXW>() as u32;
        wc.lpfnWndProc = Some(window_proc);
        wc.hInstance = instance;
        wc.hIcon = LoadIconW(ptr::null_mut(), IDI_APPLICATION);
        wc.hCursor = LoadCursorW(ptr::null_mut(), IDC_ARROW);
        wc.hbrBackground = (winapi::um::winuser::COLOR_WINDOW + 1) as _;
        wc.lpszClassName = class_name.as_ptr() as LPCWSTR;
        
        if RegisterClassExW(&wc) == 0 {
            eprintln!("Failed to register window class");
            CoUninitialize();
            std::process::exit(1);
        }
        
        // Create window
        let hwnd = CreateWindowExW(
            WS_EX_LAYERED | WS_EX_TOPMOST | WS_EX_TOOLWINDOW,
            class_name.as_ptr() as LPCWSTR,
            to_wstring("Image Viewer").as_ptr() as LPCWSTR,
            WS_POPUP | WS_VISIBLE,
            pos_x,
            pos_y,
            width,
            height,
            ptr::null_mut(),
            ptr::null_mut(),
            instance,
            ptr::null_mut(),
        );
        
        if hwnd.is_null() {
            eprintln!("Failed to create window");
            CoUninitialize();
            std::process::exit(1);
        }
        
        // Set layered window attributes for transparency
        winapi::um::winuser::SetLayeredWindowAttributes(
            hwnd,
            0,  // Color key (not used with alpha)
            255, // Default alpha
            winapi::um::winuser::LWA_ALPHA,
        );
        
        // Store bitmap handle in window user data
        winapi::um::winuser::SetWindowLongPtrW(
            hwnd,
            winapi::um::winuser::GWLP_USERDATA,
            hbitmap as isize,
        );
        
        UpdateWindow(hwnd);
        ShowWindow(hwnd, winapi::um::winuser::SW_SHOW);
        
        // Message loop
        let mut msg: MSG = std::mem::zeroed();
        while GetMessageW(&mut msg, ptr::null_mut(), 0, 0) > 0 {
            TranslateMessage(&msg);
            DispatchMessageW(&msg);
        }
        
        // Cleanup
        CoUninitialize();
    }
}