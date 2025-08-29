#!/bin/sh
# Wallpaper configuration for dual monitors
# Sets different wallpapers for laptop and external screens

WALLPAPER_DIR="$HOME/dotfiles/backgrounds"
LAPTOP_WALLPAPER="$HOME/dotfiles/backgrounds/commodore.jpg"
EXTERNAL_WALLPAPER="$HOME/dotfiles/backgrounds/nice-blue-background.png"

# Function to detect connected external monitors
get_connected_external() {
  for output in HDMI-1 DP-1 DP-2 DP-3 HDMI-2; do
    if xrandr | grep "$output" | grep -q "connected" && ! xrandr | grep "$output" | grep -q "disconnected"; then
      echo "$output"
      return
    fi
  done
}

EXTERNAL_OUTPUT=$(get_connected_external)

if [ -n "$EXTERNAL_OUTPUT" ]; then
  echo "Setting wallpapers for dual monitor setup"
  echo "External: $EXTERNAL_OUTPUT -> $EXTERNAL_WALLPAPER"
  echo "Laptop: eDP-1 -> $LAPTOP_WALLPAPER"

  # Set different wallpapers for each screen using nitrogen
  # Wait for monitors to be properly detected
  sleep 1
  
  # Check which monitor is primary (external) and which is secondary (laptop)
  if xrandr --listmonitors | grep -q "0:.*$EXTERNAL_OUTPUT"; then
    # External is head 0, laptop is head 1
    nitrogen --head=0 --set-zoom-fill "$EXTERNAL_WALLPAPER"
    nitrogen --head=1 --set-zoom-fill "$LAPTOP_WALLPAPER"
  else
    # Laptop is head 0, external is head 1
    nitrogen --head=0 --set-zoom-fill "$LAPTOP_WALLPAPER"
    nitrogen --head=1 --set-zoom-fill "$EXTERNAL_WALLPAPER"
  fi

  echo "$(date): Dual monitor wallpapers set - External: $EXTERNAL_WALLPAPER, Laptop: $LAPTOP_WALLPAPER" >>~/.config/i3/display-setup.log

else
  echo "Setting wallpaper for single monitor"
  feh --bg-fill "$LAPTOP_WALLPAPER"
  echo "$(date): Single monitor wallpaper set" >>~/.config/i3/display-setup.log
fi

