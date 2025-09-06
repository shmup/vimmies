vim9script
# ABOUTME: Simple matrix test - just one line of characters
# ABOUTME: No animation, just static display to get positioning right

const CHARS = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'

export def MatrixSimple()
  # create new buffer
  enew
  setlocal buftype=nofile noswapfile laststatus=0

  # get window dimensions
  var width = winwidth(0)
  var height = winheight(0)

  # create one line with random characters
  var line = ''
  for i in range(width)
    line ..= CHARS[rand() % len(CHARS)]
  endfor

  # fill buffer with random characters for all lines
  var lines = [line]
  for i in range(1, height)
    var filler_line = ''
    for j in range(width)
      filler_line ..= CHARS[rand() % len(CHARS)]
    endfor
    add(lines, filler_line)
  endfor

  # set the content
  setline(1, lines)

  # set black background for entire screen
  highlight Normal ctermbg=Black guibg=#000000
  highlight MatrixGreen ctermfg=Green ctermbg=Black guifg=#00ff00 guibg=#000000
  matchadd('MatrixGreen', '.')

  redraw

  # wait for keypress
  getchar()
enddef

command! MatrixSimple MatrixSimple()
