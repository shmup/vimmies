" resize.vim - adjust buffer height to visual selection height
" http://ix.io/2jmL/vim

function! Resize()
  '<
  " TODO, with no visual selection, resize to content height
  exec "resize" (line("'>") - line("'<") + 1)
  setl scrolloff=0
  norm! zt
endfunction
command! -range Resize call Resize()

vnoremap <space>r :RS<cr>

