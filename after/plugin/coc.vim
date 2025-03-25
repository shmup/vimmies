" helper functions for ANSI colors
function! s:get_color(attr, ...) abort
  let gui = has('termguicolors') && &termguicolors
  let fam = gui ? 'gui' : 'cterm'
  let pat = gui ? '^#[a-f0-9]\+' : '^[0-9]\+$'
  for group in a:000
    let code = synIDattr(synIDtrans(hlID(group)), a:attr, fam)
    if code =~? pat
      return code
    endif
  endfor
  return ''
endfunction

function! s:csi(color, fg) abort
  let prefix = a:fg ? '38;' : '48;'
  if a:color[0] == '#'
    return prefix.'2;'.join(map([a:color[1:2], a:color[3:4], a:color[5:6]], 'str2nr(v:val, 16)'), ';')
  endif
  return prefix.'5;'.a:color
endfunction

let s:ansi = {'black': 30, 'red': 31, 'green': 32, 'yellow': 33, 'blue': 34, 'magenta': 35, 'cyan': 36}

function! s:ansi(str, group, default, ...) abort
  let fg = s:get_color('fg', a:group)
  let bg = s:get_color('bg', a:group)
  let code = (empty(fg) ? s:ansi[a:default] : s:csi(fg, 1)) .
        \ (empty(bg) ? '' : ';'.s:csi(bg, 0))
  return printf("\x1b[%s%sm%s\x1b[m", code, a:0 ? ';1' : '', a:str)
endfunction

function! s:green(str, highlight) abort
  return s:ansi(a:str, a:highlight, 'green')
endfunction

function! s:get_coc_commands() abort
  let commands = CocAction('commands')
  let result = []
  for cmd in commands
    call add(result, cmd.id . ': ' . s:green(cmd.title, 'Comment'))
  endfor
  return sort(result)
endfunction

function! s:run_coc_command(selected) abort
  let cmd_parts = split(a:selected, ':')
  let cmd_id = trim(cmd_parts[0])
  execute 'CocCommand ' . cmd_id
endfunction

function! CocCommandsFzf() abort
  call fzf#run(fzf#wrap({
        \ 'source': s:get_coc_commands(),
        \ 'sink': function('s:run_coc_command'),
        \ 'options': '--ansi --prompt "Coc Commands> "'
        \ }))
endfunction

command! -nargs=0 CocCommands call CocCommandsFzf()
