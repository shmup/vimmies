command! BufOnly silent! execute "%bd|e#|bd#"

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
