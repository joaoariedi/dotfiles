# Display Configuration with Arandr and i3

This directory contains automated display configuration scripts that integrate with arandr and i3 window manager.

## Features

- Automatic external monitor detection and setup
- Workspace assignment (external screen → workspace 1)
- Smart wallpaper configuration
- Integration with i3 window manager
- Multiple display configuration presets

## Scripts

### Main Scripts

- `smart-display-setup.sh` - Intelligent display detection and configuration
- `external-workspace-setup.sh` - External monitor setup with workspace assignment
- `set-wallpapers.sh` - Wallpaper configuration for dual monitors

### Legacy Scripts (from arandr)

- `arand.sh` - Dual monitor with external as primary
- `lg.sh` - Dual monitor with laptop as primary  
- `samsung.sh` - External monitor only

## Usage

### Automatic Setup

The configuration automatically runs on i3 startup via the i3 config:

```i3config
exec_always --no-startup-id ~/.screenlayout/smart-display-setup.sh
```

### Manual Control

Use these keybindings in i3:

- `$mod+Shift+d` - Run smart display setup
- `$mod+Shift+w` - Set wallpapers
- `$mod+Shift+F1` - External only (samsung.sh)
- `$mod+Shift+F2` - Laptop primary (lg.sh)
- `$mod+Shift+F3` - External primary (arand.sh)
- `$mod+Shift+F4` - Full setup with workspace assignment

### Command Line

```bash
# Smart setup (recommended)
~/.screenlayout/smart-display-setup.sh

# External monitor with workspace assignment
~/.screenlayout/external-workspace-setup.sh

# Set wallpapers only
~/.screenlayout/set-wallpapers.sh
```

## Configuration

### Wallpapers

Wallpapers are loaded from `~/dotfiles/backgrounds/nice-blue-background.png`

To use different wallpapers, edit the `WALLPAPER_PATH` variables in the scripts.

### Workspace Assignment

By default, workspace 1 is assigned to the external monitor. To change this:

1. Edit `smart-display-setup.sh` 
2. Modify the i3-msg commands to use different workspace numbers

### Monitor Detection

The scripts detect these external outputs in order:
- HDMI-1
- DP-1  
- DP-2
- DP-3
- HDMI-2

## Stow Deployment

Deploy using GNU Stow:

```bash
cd ~/dotfiles
stow screenlayout
```

This creates symlinks:
- `~/.screenlayout/` → `~/dotfiles/screenlayout/.screenlayout/`

## Logs

Display setup events are logged to `~/.config/i3/display-setup.log`

## Troubleshooting

1. **External monitor not detected**: Check `xrandr` output to verify your monitor's output name
2. **Workspace not assigned**: Ensure i3 is running and `i3-msg` is available
3. **Wallpaper not loading**: Verify wallpaper path exists and feh is installed
4. **Scripts not executing**: Check file permissions with `ls -la ~/.screenlayout/`

## Dependencies

- `xrandr` - Display configuration
- `feh` - Wallpaper setting
- `i3-msg` - i3 window manager control
- `sleep` - Timing delays