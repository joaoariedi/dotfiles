#!/bin/sh
# Wallpaper configuration for dual monitors
# Sets different wallpapers for laptop and external screens

WALLPAPER_DIR="$HOME/dotfiles/backgrounds"
LAPTOP_WALLPAPER="$HOME/dotfiles/backgrounds/nice-blue-background.png"
EXTERNAL_WALLPAPER="$HOME/dotfiles/backgrounds/nice-blue-background.png"

# Function to detect connected external monitors
get_connected_external() {
    for output in HDMI-1 DP-1 DP-2 DP-3 HDMI-2; do
        if xrandr | grep -q "$output connected"; then
            echo "$output"
            return
        fi
    done
}

EXTERNAL_OUTPUT=$(get_connected_external)

if [ -n "$EXTERNAL_OUTPUT" ]; then
    echo "Setting wallpapers for dual monitor setup"
    
    # Set wallpaper for both screens - feh will automatically span across displays
    # For different wallpapers on each screen, use:
    # feh --bg-fill --output "$EXTERNAL_OUTPUT" "$EXTERNAL_WALLPAPER" --bg-fill --output "eDP-1" "$LAPTOP_WALLPAPER"
    
    # For same wallpaper on both screens:
    feh --bg-fill "$EXTERNAL_WALLPAPER"
    
    echo "$(date): Dual monitor wallpapers set" >> ~/.config/i3/display-setup.log
    
else
    echo "Setting wallpaper for single monitor"
    feh --bg-fill "$LAPTOP_WALLPAPER"
    echo "$(date): Single monitor wallpaper set" >> ~/.config/i3/display-setup.log
fi