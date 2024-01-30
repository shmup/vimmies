" resize.vim - adjust buffer height to visual selection height and resize all

function! Resize()
  '<
  exec "resize" (line("'>") - line("'<") + 1)
  setl scrolloff=0
  norm! zt
endfunction
command! -range Resize call Resize()
