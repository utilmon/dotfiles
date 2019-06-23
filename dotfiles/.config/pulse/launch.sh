#!/usr/bin/env bash

# Terminate already running pulseaudio
killall pulseaudio

# Wait until the processes have been shut down
while pgrep -u $UID -x pulseaudio >/dev/null; do sleep 1; done

#Launch pulseaudio
pulseaudio --start
