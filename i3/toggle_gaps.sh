#!/bin/bash
GAP_STATE_FILE="/tmp/i3_gap_state"
if [ ! -f "$GAP_STATE_FILE" ]; then
    touch "$GAP_STATE_FILE"
    echo "on" > "$GAP_STATE_FILE"
fi

if [ "$(cat $GAP_STATE_FILE)" = "on" ]; then
  i3-msg "gaps inner all set 0; gaps outer all set 0"
  echo "off" > "$GAP_STATE_FILE"
else
  i3-msg "gaps inner all set 10; gaps outer all set 10"
  echo "on" > "$GAP_STATE_FILE"
fi
