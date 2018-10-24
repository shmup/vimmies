# Search DuckDuckGo (or Google) via vim's keywordprg

> This will search DDG or Google (using Firefox) with the filetype+keyword and go to the first result
>
> This is related to `:help keywordprg` and pressing `K` on a keyword
>
> Probably you can swap firefox with chrome in the snippets, idk

Put this in your `$HOME/.vim/vimrc` and swap the commented out line if you don't use [vim-dispatch](https://github.com/tpope/vim-dispatch)

```viml
" don't mess with these filetypes (use the default keywordprg)
let ignorelist =['python','vim','help']

autocmd! Filetype * if (index(ignorelist, &ft) == -1)
  \ | let &l:keywordprg=":Dispatch " . fnamemodify($MYVIMRC, ":h") . "/search.sh " . &l:filetype | endif
  "\ | let &l:keywordprg=fnamemodify($MYVIMRC, ":h") . "/search.sh " . &l:filetype | endif
```

Store this as `$HOME/.vim/search.sh` and swap the commented out line if you prefer google

```sh
#!/usr/bin/env bash
# remove the +! from DDG or the btnI= from google if you don't want to navigate to the first result

firefox "https://duckduckgo.com/?q=${1//[.]/+}+%22$2%22+!"
# firefox "https://google.com/search?btnI=&q=${1//[.]/+}+$2"
```
