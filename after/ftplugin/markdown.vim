" using tpope's vim-markdown you can get syntax on fenced languages
let g:markdown_fenced_languages=[
      \ 'html', 'python', 'bash=sh',
      \'javascript', 'json', 'yaml',
      \'sql', 'typescript', 'lua',
      \'vim', 'elixir']

setlocal conceallevel=2
setlocal concealcursor=nc
let g:markdown_syntax_conceal=1

setlocal wrap
setlocal listchars=
setlocal linebreak
setlocal nospell

" display the rendered markdown in your browser
if executable('grip')
  nnoremap <buffer><space>m :Dispatch grip --pass $GRIP -b %<cr>
endif
