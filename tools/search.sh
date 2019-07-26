#!/usr/bin/env bash

# searches the filetype & keyword
# in case of multiple filetypes (javascript.jsx) we just use the first

# firefox "https://google.com/search?q=$(echo $1| cut -d'.' -f1)+%22$2%22"
# firefox "https://google.com/search?btnI=&q=${1//[.]/+}+$2"

# firefox "http://www.google.com/search?hl=en&q=${1//[.]/+}+$2"
# firefox "http://www.google.com/search?hl=en&q=${1//[.]/+}+$2+mdn&btnI=I"

# firefox "https://duckduckgo.com/?q=${1//[.]/+}+%22$2%22+!"
firefox "https://duckduckgo.com/?q=${1//[.]/+}+%22$2%22"
