vim9script
# matrix9.vim - Elegant Matrix screensaver for VIM
# Inspired by the classic matrix digital rain effect

const CHARS = '男の乳空一二三四五六七八九十天池林山川火水土木金石アイウエオカキクケコサシスセソタチツテトナニヌネノハヒフヘホマミムメモヤユヨラリルレロワヲンabcdefghijklmnopqrstuvwxyz0123456789'
const MIN_SPEED = 2
const MAX_SPEED = 8

var session_file: string
var original_settings: dict<any>

class MatrixColumn
  public var x: number
  public var drops: list<dict<any>> = []
  public var next_drop_time: number = 0

  def new(col: number)
    this.x = col
    this.ScheduleNextDrop()
  enddef

  def ScheduleNextDrop()
    # random delay between drops
    this.next_drop_time = float2nr(reltime()->reltimefloat() * 1000) + (rand() % 2000) + 500
  enddef

  def ShouldCreateDrop(): bool
    return float2nr(reltime()->reltimefloat() * 1000) > this.next_drop_time
  enddef

  def CreateDrop(max_height: number)
    var drop = {
      y: 0.0,  # use float for smooth movement
      speed: (rand() % (MAX_SPEED - MIN_SPEED) + MIN_SPEED) / 2.0,
      length: rand() % (max_height / 4) + 8,
      chars: [],
      color_fade: []
    }

    # pre-generate characters and colors for this drop
    for i in range(drop.length)
      add(drop.chars, CHARS[rand() % len(CHARS)])
      # color intensity: head is brightest, tail fades
      add(drop.color_fade, i)
    endfor

    add(this.drops, drop)
    this.ScheduleNextDrop()
  enddef

  def Update(max_height: number, buffer_lines: list<string>)
    # create new drop if it's time and not too many
    if this.ShouldCreateDrop() && len(this.drops) < 2
      this.CreateDrop(max_height)
    endif

    # update existing drops
    var active_drops = []
    for drop in this.drops
      drop.y += drop.speed

      # keep drops that haven't completely fallen off screen
      if drop.y - drop.length < max_height + 10
        add(active_drops, drop)
      endif
    endfor
    this.drops = active_drops

    # render drops to buffer
    for drop in this.drops
      this.RenderDrop(drop, max_height, buffer_lines)
    endfor
  enddef

  def RenderDrop(drop: dict<any>, max_height: number, buffer_lines: list<string>)
    for i in range(drop.length)
      var char_y = float2nr(drop.y) - i
      if char_y >= 1 && char_y <= max_height
        var line = buffer_lines[char_y - 1]

        if this.x < len(line)
          # replace character at this position
          var char_to_place = drop.chars[i]
          line = strpart(line, 0, this.x) .. char_to_place .. strpart(line, this.x + 1)
          buffer_lines[char_y - 1] = line
        endif
      endif
    endfor
  enddef
endclass

class MatrixRenderer
  public var width: number = 0
  public var height: number = 0
  public var columns: list<MatrixColumn> = []
  public var buffer_lines: list<string> = []
  public var running: bool = true
  public var fade_buffer: list<list<number>> = []

  def Initialize()
    this.width = winwidth(0)
    this.height = winheight(0)

    # create buffer lines filled with spaces
    this.buffer_lines = []
    this.fade_buffer = []
    for i in range(this.height)
      add(this.buffer_lines, repeat(' ', this.width))
      add(this.fade_buffer, repeat([0], this.width))  # fade levels for each character
    endfor

    # create columns (every other position for spacing)
    this.columns = []
    for col in range(0, this.width, 2)
      add(this.columns, MatrixColumn.new(col))
    endfor
  enddef

  def Update()
    # fade existing characters
    for row in range(len(this.fade_buffer))
      for col in range(len(this.fade_buffer[row]))
        if this.fade_buffer[row][col] > 0
          this.fade_buffer[row][col] -= 1
          if this.fade_buffer[row][col] <= 0
            # clear faded character
            var line = this.buffer_lines[row]
            line = strpart(line, 0, col) .. ' ' .. strpart(line, col + 1)
            this.buffer_lines[row] = line
          endif
        endif
      endfor
    endfor

    # update all columns
    for column in this.columns
      column.Update(this.height, this.buffer_lines)

      # set fade levels for new characters
      for drop in column.drops
        for i in range(drop.length)
          var char_y = float2nr(drop.y) - i
          if char_y >= 1 && char_y <= this.height && column.x < this.width
            # head gets highest fade value, tail gets lower
            var fade_val = i == 0 ? 20 : (i < 3 ? 15 : (i < 6 ? 10 : 5))
            this.fade_buffer[char_y - 1][column.x] = fade_val
          endif
        endfor
      endfor
    endfor
  enddef

  def Render()
    # update vim buffer
    setline(1, this.buffer_lines)

    # apply colors based on fade levels
    clearmatches()
    for row in range(len(this.fade_buffer))
      for col in range(len(this.fade_buffer[row]))
        var fade_level = this.fade_buffer[row][col]
        if fade_level > 0
          var line_num = row + 1
          var col_num = col + 1
          var pattern = '\%' .. line_num .. 'l\%' .. col_num .. 'c.'

          if fade_level >= 18
            matchadd('MatrixHead', pattern)
          elseif fade_level >= 12
            matchadd('MatrixBright', pattern)
          elseif fade_level >= 8
            matchadd('MatrixMedium', pattern)
          else
            matchadd('MatrixDark', pattern)
          endif
        endif
      endfor
    endfor

    redraw

    # check for exit
    var key = getchar(1)
    if key != 0
      this.running = false
    endif
  enddef
