#!/usr/bin/env python3

import os
import subprocess
from pathlib import Path
import shutil
import sys

PACKAGES = ["hyprland", "foot", "thunar", "fastfetch", "hyprpicker", "hyprshot", "cliphist", "wl-clipboard", "noctalia-shell"]
DOTFILES_DIR = Path.home() / "dotfiles"
STOW_FOLDERS = ["hypr", "foot", "fastfetch", "fish"]


def install_yay():
    print("--- Checked and Install yay ---")
    if shutil.which("yay"):
        print("yay is already installed")
        return True
    else:
        print("yay is not found")
        print("Starting installation...")
    
    print("Install base-devel")
    subprocess.run(["sudo", "pacman", "-S", "--noconfirm", "base-devel", "git"], check=True)

    build_dir = Path.home() / "yay_build"

    try:
        if build_dir.exists():
            shutil.rmtree(build_dir)

        subprocess.run(["git", "clone", "https://aur.archlinux.org/yay-bin.git", str(build_dir)], check=True)

        subprocess.run(["makepkg", "-si", "--noconfirm"], cwd=build_dir, check=True)

        print("yay installation was successful")
        return True
    except Exception as e:
        print(f"error... {e}")
        return False
    finally:
        if build_dir.exists():
            shutil.rmtree(build_dir)


def install_packages(packages):
    print("--- Starting installation packages ---")

    try:
        subprocess.run(["yay", "-S", "--needed", "--noconfirm", "--answerdiff", "None"] + packages, check=True)
    except Exception as e:
        print(f"error... {e}")


def setup_dotfiles():
    print("--- Linking dotfiles with GNU Stow ---")
    
    if not shutil.which("stow"):
        print("Installing GNU Stow...")
        subprocess.run(["sudo", "pacman", "-S", "--noconfirm", "stow"], check=True)

    if not DOTFILES_DIR.exists():
        print(f"Error: {DOTFILES_DIR} not found!")
        return

    for folder in STOW_FOLDERS:
        print(f"Stowing {folder}...")

        try:
            subprocess.run(["stow", "-R", folder], cwd=DOTFILES_DIR, check=True)
        except subprocess.CalledProcessError:
            print(f"Failed to stow {folder}")

def main():
    print("--- Arch Setup Dotfiles Tool ---")

    if install_yay():
        install_packages(PACKAGES)
        setup_dotfiles()

    print("--- All done! ---")

if __name__ == "__main__":
    main()