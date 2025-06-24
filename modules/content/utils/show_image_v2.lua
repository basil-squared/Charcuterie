-- show_image_v2.lua
local ffi = require("ffi")

-- Windows API definitions
ffi.cdef[[
    typedef void* HANDLE;
    typedef HANDLE HWND;
    typedef HANDLE HDC;
    typedef HANDLE HINSTANCE;
    typedef HANDLE HBITMAP;
    typedef unsigned long DWORD;
    typedef int BOOL;
    typedef long LONG;
    typedef unsigned long ULONG_PTR;
    typedef unsigned short WORD;
    typedef unsigned short ATOM;
    typedef unsigned short WPARAM;
    typedef unsigned short LPARAM;
    typedef unsigned long LRESULT;
    typedef unsigned int UINT;
    typedef char BYTE;
    
    typedef struct {
        LONG left;
        LONG top;
        LONG right;
        LONG bottom;
    } RECT;
    
    typedef struct {
        DWORD   biSize;
        LONG    biWidth;
        LONG    biHeight;
        WORD    biPlanes;
        WORD    biBitCount;
        DWORD   biCompression;
        DWORD   biSizeImage;
        LONG    biXPelsPerMeter;
        LONG    biYPelsPerMeter;
        DWORD   biClrUsed;
        DWORD   biClrImportant;
    } BITMAPINFOHEADER;
    
    typedef struct {
        BITMAPINFOHEADER bmiHeader;
        DWORD            bmiColors[1];
    } BITMAPINFO;
    
    HWND GetDesktopWindow(void);
    BOOL GetClientRect(HWND hWnd, RECT* lpRect);
    int GetSystemMetrics(int nIndex);
    BOOL DeleteObject(HANDLE hObject);
    
    HDC GetDC(HWND hWnd);
    int ReleaseDC(HWND hWnd, HDC hDC);
    HBITMAP LoadImageA(HINSTANCE hInst, const char* name, unsigned int type, 
                      int cx, int cy, unsigned int fuLoad);
    HBITMAP CreateCompatibleDC(HDC hDC);
    HANDLE SelectObject(HDC hdc, HANDLE hgdiobj);
    BOOL BitBlt(HDC hdcDest, int xDest, int yDest, int wDest, int hDest, 
                HDC hdcSrc, int xSrc, int ySrc, DWORD rop);
    
    typedef struct {
        DWORD        cbSize;
        unsigned int style;
        void*        lpfnWndProc;
        int          cbClsExtra;
        int          cbWndExtra;
        HINSTANCE    hInstance;
        void*        hIcon;
        void*        hCursor;
        void*        hbrBackground;
        const char*  lpszMenuName;
        const char*  lpszClassName;
    } WNDCLASSA;
    
    typedef struct {
        DWORD cbSize;
        DWORD style;
        void* lpfnWndProc;
        int   cbClsExtra;
        int   cbWndExtra;
        HINSTANCE hInstance;
        void* hIcon;
        void* hCursor;
        void* hbrBackground;
        const char* lpszMenuName;
        const char* lpszClassName;
        void* hIconSm;
    } WNDCLASSEXA;
    
    ATOM RegisterClassExA(const WNDCLASSEXA*);
    HWND CreateWindowExA(DWORD dwExStyle, const char* lpClassName, const char* lpWindowName,
                         DWORD dwStyle, int x, int y, int nWidth, int nHeight,
                         HWND hWndParent, void* hMenu, HINSTANCE hInstance, void* lpParam);
    BOOL ShowWindow(HWND hWnd, int nCmdShow);
    BOOL UpdateWindow(HWND hWnd);
    BOOL DestroyWindow(HWND hWnd);
    BOOL GetMessageA(void* lpMsg, HWND hWnd, unsigned int wMsgFilterMin, unsigned int wMsgFilterMax);
    BOOL TranslateMessage(const void* lpMsg);
    LONG DispatchMessageA(const void* lpMsg);
    void PostQuitMessage(int nExitCode);
    LONG SetWindowLongA(HWND hWnd, int nIndex, LONG dwNewLong);
    
    // Added missing functions
    HINSTANCE GetModuleHandleA(const char* lpModuleName);
    int GetObjectA(HANDLE h, int c, void* pv);
    LONG DefWindowProcA(HWND hWnd, unsigned int Msg, WPARAM wParam, LPARAM lParam);
    BOOL BeginPaint(HWND hwnd, void* lpPaint);
    BOOL EndPaint(HWND hwnd, const void* lpPaint);
]]

-- Constants
local SM_CXSCREEN = 0
local SM_CYSCREEN = 1
local LR_LOADFROMFILE = 0x10
local IMAGE_BITMAP = 0
local WS_POPUP = 0x80000000
local WS_VISIBLE = 0x10000000
local WS_EX_TOPMOST = 0x8
local WS_EX_TOOLWINDOW = 0x80
local CW_USEDEFAULT = 0x80000000
local SRCCOPY = 0x00CC0020
local WM_DESTROY = 0x2
local WM_PAINT = 0xF
local WM_LBUTTONDOWN = 0x201
local WM_CLOSE = 0x10
local GWL_USERDATA = -21
local SW_SHOWNORMAL = 1

