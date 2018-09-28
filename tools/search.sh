# receives filetype and keyword
# filetype replaces . with spaces in case of multiple filetypes
# i.e. javascript.jsx

firefox "https://duckduckgo.com/?q=${1//[.]/+}+$2&ia=qa"
