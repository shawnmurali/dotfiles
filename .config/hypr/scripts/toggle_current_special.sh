#!/usr/bin/env bash

# Extract the name of the focused special workspace
special_workspace=$(hyprctl monitors -j | jq -r '.[] | select(.focused==true) |.specialWorkspace.name')

# Check if the extracted special workspace name is empty
if [[ -z "$special_workspace" ]]; then
    # If empty, it means no special workspace is focused, so exit
    exit 0
fi

# Slice off "special:" prefix using parameter expansion
name="${special_workspace#special:}"

# Toggle this specific special workspace
hyprctl dispatch togglespecialworkspace "$name"

exit 0
