" fzf stuff
" install https://github.com/junegunn/fzf

" recently viewed list
command! FZFMru call fzf#run({
      \  'source':  v:oldfiles,
      \  'sink':    'e',
      \  'options': '-m -x +s',
      \  'down':    '40%'})
nnoremap <space>v :FZFMru<cr>

" buffer list
nnoremap <space>b :Buffers<cr>

" all files versus files tracked in git
nnoremap <space>f :Files<cr>
nnoremap <c-p> :GFiles<cr>

