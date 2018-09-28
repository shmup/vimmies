#!/usr/bin/env bash

# searches the filetype & keyword
# in case of two filetypes (javascript.jsx) we just use the first

firefox "https://duckduckgo.com/?q=$(echo $1| cut -d'.' -f1)+$2"

# this uses all filetypes and replaces . with space
# firefox "https://duckduckgo.com/?q=${1//[.]/+}+$2&ia=qa"
