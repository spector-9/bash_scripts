#!/bin/sh

size=$(printf "auto\ncentered\nscaled\ntiled\nzoom\nzoom-fill" | dmenu -l 7)
nitrogen --set-"$size" --save "$1" 2>/dev/null &

