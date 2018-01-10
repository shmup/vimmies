" minimal vimwiki
" add `export VIM_VIKI_HOME=$HOME/Dropbox/example` to .bashrc

nnoremap <space>ww :edit $VIM_VIKI_HOME/index.md<cr>

augroup Viki
  autocmd!
  autocmd BufEnter $VIM_VIKI_HOME/* call InitFolds()
augroup END

function! InitFolds()
    setlocal ft=markdown.note
    nnoremap <buffer><cr> :e $VIM_VIKI_HOME/<c-r>=expand('<cword>')<cr>.md<cr>
    nnoremap <buffer><bs> :b#<cr>
endfunction
