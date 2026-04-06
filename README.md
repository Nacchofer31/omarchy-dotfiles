# Dotfiles

My personal dotfiles, managed with [GNU Stow](https://www.gnu.org/software/stow/).

Fine-tuned for a terminal-centric workflow on Arch Linux with Hyprland.

## Key Components

- **OS**: [Arch Linux](https://archlinux.org/) with [Omarchy](https://omarchy.org)
- **Window Manager**: [Hyprland](https://hyprland.org/) (configured via Omarchy defaults + custom overrides)
- **Editor**: [Neovim](https://neovim.io/) via [LazyVim](https://www.lazyvim.org/)
- **Color Theme**: [Aether](https://github.com/bjarneo/aether.nvim) — deep dark background (`#050709`) with custom accent palette
- **Terminal**: [Ghostty](https://ghostty.org/) / [Alacritty](https://alacritty.org/) / [Kitty](https://sw.kovidgoyal.kitty)
- **Font**: [FiraCode Nerd Font](https://www.nerdfonts.com/)
- **Multiplexer**: [Tmux](https://github.com/tmux/tmux/wiki) (prefix: `Ctrl+Space`)
- **Shell**: Zsh + [Oh My Zsh](https://ohmyz.sh/) + [Starship](https://starship.rs/) prompt
- **Status Bar**: [Waybar](https://github.com/Alexays/Waybar)
- **App Launcher**: [Walker](https://github.com/abenz1267/walker)
- **Notifications**: [Mako](https://github.com/emersion/mako)
- **Version Manager**: [Mise](https://mise.jdx.dev/)
- **Git TUI**: [Lazygit](https://github.com/jesseduffield/lazygit)
- **Docker TUI**: [Lazydocker](https://github.com/jesseduffield/lazydocker)
- **System Monitor**: [Btop](https://github.com/aristocratos/btop)

## Keybindings

### Hyprland (SUPER = Win key)

| Shortcut | Action |
|---|---|
| `SUPER + Return` | Open terminal |
| `SUPER + Alt + Return` | Open terminal with Tmux |
| `SUPER + Shift + Return` | Open browser |
| `SUPER + Shift + N` | Open Neovim |
| `SUPER + Shift + M` | Spotify |
| `SUPER + Shift + D` | Lazydocker |
| `SUPER + Shift + V` | VSCode |
| `SUPER + Shift + /` | 1Password |
| `SUPER + Shift + A` | ChatGPT |
| `SUPER + Shift + C` | Claude |
| `SUPER + Shift + E` | Email (Hey) |
| `SUPER + Alt + ←/→` | Navigate workspaces |
| `SUPER + Ctrl + ←/→` | Move window to workspace |

### Tmux (prefix: `Ctrl+Space`)

| Shortcut | Action |
|---|---|
| `prefix + h` | Horizontal split |
| `prefix + v` | Vertical split |
| `prefix + x` | Kill pane |
| `prefix + c` | New window |
| `prefix + k` | Kill window |
| `Alt + 1-9` | Switch to window N |
| `Alt + ←/→` | Previous/next window |
| `Alt + ↑/↓` | Previous/next session |
| `Ctrl+Alt + ←/→/↑/↓` | Navigate panes |

## Installation

### Prerequisites

```sh
# Arch Linux
sudo pacman -S stow git

# Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### Clone and stow

```sh
git clone <your-repo-url> ~/dotfiles
cd ~/dotfiles

# Stow everything
for pkg in zsh bash vim starship hypr waybar nvim tmux git alacritty ghostty kitty lazygit lazydocker btop fastfetch mako walker mise swayosd; do
  stow $pkg
done

# Or just what you need
stow nvim
stow tmux
stow zsh
```

> I'd suggest picking and choosing rather than blindly stowing everything — especially `hypr` and `waybar`, which are tuned for my monitor setup.

### Tmux plugins

After stowing tmux:

```sh
rm -rf ~/.tmux/plugins && tmux new-session -d && tmux kill-session
```

Then open tmux and press `Ctrl+Space` + `I` to install all plugins.

### Transfer files from another machine

```sh
rsync -avy --progress user@192.168.1.x:~/.ssh ~/
rsync -avy --progress user@192.168.1.x:~/.local/share/zoxide ~/.local/share/
rsync -avy --progress user@192.168.1.x:~/Documents/ ~/Documents/
rsync -avy --progress user@192.168.1.x:~/Pictures/ ~/Pictures/
```

## Structure

```
dotfiles/
├── alacritty/    # Alacritty terminal config
├── bash/         # .bashrc, .bash_profile, .profile
├── btop/         # Btop system monitor
├── fastfetch/    # Fastfetch system info
├── ghostty/      # Ghostty terminal config
├── git/          # Global gitignore
├── hypr/         # Hyprland WM (bindings, monitors, idle, lock…)
├── kitty/        # Kitty terminal config
├── lazydocker/   # Lazydocker config
├── lazygit/      # Lazygit config
├── mako/         # Mako notification daemon
├── mise/         # Mise tool version manager
├── nvim/         # Neovim (LazyVim) config
├── starship/     # Starship prompt
├── swayosd/      # SwayOSD volume/brightness overlay
├── tmux/         # Tmux config
├── vim/          # Vim config
├── walker/       # Walker app launcher
├── waybar/       # Waybar status bar
└── zsh/          # .zshrc
```
