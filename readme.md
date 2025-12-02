# Dotfiles

Configs I use daily for terminal and VS Code. Everything lives in simple files to copy or symlink.

- `alacritty.toml`: terminal base (padding, opacity, MesloLGS Nerd Font).
- `aura-theme.toml`: Aura theme palette loaded by Alacritty.
- `vscode/settings.json`: editor prefs (JetBrains Mono, minimap off, format-on-save, file nesting, etc.).

## Prerequisites
- Install MesloLGS Nerd Font and JetBrains Mono.
- Have Alacritty and VS Code installed.

## How to use
1. Clone or download this repo into `~/projetos/dotfiles` or any directory you prefer.
2. Alacritty:
   - Copy `alacritty.toml` to `~/.config/alacritty/alacritty.toml`.
   - Copy `aura-theme.toml` to `~/.config/alacritty/aura-theme.toml` (the main file already imports this theme).
3. VS Code:
   - Copy `vscode/settings.json` to the VS Code user folder. On macOS: `~/Library/Application Support/Code/User/settings.json`. On Linux: `~/.config/Code/User/settings.json`.

## Notes
- Review before using on another machine and adjust anything specific to your setup (e.g., font paths or terminal profiles).
- If using Windows/WSL, adapt the paths to the system layout.
