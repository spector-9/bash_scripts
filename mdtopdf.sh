#!/bin/sh
# A basic script to convert md to pdf using pandoc and open it if given the argument(Made to be used with vim)
# Argument 1 is the name and location of the file, Arg. 2 is the flag to open it or not. Just supply "open" as second arg. to open.

x=$(echo "$HOME" | sed "s/\//\\\\\//g")
INPUT=$1
OUTPUT=$(echo "$1" | awk -F"." '{print $1}')
OUTPUT="${OUTPUT##*\/}"
# sed "s/\$HOME/$x/g" "$INPUT" | pandoc -V geometry:paperwidth=4in -V geometry:paperheight=9in -i -o "$HOME"/vimwiki/pdf/"$OUTPUT".pdf # For phones
 sed "s/\$HOME/$x/g" "$INPUT" | pandoc  -V geometry:left=4cm -V geometry:right=4cm -V geometry:top=5mm -V geometry:bottom=5mm -V geometry:paperheight=10in -i -o "$HOME"/vimwiki/pdf/"$OUTPUT".pdf


([ "$2" = "open" ] && zathura "$HOME"/vimwiki/pdf/"$OUTPUT".pdf) || exit 0
