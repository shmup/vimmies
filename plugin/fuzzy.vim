" fzf stuff
" install https://github.com/junegunn/fzf

command! FZFMru call fzf#run({
      \  'source':  v:oldfiles,
      \  'sink':    'e',
      \  'options': '-m -x +s',
      \  'down':    '40%'})

function! s:buflist()
  redir => ls
  silent ls
  redir END
  return split(ls, '\n')
endfunction

function! s:bufopen(e)
  execute 'buffer' matchstr(a:e, '^[ 0-9]*')
endfunction

" buffer list
nnoremap <silent> <space>b :call fzf#run({
      \   'source':  reverse(<sid>buflist()),
      \   'sink':    function('<sid>bufopen'),
      \   'options': '+m',
      \   'down':    len(<sid>buflist()) + 2
      \ })<CR>

" recently viewed list
nnoremap <space>v :FZFMru<cr>

" all files and git ls-files
nnoremap <space>f :Files<cr>
nnoremap <c-p> :GFiles<cr>

