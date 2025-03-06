vim9script

def HighlightedYank(hlgroup = 'IncSearch', duration = 300, in_visual = true)
  if v:event.operator ==? 'y'
    if !in_visual && visualmode() != null_string
      visualmode(1)
      return
    endif
    var [beg, end] = [getpos("'["), getpos("']")]
    var type = v:event.regtype ?? 'v'
    var pos = getregionpos(beg, end, {type: type})
    var end_offset = (type == 'V' || v:event.inclusive) ? 1 : 0
    var m = matchaddpos(hlgroup, pos->mapnew((_, v) => {
      var col_beg = v[0][2] + v[0][3]
      var col_end = v[1][2] + v[1][3] + end_offset
      return [v[0][1], col_beg, col_end - col_beg]
    }))
    var winid = win_getid()
    timer_start(duration, (_) => m->matchdelete(winid))
  endif
enddef

autocmd TextYankPost * HighlightedYank()


const HIGHLIGHTS = {
  error: { bg: 131, fg: 'white' },       # Critical issues
  warning: { bg: 129, fg: 'white' },     # Warnings
  clean: { bg: 'white', fg: 'black' },   # Cleanup markers
  status: { bg: 131, fg: 65 },           # Status indicators
  meta: { style: 'reverse' },            # Metadata
  trail: { bg: 238 },                    # Trailing spaces
  info: { bg: 'black', fg: 'yellow' },   # Information
  success: { bg: 'black', fg: 'green' }, # Success markers
  alert: { bg: 'black', fg: 'red' },      # Alerts
}

for [name, attrs] in items(HIGHLIGHTS)
  var cmd = 'highlight ' .. name
  if has_key(attrs, 'bg')
    cmd ..= ' ctermbg=' .. attrs.bg
  endif
  if has_key(attrs, 'fg')
    cmd ..= ' ctermfg=' .. attrs.fg
  endif
  if has_key(attrs, 'style')
    cmd ..= ' cterm=' .. attrs.style
  endif
  execute cmd
endfor

const PATTERNS = {
  error: ['HACK', 'ERROR', 'CLOSED', 'BLOCKED', 'REMOVED', 'BREAKING CHANGE', 'ALERT'],
  meta: ['^\<EMILY\>', '^\<KRISTIAN\>', 'FIXED', 'TODO', 'NOTE', 'NOTES', 'EXCEPTION'],
  info: ['^\<ASK\>', '#\d\+', '\/\/\s\+@.*', '\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}-\d{4}'],
  warning: ['\*priority\*', '\*deprioritize\*'],
  alert: ['^\zs>'],
  success: ['^\zs!'],
  clean: ['CLEANME']
}

# Apply matches
augroup SpecialHighlights
  autocmd!
  autocmd WinEnter,BufEnter * {
    call clearmatches()
    call matchadd('trail', '\s\+$', 100)
    for [group, patterns] in items(PATTERNS)
      for pattern in patterns
        call matchadd(group, pattern, 101)
      endfor
    endfor
  }
augroup END

