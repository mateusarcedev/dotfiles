<div align="center">

# dotfiles

**zsh · Alacritty · VS Code** — the configs I use every day, kept small enough to read in five minutes.

![macOS](https://img.shields.io/badge/macOS-000000?style=flat-square&logo=apple&logoColor=white)
![zsh](https://img.shields.io/badge/zsh-F15A24?style=flat-square&logo=zsh&logoColor=white)
![Alacritty](https://img.shields.io/badge/Alacritty-F46D01?style=flat-square&logo=alacritty&logoColor=white)
![VS Code](https://img.shields.io/badge/VS%20Code-007ACC?style=flat-square&logo=visualstudiocode&logoColor=white)
![Homebrew](https://img.shields.io/badge/Homebrew-FBB040?style=flat-square&logo=homebrew&logoColor=black)

</div>

---

## What's inside

| File | Goes to | What it does |
|---|---|---|
| [`.zshrc`](.zshrc) | `~/.zshrc` | Powerlevel10k prompt, shared history, autosuggestions, syntax highlighting, `eza` as `ls`, `zoxide` behind `cd` |
| [`alacritty.toml`](alacritty.toml) | `~/.config/alacritty/alacritty.toml` | Padding, 80% opacity with blur, MesloLGS Nerd Font Mono 16 |
| [`aura-theme.toml`](aura-theme.toml) | `~/.config/alacritty/aura-theme.toml` | Aura color palette, imported by `alacritty.toml` |
| [`vscode/settings.json`](vscode/settings.json) | VS Code user `settings.json` | JetBrains Mono, minimap off, format and ESLint fix on save, quiet UI |
| [`Brewfile`](Brewfile) | — | Every CLI dependency and font, installed with one command |

### Aura palette

![background](https://img.shields.io/badge/background-15141b-15141b?style=flat-square)
![foreground](https://img.shields.io/badge/foreground-edecee-edecee?style=flat-square)
![purple](https://img.shields.io/badge/purple-a277ff-a277ff?style=flat-square)
![green](https://img.shields.io/badge/green-61ffca-61ffca?style=flat-square)
![orange](https://img.shields.io/badge/orange-ffca85-ffca85?style=flat-square)
![red](https://img.shields.io/badge/red-ff6767-ff6767?style=flat-square)

---

## Requirements

- macOS with [Homebrew](https://brew.sh)
- [Alacritty](https://alacritty.org) and [VS Code](https://code.visualstudio.com)
- Everything else comes from the [`Brewfile`](Brewfile): `powerlevel10k`, `zsh-autosuggestions`, `zsh-syntax-highlighting`, `eza`, `zoxide`, MesloLGS Nerd Font and JetBrains Mono

> On Linux the files work as well, but the Alacritty window options (`decorations`, `blur`, `option_as_alt`) are macOS-only and ignored. The `.zshrc` skips any plugin that is not installed instead of failing.

---

## Install

**Read the files before linking them.** Nothing here runs automatically, and every existing file is backed up before being replaced.

```bash
# 1. Clone
git clone https://github.com/mateusarcedev/dotfiles.git ~/dotfiles
cd ~/dotfiles

# 2. Dependencies and fonts
brew bundle --file=Brewfile

# 3. Back up existing files (skips missing ones and existing symlinks)
backup() { [ -e "$1" ] && [ ! -L "$1" ] && mv "$1" "$1.bak.$(date +%Y%m%d%H%M%S)"; true; }
VSCODE_USER="$HOME/Library/Application Support/Code/User"   # Linux: ~/.config/Code/User

backup ~/.zshrc
backup ~/.config/alacritty/alacritty.toml
backup ~/.config/alacritty/aura-theme.toml
backup "$VSCODE_USER/settings.json"

# 4. Symlink, so edits in the repo apply immediately
mkdir -p ~/.config/alacritty "$VSCODE_USER"
ln -sfn "$PWD/.zshrc"               ~/.zshrc
ln -sfn "$PWD/alacritty.toml"       ~/.config/alacritty/alacritty.toml
ln -sfn "$PWD/aura-theme.toml"      ~/.config/alacritty/aura-theme.toml
ln -sfn "$PWD/vscode/settings.json" "$VSCODE_USER/settings.json"

# 5. Open a new shell; on first run, configure the prompt
p10k configure
```

To undo, remove the symlinks and restore the `*.bak.*` files.

---

## Shell notes

| Command | Behavior |
|---|---|
| `ls` | `eza` with icons and colors only on a terminal (`ls \| grep` stays plain) |
| `ll` | Compact long listing (no size, time or permissions) |
| `cd <path>` | Normal `cd`; when the path does not exist, `zoxide` jumps to the best match |
| `↑` / `↓` | Search history by the typed prefix |
| ` command` | A leading space keeps the command out of history — use it for anything with tokens or passwords |

The Powerlevel10k prompt config (`~/.p10k.zsh`) is generated per machine by `p10k configure` and is not versioned.

---

## Security

- No secrets live here. Tokens and machine-specific settings belong in an unversioned file, e.g. `~/.zshrc.local`, never in this repo.
- VS Code keeps workspace trust prompts on (`security.workspace.trust.untrustedFiles: "prompt"`).
- Review `git diff` before pulling changes onto another machine — symlinked files apply immediately.
