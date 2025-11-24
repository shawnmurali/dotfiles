#! /usr/bin/env bash
scratch_term=$(hyprctl clients -j | jq -r '.[] | select(.class=="Alacritty") | select(.workspace.name=="special:t")')

if ! [[ -z $scratch_term ]]; then
    exit 0 # scratch_term is already set up
fi

hyprctl dispatch exec '[workspace special:t ; float; size 60% 80% ; bordersize 0; center] uwsm-app -- alacritty'
