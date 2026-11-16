#!/usr/bin/env bash
# Clipboard history picker (cliphist + fuzzel).
# Omarchy equivalent: SUPER+CTRL+V quickshell clipboard panel.
# Requires: wl-paste --watch cliphist store  (started from hyprland.conf)
set -euo pipefail

cliphist list | fuzzel --dmenu | cliphist decode | wl-copy
