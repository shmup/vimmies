" nonymous-ix.vim uses .netrc for auth, and fucks with no.dungeon.red

" insert  :IX [optional visual selection] - copies url to system clipboard
" replace :RX <URL or ID> [optional visual selection]
" delete  :DX <URL or ID>

" example ~/.netrc
"   machine no.dungeon.red
"   login piss
"   password whistler

if has('win64') || has('win32') || has('win16')
  let s:env = 'WINDOWS'
else
  let s:env = toupper(substitute(system('uname'), '\n', '', ''))
endif

if s:env =~ 'LINUX' && executable('xclip')
  command! -range=% IX <line1>,<line2>w !curl -n -s -F 'f:1=<-' https://no.dungeon.red | tr -d '\n' | tee >(xclip -i -selection clipboard)
  command! -nargs=1 -range=% RX <line1>,<line2>w !curl -n -s -X PUT -F 'f:1=<-' <args> | tr -d '\n' | tee >(xclip -i -selection clipboard)
  command! -nargs=1 DX execute '!curl -n -s -X DELETE ' . shellescape(<f-args>, 1)
endif

if s:env =~ 'DARWIN'
  command! -range=% IX <line1>,<line2>w !curl -n -F 'f:1=<-' no.dungeon.red | tr -d '\n' | tee >(pbcopy)
  command! -nargs=1 -range=% RX <line1>,<line2>w !curl -n -X PUT -F 'f:1=<-' <args> | tr -d '\n' | tee >(pbcopy)
  command! -nargs=1 DX execute '!curl -n -s -X DELETE ' . shellescape(<f-args>, 1)
endif
