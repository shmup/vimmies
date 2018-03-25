" fzf stuff
" 1) install https://github.com/junegunn/fzf for your user/system
" 2) i'm already providing plugins/fzf.vim which is another requirement

" recently viewed list
command! FZFMru call fzf#run({
      \  'source':  v:oldfiles,
      \  'sink':    'e',
      \  'options': '-m -x +s',
      \  'down':    '40%'})

nnoremap <space>v :FZFMru<cr>  " mru
nnoremap <space>b :Buffers<cr> " buffers
nnoremap <c-f> :Files<cr>      " files
nnoremap <c-p> :GFiles<cr>     " git files
