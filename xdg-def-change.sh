#!/bin/sh
filetype () {
    xdg-mime query filetype "$@"
}

query() {
    xdg-mime query default $(filetype "$@")
}


set_default() {
    name_default_new="$1"
    shift
    xdg-mime default "$name_default_new" $(filetype "$@")
    echo "Filetype for $(filetype $@) set to $name_default_new"
}

selection=$1
shift
([ $selection = "query" ] && query "$@") || ([ $selection = "set" ] && set_default "$@")
