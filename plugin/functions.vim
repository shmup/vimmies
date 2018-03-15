function! CloseAllBuffersButCurrent()
  let curr = bufnr("%")
  let last = bufnr("$")
  if curr > 1    | silent! execute "1,".(curr-1)."bd"     | endif
  if curr < last | silent! execute (curr+1).",".last."bd" | endif
endfunction
command BufOnly call CloseAllBuffersButCurrent()

" quick and dirty whitespace based alignment
function! Align()
  '<,'>!column -t|sed 's/  \(\S\)/ \1/g'
  normal gv=
endfunction

" adjust split height to visual selection height
function! Resize()
  '<
  exec "resize" (line("'>") - line("'<") + 1)
  setl scrolloff=0
  norm! zt
endfunction
command! -range Resize call Resize()
vnoremap <space>r :Resize<cr>

" TODO - BufKeep and BufReject
" reference https://stackoverflow.com/questions/3155461/how-to-delete-multiple-buffers-in-vim
" accepts a single argument and keeps or rejects buffers matching it
