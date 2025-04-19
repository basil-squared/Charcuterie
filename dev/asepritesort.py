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

    # 1x export (suppress stdout)
    subprocess.run(
        [
            "aseprite",
            "-b",
            "--sheet",
            f"assets/1x/{name}.png",
            f"./spritesheets/{filename}",
        ],
        stdout=subprocess.DEVNULL,  # Suppress stdout
        stderr=subprocess.DEVNULL,  # Optionally suppress stderr too
    )

    # 2x export (suppress stdout)
    subprocess.run(
        [
            "aseprite",
            "-b",
            "--sheet",
            f"assets/2x/{name}.png",
            f"./spritesheets/{filename}",
            "--scale",
            "2",
        ],
        stdout=subprocess.DEVNULL,  # Suppress stdout
        stderr=subprocess.DEVNULL,  # Optionally suppress stderr too
    )

progress_bar.close()
