#! /usr/bin/env bash

if [[ $# -ne 3 ]]; then
    echo 'Usage: [class] [command] [workspace]'
    exit 1
fi

CLASS=$1
COMMAND=$2
WORKSPACE=$3

#! /usr/bin/env bash
scratch_term=$(hyprctl clients -j | jq -r --arg CLASS "$CLASS" --arg WORKSPACE "$WORKSPACE" '.[] | select(.class==$CLASS) | select(.workspace.name==$WORKSPACE)')

if ! [[ -z $scratch_term ]]; then
    exit 0 # scratch_term is already set up
fi

hyprctl dispatch exec $COMMAND
