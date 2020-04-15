" nonymous-ix.vim uses .netrc for auth, and fucks with ix.io
" insert  :IX [optional visual selection] - copies url to system clipboard
" replace :RX <URL> [optional visual selection]
" delete  :DX <URL>

if has('win64') || has('win32') || has('win16')
  let s:env = 'WINDOWS'
else
  let s:env = toupper(substitute(system('uname'), '\n', '', ''))
endif

" linux requires curl and xclip
if s:env =~ 'LINUX' && executable('xclip')
  command! -range=% IX <line1>,<line2>w !curl -n -F 'f:1=<-' ix.io | tr -d '\n' | xclip -i -selection clipboard
  command! -nargs=1 -range=% RX <line1>,<line2>w !curl -n -X PUT -F 'f:1=<-' <args>
  command! -nargs=1 -range=% DX w !curl -n -X DELETE <args>
endif

" macos requires curl
if s:env =~ 'DARWIN'
  command! -range=% IX <line1>,<line2>w !curl -n -F 'f:1=<-' ix.io | tr -d '\n' | pbcopy
  command! -nargs=1 -range=% RX <line1>,<line2>w !curl -n -X PUT -F 'f:1=<-' <args>
  command! -nargs=1 -range=% DX w !curl -n -X DELETE <args>
endif
