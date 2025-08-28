# Dotfiles Configuration

A comprehensive dotfiles repository featuring a cohesive Catppuccin-themed Linux desktop environment with i3wm, optimized for development and daily use.

## 🛠️ Tools and Versions

### Window Manager & Desktop
- **i3wm** (v4) - Tiling window manager with vim-like keybindings
- **Polybar** - Status bar with custom modules (VPN, dual WiFi, system metrics)
- **Rofi** - Application launcher with icon support
- **Picom** - Compositor with GLX backend and vsync

### Terminal Environment
- **Kitty** - Primary terminal (Catppuccin Macchiato theme, 85% opacity)
- **Alacritty** - Secondary terminal (Catppuccin Mocha theme, 90% opacity)
- **Zsh** - Shell with extensive aliases and modern tool integration
- **Oh My Posh** - Primary prompt (Catppuccin Mocha theme)
- **Starship** - Alternative prompt with comprehensive language support

### Development Environment
- **Neovim** - LazyVim distribution v8 with 40+ plugins
  - Claude Code integration for AI assistance
  - Full IDE setup with LSP, formatting, linting
  - Language support: Python, JavaScript, Go, Rust, and more
- **Tmux** - Terminal multiplexer with Catppuccin theme
- **Zellij** - Alternative terminal multiplexer with custom keybindings
- **Direnv** - Environment variable management

### System Tools
- **ASDF** - Version manager for multiple languages
- **Zoxide** - Smart directory navigation
- **Flameshot** - Screenshot utility
- **Tailscale** - VPN with status integration

## 🎨 Theme & Consistency

**Primary Theme:** Catppuccin Mocha (dark variant)
- Consistent color palette across all applications
- MesloLGS Nerd Font throughout the system
- Pink accent colors for focused elements
- 90% opacity terminals with subtle transparency

## 📁 Repository Structure

The repository uses GNU Stow for symlink management:

```
dotfiles/
├── alacritty/     → ~/.config/alacritty/
├── backgrounds/   → Wallpaper collection
├── direnv/        → ~/.config/direnv/
├── i3/           → ~/.config/i3/
├── kitty/        → ~/.config/kitty/ & ~/.kitty/
├── neofetch/     → ~/.config/neofetch/
├── nvim/         → ~/.config/nvim/
├── ohmyposh/     → ~/.config/ohmyposh/
├── picom/        → ~/.config/picom/
├── polybar/      → ~/.config/polybar/
├── rofi/         → ~/.config/rofi/
├── starship/     → ~/.config/starship.toml
├── tmux/         → ~/.tmux.conf
├── zellij/       → ~/.config/zellij/
└── zsh/          → ~/.zshrc
```

## 🚀 Installation with Stow

### Prerequisites

Install GNU Stow and the required applications:

```bash
# On Arch Linux/Manjaro
sudo pacman -S stow i3-wm polybar rofi picom kitty alacritty zsh tmux neovim

# Additional tools
yay -S oh-my-posh starship zellij direnv asdf-vm
```

### Stow Configuration

1. **Clone the repository:**
   ```bash
   cd ~
   git clone <your-repo-url> dotfiles
   cd dotfiles
   ```

2. **Install all configurations:**
   ```bash
   stow alacritty i3 nvim polybar rofi starship tmux zsh zellij picom direnv ohmyposh kitty
   ```

3. **Or install selectively:**
   ```bash
   # Core desktop environment
   stow i3 polybar rofi picom
   
   # Terminal setup
   stow kitty alacritty zsh tmux
   
   # Development environment
   stow nvim direnv
   ```

### Manual Steps

1. **Set Zsh as default shell:**
   ```bash
   chsh -s $(which zsh)
   ```

2. **Install fonts:**
   - Download MesloLGS Nerd Font
   - Place in `~/.local/share/fonts/`
   - Run `fc-cache -fv`

3. **Neovim setup:**
   ```bash
   # LazyVim will auto-install on first launch
   nvim
   ```

## 🔧 Key Features

### i3wm Customizations
- **Vim navigation:** hjkl for window movement
- **Pink borders** for focused windows
- **10px gaps** inner and outer
- **Custom keybindings:**
  - `$mod+b` - Brave browser
  - `$mod+e` - Thunar file manager
  - `$mod+Ctrl+l` - Lock screen

### Polybar Modules
- **Workspaces** with custom styling
- **Dual WiFi** monitoring (`wlp0s20f3` and `wlp0s20f0u2`)
- **Tailscale VPN** with exit node status
- **System metrics** (CPU, memory, filesystem)
- **Audio controls** with volume display
- **Battery** with charging status
- **Date/time** formatting

### Shell Enhancements
- **20+ aliases** for common operations
- **direnv** integration for project environments
- **ASDF** for language version management
- **Modern replacements:** `exa` for `ls`, `zoxide` for `cd`

### Development Features
- **Claude Code** integration in Neovim
- **Comprehensive LSP** support
- **Auto-formatting** and linting
- **Tmux navigation** integration
- **Session persistence**

## 🔄 Updating

To update configurations:

```bash
cd ~/dotfiles
git pull origin main

# Restow if needed
stow -R <package-name>
```

## 📋 Package Management

Each directory represents a "stow package" that can be managed independently:

```bash
# Install a package
stow <package-name>

# Remove a package
stow -D <package-name>

# Reinstall (useful after updates)
stow -R <package-name>

# Dry run to see what would happen
stow -n <package-name>
```

## 🎯 Customization Tips

1. **Colors:** All tools use Catppuccin colors defined in each config
2. **Fonts:** MesloLGS Nerd Font is used throughout - update all configs if changing
3. **Keybindings:** Consistent vim-like navigation across i3, tmux, and zellij
4. **Modules:** Polybar modules can be easily enabled/disabled in the config

## 🚨 Notes

- **Network interfaces** in Polybar are system-specific - update `wlan0` and `wlan1` as needed
- **VPN module** requires Tailscale - remove if not using
- **Neovim plugins** will auto-install on first launch
- **Backup files** (`.bak`) are preserved for safety - can be removed after testing

This configuration provides a modern, consistent, and highly functional Linux desktop environment optimized for development work.