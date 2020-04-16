" quick and dirty whitespace based alignment
function! Align()
  '<,'>!column -t|sed 's/  \(\S\)/ \1/g'
  normal gv=
endfunction

" adjust buffer height to visual selection height
function! Resize()
  '<
  exec "resize" (line("'>") - line("'<") + 1)
  setl scrolloff=0
  norm! zt
endfunction
command! -range Resize call Resize()
vnoremap <space>r :Resize<cr>

function! DeleteFileAndCloseBuffer()
  let choice = confirm("Delete file and close buffer?", "&Yes\n&No", 1)
  if choice == 1 | call delete(expand('%:p')) | b# | bd# | endif
endfun

" TODO - BufKeep and BufReject
" reference https://stackoverflow.com/questions/3155461/how-to-delete-multiple-buffers-in-vim
" accepts a single argument and keeps or rejects buffers matching it
