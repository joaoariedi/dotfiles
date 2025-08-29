#!/bin/sh
# Arandr configuration for external screen with i3 workspace assignment
# This script sets up dual monitors and assigns the external screen to workspace 1

# Set up displays - external monitor as primary, laptop screen below
xrandr --output eDP-1 --mode 1920x1080 --pos 0x1080 --rotate normal --output HDMI-1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output DP-1 --off

# Wait a moment for display setup to complete
sleep 2

# Set wallpapers for both screens
feh --bg-fill ~/dotfiles/backgrounds/nice-blue-background.png &

# Assign workspace 1 to the external monitor (HDMI-1)
# This uses i3-msg to move workspace 1 to the external display
i3-msg "workspace 1; move workspace to output HDMI-1" &

# Optional: Move to workspace 1 on the external monitor
i3-msg "workspace 1" &

# Log the setup
echo "$(date): External monitor setup completed - HDMI-1 assigned to workspace 1" >> ~/.config/i3/display-setup.log