-- Global variables
local image_path = ...
local hbitmap = nil
local img_width, img_height = 0, 0

-- Create a struct for PAINTSTRUCT
ffi.cdef[[
    typedef struct tagPAINTSTRUCT {
        HDC  hdc;
        BOOL fErase;
        RECT rcPaint;
        BOOL fRestore;
        BOOL fIncUpdate;
        BYTE rgbReserved[32];
    } PAINTSTRUCT;
]]

-- Create FFI callback type for window procedure
local WndProc_t = ffi.typeof("LRESULT (*)(HWND, UINT, WPARAM, LPARAM)")

-- Window procedure implementation
local function wndProcFunc(hwnd, msg, wparam, lparam)
    if msg == WM_PAINT then
        local ps = ffi.new("PAINTSTRUCT")
        local hdc = ffi.C.BeginPaint(hwnd, ps)
        
        if hbitmap ~= nil then
            local hdc_mem = ffi.C.CreateCompatibleDC(hdc)
            local old_bmp = ffi.C.SelectObject(hdc_mem, hbitmap)
            ffi.C.BitBlt(hdc, 0, 0, img_width, img_height, hdc_mem, 0, 0, SRCCOPY)
            ffi.C.SelectObject(hdc_mem, old_bmp)
            ffi.C.DeleteDC(hdc_mem)
        end
        
        ffi.C.EndPaint(hwnd, ps)
        return 0
    elseif msg == WM_LBUTTONDOWN or msg == WM_CLOSE then
        ffi.C.DestroyWindow(hwnd)
        return 0
    elseif msg == WM_DESTROY then
        ffi.C.PostQuitMessage(0)
        return 0
    end
    
    return ffi.C.DefWindowProcA(hwnd, msg, wparam, lparam)
end

-- Create the callback
local wndproc_cb = ffi.cast(WndProc_t, wndProcFunc)

-- Main function
function CHAR.FUNC.show_image(path)
    -- Load image
    hbitmap = ffi.C.LoadImageA(nil, path, IMAGE_BITMAP, 0, 0, LR_LOADFROMFILE)
    if hbitmap == nil then
        print("Failed to load image: " .. path)
        return false
    end
    
    -- Get image dimensions
    local bitmap_info = ffi.new("BITMAPINFO")
    ffi.C.GetObjectA(hbitmap, ffi.sizeof("BITMAPINFO"), ffi.cast("void*", bitmap_info))
    img_width = bitmap_info.bmiHeader.biWidth
    img_height = math.abs(bitmap_info.bmiHeader.biHeight)
    
    -- Get screen dimensions
    local screen_width = ffi.C.GetSystemMetrics(SM_CXSCREEN)
    local screen_height = ffi.C.GetSystemMetrics(SM_CYSCREEN)
    
    -- Calculate random position
    math.randomseed(os.time())
    local pos_x = math.random(0, math.max(0, screen_width - img_width))
    local pos_y = math.random(0, math.max(0, screen_height - img_height))
    
    -- Register window class
    local wc = ffi.new("WNDCLASSEXA")
    wc.cbSize = ffi.sizeof("WNDCLASSEXA")
    wc.lpfnWndProc = wndproc_cb
    wc.hInstance = ffi.C.GetModuleHandleA(nil)
    wc.lpszClassName = "ImageWindowClass"
    
    if ffi.C.RegisterClassExA(wc) == 0 then
        print("Failed to register window class")
        return false
    end
    
    -- Create window
    local exStyle = WS_EX_TOPMOST + WS_EX_TOOLWINDOW
    local style = WS_POPUP + WS_VISIBLE
    
    local hwnd = ffi.C.CreateWindowExA(
        exStyle,
        "ImageWindowClass",
        "Image Viewer",
        style,
        pos_x,
        pos_y,
        img_width,
        img_height,
        nil,
        nil,
        wc.hInstance,
        nil
    )
    
    if hwnd == nil then
        print("Failed to create window")
        return false
    end
    
    -- Store bitmap handle in window user data
    ffi.C.SetWindowLongA(hwnd, GWL_USERDATA, ffi.cast("LONG", hbitmap))
    
    -- Show window
    ffi.C.ShowWindow(hwnd, SW_SHOWNORMAL)
    ffi.C.UpdateWindow(hwnd)
    
    -- Message loop
    local msg = ffi.new("MSG")
    while ffi.C.GetMessageA(msg, nil, 0, 0) ~= 0 do
        ffi.C.TranslateMessage(msg)
        ffi.C.DispatchMessageA(msg)
    end
    
    -- Cleanup
    if hbitmap ~= nil then
        ffi.C.DeleteObject(hbitmap)
    end
    
    return true
end

