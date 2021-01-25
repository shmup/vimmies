" quick and dirty whitespace based alignment
function! Align()
  '<,'>!column -t|sed 's/  \(\S\)/ \1/g'
  normal gv=
endfunction
command! Align call Align()

" TODO - BufKeep and BufReject
" reference https://stackoverflow.com/questions/3155461/how-to-delete-multiple-buffers-in-vim
" accepts a single argument and keeps or rejects buffers matching it
