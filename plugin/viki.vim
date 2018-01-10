" minimal vimwiki
"
nnoremap <space>ww :e ~/Dropbox/Briefcase/viki/index.md<cr>

augroup Viki
  autocmd!
  autocmd BufEnter ~/Dropbox/Briefcase/viki/* 
    \ set ft=markdown.note |
    \ nnoremap <buffer><cr> :e ~/Dropbox/Briefcase/viki/<c-r>=expand("<cword>")<cr>.md<cr> |
    \ nnoremap <buffer><bs> :b#<cr>
augroup END
