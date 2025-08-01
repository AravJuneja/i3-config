#!/usr/bin/env bash
# ──────────────────────────────────────────────────────
# toggle_monitors.sh
# ──────────────────────────────────────────────────────

# is HDMI‑1 already active?
if xrandr | grep "^HDMI-1 connected" | grep -q " connected"; then
  # if yes, *undock* → turn HDMI‑1 off
  xrandr \
    --output HDMI-1 --off \
    --output eDP-1  --auto

else
  # else, *dock* → turn both on side‑by‑side
  xrandr \
    --output HDMI-1 --auto \
    --output eDP-1  --auto --right-of HDMI-1

  # now map WS 1–5 to HDMI‑1
  for ws in {1..5}; do
    i3-msg "workspace $ws; move workspace to output HDMI-1" > /dev/null
  done

  # …and WS 6–10 to eDP‑1
  for ws in {6..10}; do
    i3-msg "workspace $ws; move workspace to output eDP-1" > /dev/null
  done
fi

