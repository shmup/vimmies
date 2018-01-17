if has('win64') || has('win32') || has('win16')
  let s:env = 'WINDOWS'
else
  let s:env = toupper(substitute(system('uname'), '\n', '', ''))
endif

if s:env =~ 'DARWIN'
  command! -range=% IX  <line1>,<line2>w !curl -F 'f:1=<-' ix.io | tr -d '\n' | pbcopy
  command! -range=% CL  <line1>,<line2>w !curl -F 'clbin=<-' https://clbin.com | tr -d '\n' | pbcopy
  command! -range=% VP  <line1>,<line2>w !curl -F 'text=<-' http://vpaste.net | tr -d '\n' | pbcopy
  " command! -range=% SP  <line1>,<line2>w !curl -F 'sprunge=<-' http://sprunge.us | tr -d '\n' | pbcopy
  " command! -range=% TB  <line1>,<line2>w !nc termbin 9999 | tr -d '\n' | pbcopy
endif

if s:env =~ 'LINUX'
  " needs xclip
  command! -range=% IX  <line1>,<line2>w !curl -F 'f:1=<-' ix.io | tr -d '\n' | xclip -i -selection clipboard
  command! -range=% CL  <line1>,<line2>w !curl -F 'clbin=<-' https://clbin.com | tr -d '\n' | xclip -i -selection clipboard
  command! -range=% VP  <line1>,<line2>w !curl -F 'text=<-' http://vpaste.net | tr -d '\n' | xclip -i -selection clipboard
  " command! -range=% SP  <line1>,<line2>w !curl -F 'sprunge=<-' http://sprunge.us | tr -d '\n' | xclip -i -selection clipboard
  " command! -range=% TB <line1>,<line2>w !nc termbin 9999 | tr -d '\n' | xclip -i -selection clipboard
endif
