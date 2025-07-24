# Dotfiles Collection

This repository contains my personal configuration files (dotfiles) for various Linux tools and environments. It allows quick setup and management of my development and desktop environment across machines.

## Technologies & Tools Included

- **GNU Stow**: Manages symlinks for configuration files. Recommended way to deploy configs.
- **Neovim**: Custom editor setup, managed as a git submodule.
- **Sway**: Wayland compositor for tiling window management.
- **Swayidle**: Idle management for Sway.
- **Swaylock**: Screen locker for Sway.
- **Swaync**: Notification center for Sway.
- **Tmux**: Terminal multiplexer for productivity.
- **Wezterm**: GPU-accelerated terminal emulator.
- **Wofi**: Application launcher for Wayland.
- **Kanshi**: Dynamic display profile management.
- **xdg-desktop-portal**: Desktop integration for sandboxed apps.
- **Starship**: Minimal, customizable shell prompt.
- **zsh**: Shell configuration (.zshenv).
- **Vim Spellfiles**: Custom spell checking for Neovim.

## Usage

1. **Clone the repository**

   ```sh
   git clone --recursive https://github.com/yourusername/dotfiles.git
   cd dotfiles
   ```

2. **Deploy with GNU Stow**

   To symlink configs to your home directory:
   ```sh
   stow .
   ```
   You can also stow only specific modules, e.g.:
   ```sh
   stow tmux
   stow sway
   ```

## Notes
- I use an ansible role to setup all my computer
- Ensure all software dependencies are installed for each config.
- Some configs are tailored for Wayland environments (Sway, Wofi, etc).

## Folder Structure
- Each subfolder contains configuration for a specific technology.
- `.stowrc` provides stow settings; `.zshenv` is your shell config.

---

Feel free to fork or adapt for your own setup!
