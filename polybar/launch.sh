# kill existing bars 
polybar-msg cmd quit

# wait until the process has been shit down
while pgrep -x polybar >/dev/null; do sleep 1; done

# Launch polybar
polybar example &