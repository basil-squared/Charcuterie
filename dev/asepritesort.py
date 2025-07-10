import subprocess
import os
from pathlib import Path
from tqdm import tqdm

ss_path = Path("./spritesheets/")

num_files = sum(1 for x in ss_path.rglob("*.aseprite") if x.is_file())
num_non_ase = sum(1 for x in ss_path.rglob("*") if x.is_file())

if num_non_ase > num_files:
    print("ERROR! Non aseprite files not permitted in stylesheets folder")
    exit(1)

filelist = os.listdir(ss_path)

# Initialize progress bar with total number of files
progress_bar = tqdm(filelist, desc="Converting files", unit="file")

for filename in progress_bar:
    name = filename.replace(".aseprite", "")
    progress_bar.set_postfix_str(
        f"Current: {name}"
    )  # Show current file in progress bar

    if filename == "blindatlas.aseprite":
        # Special handling for blindatlas.aseprite with 21 frames per row
        # 1x export
        subprocess.run(
            [
                "aseprite",
                "-b",
                "--sheet",
                f"../assets/1x/{name}.png",
                f"./spritesheets/{filename}",
                "--sheet-columns",
                "21",
            ],
            stdout=subprocess.DEVNULL,
            stderr=subprocess.DEVNULL,
        )
        # 2x export
        subprocess.run(
            [
                "aseprite",
                "-b",
                "--sheet",
                f"../assets/2x/{name}.png",
                f"./spritesheets/{filename}",
                "--sheet-columns",
                "21",
                "--scale",
                "2",
            ],
            stdout=subprocess.DEVNULL,
            stderr=subprocess.DEVNULL,
        )
    elif filename == 'joker_atlas2.aseprite':
        subprocess.run(
            [
                "aseprite",
                "-b",
                "--sheet",
                f"../assets/1x/{name}.png",
                f"./spritesheets/{filename}",
                "--sheet-columns",
                "10",
            ],
            stdout=subprocess.DEVNULL,
            stderr=subprocess.DEVNULL,
        )
        # 2x export
        subprocess.run(
            [
                "aseprite",
                "-b",
                "--sheet",
                f"../assets/2x/{name}.png",
                f"./spritesheets/{filename}",
                "--sheet-columns",
                "10",
                "--scale",
                "2",
            ],
            stdout=subprocess.DEVNULL,
            stderr=subprocess.DEVNULL,
        )
    elif filename == 'ritualatlas.aseprite':
        subprocess.run(
            [
                "aseprite",
                "-b",
                "--sheet",
                f"../assets/1x/{name}.png",
                f"./spritesheets/{filename}",
                "--sheet-columns",
                "7",
            ],
            stdout=subprocess.DEVNULL,
            stderr=subprocess.DEVNULL,
        )
        # 2x export
        subprocess.run(
            [
                "aseprite",
                "-b",
                "--sheet",
                f"../assets/2x/{name}.png",
                f"./spritesheets/{filename}",
                "--sheet-columns",
                "7",
                "--scale",
                "2",
            ],
            stdout=subprocess.DEVNULL,
            stderr=subprocess.DEVNULL,
        )
    else:
        # Original 1x export
        subprocess.run(
            [
                "aseprite",
                "-b",
                "--sheet",
                f"../assets/1x/{name}.png",
                f"./spritesheets/{filename}",
            ],
            stdout=subprocess.DEVNULL,
            stderr=subprocess.DEVNULL,
        )
        # Original 2x export
        subprocess.run(
            [
                "aseprite",
                "-b",
                "--sheet",
                f"../assets/2x/{name}.png",
                f"./spritesheets/{filename}",
                "--scale",
                "2",
            ],
            stdout=subprocess.DEVNULL,
            stderr=subprocess.DEVNULL,
        )

progress_bar.close()
