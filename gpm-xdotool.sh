#!/bin/sh

# https://github.com/kmac/google-play-music-xdotool
#
# This simple script uses xdotool to control the google play music app.
# It's best used for binding to global hotkeys. For example,
# I use win-p for play/pause, win-[ for previous, and win-]
# for next.
#
# Note: this assumes we're running Google Play Music as a separate chrome app.
# It's easier for xdotool to find and interact with the window
# in this mode.

XDOTOOL_SEARCH="xdotool search --classname play.google.com__music_listen"

if [ "$1" = "playpause" ]; then
  $XDOTOOL_SEARCH key --clearmodifiers space
elif [ "$1" = "next" ]; then
  $XDOTOOL_SEARCH key --clearmodifiers Right
elif [ "$1" = "previous" ]; then
  $XDOTOOL_SEARCH key --clearmodifiers Left
elif [ "$1" = "activate" ]; then
  $XDOTOOL_SEARCH windowactivate
elif [ "$1" = "playlist" ]; then
  $XDOTOOL_SEARCH windowactivate
  #$XDOTOOL_SEARCH windowactivate && $XDOTOOL_SEARCH key --clearmodifiers ctrl+u
elif [ "$1" = "nowplaying" ]; then
  $XDOTOOL_SEARCH getwindowname | sed "s/Google Play Music//"
else
  echo "Usage: $0 playpause|next|previous|activate|playlist|nowplaying"
  exit 1
fi
