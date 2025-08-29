#!/bin/sh
# Smart display setup with workspace assignment
# Automatically detects connected monitors and configures them

LAPTOP_OUTPUT="eDP-1"
EXTERNAL_OUTPUTS="HDMI-1 DP-1 DP-2 DP-3 HDMI-2"
WALLPAPER_PATH="$HOME/dotfiles/backgrounds/nice-blue-background.png"

# Function to detect connected external monitors
get_connected_external() {
    for output in $EXTERNAL_OUTPUTS; do
        if xrandr | grep -q "$output connected"; then
            echo "$output"
            return
        fi
    done
}

# Get the connected external monitor
EXTERNAL_OUTPUT=$(get_connected_external)

if [ -n "$EXTERNAL_OUTPUT" ]; then
    echo "Setting up dual monitor configuration with $EXTERNAL_OUTPUT"
    
    # Setup displays - external as primary, laptop below
    xrandr --output "$LAPTOP_OUTPUT" --mode 1920x1080 --pos 0x1080 --rotate normal \
           --output "$EXTERNAL_OUTPUT" --primary --mode 1920x1080 --pos 0x0 --rotate normal
    
    # Turn off other outputs
    for output in $EXTERNAL_OUTPUTS; do
        if [ "$output" != "$EXTERNAL_OUTPUT" ]; then
            xrandr --output "$output" --off 2>/dev/null || true
        fi
    done
    
    # Wait for display setup
    sleep 2
    
    # Set wallpapers
    feh --bg-fill "$WALLPAPER_PATH" &
    
    # Move workspace 1 to external monitor
    i3-msg "workspace 1; move workspace to output $EXTERNAL_OUTPUT" &
    
    # Move to workspace 1
    i3-msg "workspace 1" &
    
    echo "$(date): Dual monitor setup completed - $EXTERNAL_OUTPUT assigned to workspace 1" >> ~/.config/i3/display-setup.log
    
else
    echo "Setting up single monitor configuration"
    
    # Single monitor setup - just laptop
    xrandr --output "$LAPTOP_OUTPUT" --primary --mode 1920x1080 --pos 0x0 --rotate normal
    
    # Turn off external outputs
    for output in $EXTERNAL_OUTPUTS; do
        xrandr --output "$output" --off 2>/dev/null || true
    done
    
    # Set wallpaper
    feh --bg-fill "$WALLPAPER_PATH" &
    
    echo "$(date): Single monitor setup completed" >> ~/.config/i3/display-setup.log
fi