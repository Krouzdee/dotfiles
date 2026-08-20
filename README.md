# Hyprland Dotfiles

A clean and functional Hyprland configuration managed with `GNU Stow`. This setup features the **Noctalia Shell**.

---

## Preview

![Desktop Screenshot](images/image.png)

---

## Features

*   **Window Manager:** Hyprland
*   **Shell/Bar/Launcher:** [Noctalia Shell](https://github.com/noctalia-dev/noctalia-shell) 
*   **Terminal:** Foot
*   **File Manager:** Thunar
*   **Workflow:** Symlink-based management using `stow`.

---

## Dependencies

Ensure you have the following programs installed:


| Category | Application |
| :--- | :--- |
| **Core** | `hyprland`, `noctalia`, `stow` |
| **Terminal** | `foot` |
| **GUI Apps** | `thunar`, `firefox`, `vscodium` |
| **Utilities** | `wl-clipboard` |

---

## Installation

### Manual Setup
If you are on another distribution or want manual control:
1. Manually install the [Dependencies](#-dependencies).
2. Clone the repo and use `stow` (or manually copy configs):
   ```bash
   stow -R .
   ```

## Keybindings

The main modifier key is `SUPER` (Windows key).

### System & Applications
*   `SUPER + T` - Open Terminal
*   `SUPER + Shift + T` - Floating Terminal
*   `SUPER + Q` - Close Active Window
*   `SUPER + E` - Open Thunar (File Manager)
*   `SUPER + W` - Open Firefox
*   `SUPER + B` - Open VSCodium
*   `SUPER + D` - Noctalia App Launcher
*   `SUPER + L` - Lock Screen
*   `Ctrl + Alt + Del` - Exit Hyprland

### Window Management
*   `SUPER + Space` - Toggle Floating & Center
*   `SUPER + P` - Pin
*   `SUPER + Arrow Keys` - Move Focus
*   `SUPER + Shift + Arrow Keys` - Move Window
*   `SUPER + Alt + Arrow Keys` - Resize Window
*   `SUPER + Shift + F` - Toggle Fullscreen

### Utilities
*   `SUPER + Shift + S` - Screenshot (Region)


---


