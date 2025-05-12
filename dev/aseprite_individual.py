import subprocess
import sys
from pathlib import Path
from tqdm import tqdm

def main():
    # Setup paths
    ss_path = Path("./spritesheets/")
    export_base = Path("./exports/individual/")

    # Verify spritesheets directory exists
    if not ss_path.exists():
        print(f"ERROR: Spritesheets directory not found at {ss_path.resolve()}")
        sys.exit(1)

    # Verify Aseprite is available
    try:
        subprocess.run(["aseprite", "--version"],
                      check=True,
                      stdout=subprocess.DEVNULL,
                      stderr=subprocess.DEVNULL)
    except (subprocess.CalledProcessError, FileNotFoundError):
        print("ERROR: Aseprite not found. Please install Aseprite and ensure it's in your PATH")
        sys.exit(1)

    # Get Aseprite files
    filelist = list(ss_path.glob("*.aseprite"))
    if not filelist:
        print(f"ERROR: No .aseprite files found in {ss_path.resolve()}")
        sys.exit(1)

    # Initialize progress bar
    progress_bar = tqdm(filelist, desc="Exporting frames", unit="file")

    for filepath in progress_bar:
        sprite_name = filepath.stem
        progress_bar.set_postfix_str(f"Processing: {sprite_name}")

        for scale in [1, 2]:
            # Create sprite-specific output directory
            output_dir = export_base / sprite_name / f"{scale}x"
            output_dir.mkdir(parents=True, exist_ok=True)

            # Build Aseprite command
            cmd = [
                "aseprite",
                "-b",
                str(filepath),  # Source document
                "--save-as",
                str(output_dir / f"frame_{{frame4}}.png")  # Output pattern
            ]

            if scale > 1:
                cmd.insert(3, "--scale")
                cmd.insert(4, str(scale))

            print(f"Exporting to: {output_dir}")  # Debug output

            try:
                result = subprocess.run(
                    cmd,
                    capture_output=True,
                    text=True
                )

                if result.returncode != 0:
                    print(f"\nERROR processing {sprite_name} at {scale}x:")
                    print(result.stderr)

            except Exception as e:
                print(f"\nEXCEPTION processing {filepath}: {str(e)}")

    progress_bar.close()

    # Verify exports
    exported_files = list(export_base.rglob("*.png"))
    if not exported_files:
        print("\nERROR: No files exported. Please check:")
        print("1. Your Aseprite files contain frames")
        print("2. Try running this command manually:")
        print(f"aseprite -b ./spritesheets/example.aseprite --save-as ./exports/individual/example/1x/frame_{{frame4}}.png")
    else:
        print(f"\nSuccess! Exported {len(exported_files)} frames")
        print(f"Files organized in: {export_base.resolve()}")

if __name__ == "__main__":
    main()