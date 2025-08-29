# Automated Manjaro i3WM Setup with Ansible

This Ansible playbook automatically configures a clean Manjaro installation with i3wm, your dotfiles, and all essential development tools.

## Prerequisites

1. **Fresh Manjaro Installation** with minimal i3wm community edition
2. **Internet Connection** for package downloads
3. **Ansible installed**:
   ```bash
   sudo pacman -S ansible
   ```

## What This Playbook Installs

### Core System
- **i3wm Desktop Environment**: i3-wm, i3status, i3lock, dmenu
- **Display Server**: Xorg with essential utilities
- **Login Manager**: LightDM with GTK greeter

### Terminal & Shell
- **Terminal Emulators**: Alacritty, Kitty
- **Shell**: Zsh with autosuggestions and syntax highlighting
- **Prompt**: Starship with Catppuccin Mocha theme
- **Terminal Multiplexer**: Tmux, Zellij

### Desktop Utilities
- **Status Bar**: Polybar (auto-configured as systemd service)
- **Launcher**: Rofi with Catppuccin theme
- **Compositor**: Picom for transparency and effects
- **Screenshot**: Flameshot
- **File Manager**: Thunar with plugins
- **Wallpaper**: Feh for background management

### Development Environment
- **Editor**: Neovim with LazyVim distribution
- **Version Managers**: ASDF for Node.js and Python
- **Containers**: Docker (from official source) and Docker Compose v2
- **Cloud Tools**: AWS CLI v2, Heroku CLI, kubectl
- **Environment**: direnv for project-specific configs
- **CLI Tools**: ripgrep, fd, bat, exa, zoxide, tree, htop

### Applications
- **Browser**: Brave
- **Code Editor**: Visual Studio Code
- **Communication**: Discord
- **Media**: Spotify, VLC
- **Office**: LibreOffice
- **Graphics**: GIMP

### System Services
- **Networking**: NetworkManager
- **Bluetooth**: Bluez with audio support
- **Audio**: PulseAudio with Bluetooth
- **VPN**: Tailscale
- **Containers**: Docker service (from official Docker repository)

### Fonts
- **Nerd Font**: MesloLGS (matches your dotfiles)
- **System Fonts**: Noto, DejaVu, Liberation, Open Sans

## Usage

1. **Clone your dotfiles** (if not already present):
   ```bash
   cd ~
   git clone https://github.com/joaoariedi/dotfiles.git
   cd dotfiles
   ```

2. **Run the Ansible playbook**:
   ```bash
   ansible-playbook -i ansible-inventory.ini setup-manjaro-i3.yml --ask-become-pass
   ```

3. **Follow the prompts** and enter your sudo password when requested

4. **Wait for completion** (15-30 minutes depending on internet speed)

## Post-Installation Steps

1. **Reboot your system**:
   ```bash
   sudo reboot
   ```

2. **Login and select i3** as your window manager at the login screen

3. **Complete Neovim setup**:
   ```bash
   nvim
   # LazyVim will auto-install all plugins on first launch
   ```

4. **Configure Tailscale** (if you use VPN):
   ```bash
   sudo tailscale up
   ```

5. **Test your setup**:
   - Press `$mod+Return` to open terminal (should be Alacritty)
   - Press `$mod+d` to open Rofi launcher
   - Check that Polybar is running at the top
   - Verify Starship prompt is active in terminal
   - Test new CLI tools: `docker --version`, `aws --version`, `heroku --version`, `kubectl version --client`

## Customization

### Dotfiles Repository
The playbook automatically clones and stows your dotfiles. To use a different repository, edit the `dotfiles_repo` variable in `setup-manjaro-i3.yml`:

```yaml
vars:
  dotfiles_repo: "https://github.com/yourusername/dotfiles.git"
```

### Package Selection
Modify the package lists in the playbook tasks to add/remove software:

```yaml
- name: Install additional packages
  pacman:
    name:
      - your-package-here
    state: present
```

### AUR Packages
Add more AUR packages to the loop in the "Install AUR packages" task:

```yaml
loop:
  - starship
  - your-aur-package-here
```

## Troubleshooting

### Font Issues
If MesloLGS font doesn't load properly:
```bash
fc-cache -fv
fc-list | grep -i meslo
```

### Stow Conflicts
If stow reports conflicts:
```bash
cd ~/dotfiles
stow -v alacritty  # Check what's conflicting
# Move conflicting files and re-run stow
```

### Service Issues
Check systemd services:
```bash
systemctl --user status polybar
systemctl status lightdm
systemctl status NetworkManager
```

### Display Configuration
For dual monitors, edit the display configuration task in the playbook or manually configure:
```bash
xrandr --output HDMI-1 --right-of eDP-1 --auto
```

## Manual Installation Alternative

If you prefer manual installation, follow the package lists in the playbook:

1. Install packages with `pacman` and `yay`
2. Clone and stow dotfiles
3. Install fonts manually
4. Configure services
5. Set zsh as default shell

## Security Notes

- The playbook installs packages from official repos and AUR
- User is added to docker group (review if needed)
- Tailscale VPN is installed but not automatically configured
- No SSH keys or sensitive data are configured automatically

This setup provides a complete, professional development environment matching your current configuration.