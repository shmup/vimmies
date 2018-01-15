function! s:Get_env() abort
  if has('win64') || has('win32') || has('win16')
    return 'WINDOWS'
  else
    return toupper(substitute(system('uname'), '\n', '', ''))
  endif
endfunction

" What command to use on what system
let s:cmds = {"DARWIN": "open", "LINUX": "xdg-open", "WINDOWS": "start"}

" Build the URL stub
let s:stub = s:cmds[<SID>Get_env()] . " 'http://devdocs.io/?q="

command! -nargs=* DD silent! call system(len(split(<q-args>, ' ')) == 0 ?
      \ s:stub . &ft . ' ' . expand('<cword>') . "'" : len(split(<q-args>, ' ')) == 1 ?
      \ s:stub . &ft . ' ' . <q-args> . "'" : s:stub . <q-args> . "'")

nnoremap <space>dd :DD<cr>
