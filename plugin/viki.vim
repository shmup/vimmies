" minimal vimwiki
" add `export VIM_VIKI_HOME=$HOME/Dropbox/example` to .bashrc

" features:
"   - open index with <space>ww
"   - type a word (foo) and press return on it to create foo.md
"   - backspace takes you back a file

nnoremap <space>ww :edit $VIM_VIKI_HOME/index.md<cr>

augroup Viki
  autocmd!
  autocmd BufEnter $VIM_VIKI_HOME/* call InitFolds()
augroup END

function! VikiSetup()
    setlocal ft=markdown.note
    nnoremap <buffer><cr> :e $VIM_VIKI_HOME/<c-r>=expand('<cword>')<cr>.md<cr>
    nnoremap <buffer><bs> :b#<cr>
endfunction
