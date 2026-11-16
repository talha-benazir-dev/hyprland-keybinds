#!/usr/bin/env bash
# Region screenshot -> annotate in satty.
# Omarchy equivalent: omarchy-capture-screenshot (omasnap).
set -euo pipefail

geometry=$(slurp) || exit 0
grim -g "$geometry" - | satty --filename -
