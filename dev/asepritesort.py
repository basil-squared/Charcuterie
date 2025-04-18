import subprocess
import os
from pathlib import Path

ss_path = Path("./spritesheets/")


num_files = sum(1 for x in ss_path.rglob("*.aseprite") if x.is_file())
num_non_ase = sum(1 for x in ss_path.rglob("*") if x.is_file)

if num_non_ase > num_files:
    print("ERROR! Non aseprite files not permitted in stylesheets folder")
    exit(1)

newfilelist = []

filelist = os.listdir(ss_path)


for i in range(num_files):
    newfilelist.append(filelist[i].replace(".aseprite", ""))
    print(newfilelist[i])
    subprocess.run(
        [
            "aseprite",
            "-b",
            "--sheet",
            "../assets/1x/" + newfilelist[i] + ".png",
            "./spritesheets/" + newfilelist[i] + ".aseprite",
        ]
    )
    subprocess.run(
        [
            "aseprite",
            "-b",
            "--sheet",
            "../assets/2x/" + newfilelist[i] + ".png",
            "./spritesheets/" + newfilelist[i] + ".aseprite",
            "--scale",
            "2",
        ]
    )
