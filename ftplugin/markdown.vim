" using tpope's vim-markdown you can get syntax on fenced languages
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'javascript', 'json']

setlocal wrap
setlocal listchars=
setlocal linebreak

" display the rendered markdown in your browser
if executable('grip')
  nnoremap <buffer><space>m :Dispatch grip --pass $GRIP -b %<cr>
endif
