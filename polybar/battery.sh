#!/usr/bin/env bash

BAT="/sys/class/power_supply/BAT0"
AC="/sys/class/power_supply/AC"

# Read energy or charge
if [[ -r "$BAT/energy_now" ]]; then
  now=$(<"$BAT/energy_now")
  full=$(<"$BAT/energy_full")
elif [[ -r "$BAT/charge_now" ]]; then
  now=$(<"$BAT/charge_now")
  full=$(<"$BAT/charge_full")
else
  echo "Battery info N/A"
  exit 1
fi

# Calculate battery percentage
perc=$(awk -v n="$now" -v f="$full" 'BEGIN { printf("%.4f", n/f*100) }')

# Safely read online status
if [[ -r "$AC/online" ]]; then
  online=$(<"$AC/online")
else
  online=0
fi

# Output with colored dot
if [[ $online -eq 1 ]]; then
  echo -e "${perc}% %{F#00ff00}●%{F-}"  # green if charging
else
  echo -e "${perc}% %{F#5599ff}●%{F-}"  # blue if on battery
fi