endclass

def SaveCurrentState()
  session_file = tempname()
  execute $'mksession! {session_file}'

  original_settings = {
    colorscheme: '',
    cmdheight: &cmdheight,
    laststatus: &laststatus,
    number: &number,
    relativenumber: &relativenumber,
    ruler: &ruler,
    showcmd: &showcmd,
    showmode: &showmode,
    cursorline: &cursorline,
    cursorcolumn: &cursorcolumn
  }

  try
    original_settings.colorscheme = execute('colorscheme')->split()[-1]
  catch
    original_settings.colorscheme = 'default'
  endtry
enddef

def SetupMatrixEnvironment(): bool
  # create new buffer
  enew
  if winnr('$') > 1
    only
  endif

  # buffer settings
  setlocal bufhidden=delete buftype=nofile modifiable
  setlocal nonumber norelativenumber noswapfile nowrap
  setlocal cmdheight=1 laststatus=0
  setlocal noruler noshowcmd noshowmode
  setlocal nocursorline nocursorcolumn

  # ensure proper encoding for unicode characters
  setlocal encoding=utf-8 fileencoding=utf-8

  # set black background
  set background=dark

  # matrix color scheme
  highlight MatrixHead ctermfg=White guifg=#ffffff
  highlight MatrixBright ctermfg=LightGreen guifg=#00ff41
  highlight MatrixMedium ctermfg=Green guifg=#00aa00
  highlight MatrixDark ctermfg=DarkGreen guifg=#006600

  return true
enddef

def RestoreEnvironment()
  # clear matches
  clearmatches()

  # restore original settings
  if !empty(original_settings)
    execute $'set cmdheight={original_settings.cmdheight}'
    execute $'set laststatus={original_settings.laststatus}'

    if original_settings.number
      set number
    endif
    if original_settings.relativenumber
      set relativenumber
    endif
    if original_settings.ruler
      set ruler
    endif
    if original_settings.showcmd
      set showcmd
    endif
    if original_settings.showmode
      set showmode
    endif
    if original_settings.cursorline
      set cursorline
    endif
    if original_settings.cursorcolumn
      set cursorcolumn
    endif

    if !empty(original_settings.colorscheme) && original_settings.colorscheme != 'default'
      try
        execute $'colorscheme {original_settings.colorscheme}'
      catch
        # ignore if colorscheme not available
      endtry
    endif
  endif

  # restore session
  if !empty(session_file) && filereadable(session_file)
    execute $'source {session_file}'
    delete(session_file)
  endif

  var key = getchar(0)  # clear any remaining keypress
enddef

export def Matrix9()
  if winwidth(0) < 20 || winheight(0) < 10
    echohl ErrorMsg
    echo 'Matrix requires minimum 20x10 window'
    echohl None
    return
  endif

  # check encoding support
  if !has('multi_byte') || &encoding !~? 'utf-\?8'
    echohl ErrorMsg
    echo 'Matrix requires UTF-8 encoding support. Try :set encoding=utf-8'
    echohl None
    return
  endif

  SaveCurrentState()

  if !SetupMatrixEnvironment()
    RestoreEnvironment()
    return
  endif

  var renderer = MatrixRenderer.new()
  renderer.Initialize()

  var last_resize_check = [winwidth(0), winheight(0)]

  while renderer.running
    # check for window resize
    var current_size = [winwidth(0), winheight(0)]
    if current_size != last_resize_check
      renderer.Initialize()
      last_resize_check = current_size
    endif

    renderer.Update()
    renderer.Render()
    sleep 80m
  endwhile

  RestoreEnvironment()
enddef

command! Matrix9 Matrix9()
