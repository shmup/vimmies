" quick and dirty whitespace based alignment
function! Align()
  '<,'>!column -t|sed 's/  \(\S\)/ \1/g'
  normal gv=
endfunction
command! Align call Align()

" lazy timestamp stuff
nmap <F4> i<C-R>=strftime("%FT%T%z")<CR><Esc>
imap <F4> <C-R>=strftime("%FT%T%z")<CR>
cmap <F4> <C-R>=strftime("%FT%T%z")<CR>


" TODO - BufKeep and BufReject
" reference https://stackoverflow.com/questions/3155461/how-to-delete-multiple-buffers-in-vim
" accepts a single argument and keeps or rejects buffers matching it

function! s:open(...) abort
  if has('win32')
    let cmd = 'start'
  elseif executable('xdg-open')
    let cmd = 'xdg-open'
  else
    let cmd = 'open'
  endif
  if !empty(v:servername) && !has('win32')
    let cmd = 'env VISUAL="vim --servername '.v:servername.'" '.cmd
  endif
  let args = a:0 ? copy(a:000) : [get(b:, 'url', '%:p')]
  if type(args[0]) == type(function('tr'))
    let args[0] = call(args[0], [{}], {})
  endif
  call map(args, 'shellescape(expand(v:val))')
  return 'echo ' . string(system(cmd . ' ' . join(args, ' '))[0:-2])
endfunction
command! -nargs=* -complete=file O :exe s:open(<f-args>)
