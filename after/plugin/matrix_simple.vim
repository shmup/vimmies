vim9script
# ABOUTME: Simple matrix test - just one line of characters
# ABOUTME: No animation, just static display to get positioning right

const CHARS = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'

export def MatrixSimple()
  # create new buffer
  enew
  setlocal buftype=nofile noswapfile
  
  # get window dimensions
  var width = winwidth(0)
  var height = winheight(0)
  
  # create one line with random characters
  var line = ''
  for i in range(width)
    line ..= CHARS[rand() % len(CHARS)]
  endfor
  
  # fill buffer with empty lines except first one
  var lines = [line]
  for i in range(1, height)
    add(lines, repeat(' ', width))
  endfor
  
  # set the content
  setline(1, lines)
  
  # simple green color
  highlight MatrixGreen ctermfg=Green guifg=#00ff00
  matchadd('MatrixGreen', '.')
  
  redraw
  
  # wait for keypress
  getchar()
enddef

command! MatrixSimple MatrixSimple()