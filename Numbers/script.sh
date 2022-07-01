#!/bin/sh

x=1
while [ $x -le $1 ]
do
  convert base.jpeg -font 'HelveticaLTStd-BlkCond'  -pointsize 240 -draw "gravity Center fill black text 0, 22 \"$x\" " "$x".png
  x=$(( $x + 1 ))
done
