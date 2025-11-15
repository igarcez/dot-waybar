#!/bin/bash

# Animated equalizer for Waybar MPRIS module
# Cycles through equalizer-like bar patterns

# Array of equalizer patterns (5 bars with varying heights)
patterns=(
    "▁▂▃▄▅"
    "▂▃▄▅▆"
    "▃▄▅▆▇"
    "▄▅▆▇█"
    "▅▆▇█▆"
    "▆▇█▆▅"
    "▇█▆▅▄"
    "█▆▅▄▃"
    "▆▅▄▃▂"
    "▅▄▃▂▁"
)

# Alternative patterns for a more "bouncy" effect
# patterns=(
#     "▂▁▃▁▅"
#     "▁▃▁▅▁"
#     "▃▁▅▁▂"
#     "▁▅▁▂▁"
# )

while true; do
    index=$(( RANDOM % ${#patterns[@]} ))
    if playerctl status 2>/dev/null | grep -q "Playing"; then
        echo "${patterns[$index]}"
    else
        echo "▁▁▁▁▁"
    fi
    sleep 0.13  # Adjust speed here (lower = faster, higher = slower)
done
