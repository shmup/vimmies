" just.vim - Simple Just runner with FZF
" Put this in ~/.vim/after/plugin/just.vim

if !executable('just')
  finish
endif

if !exists(':FZF')
  echohl WarningMsg
  echo "just.vim requires fzf.vim to be installed"
  echohl None
  finish
endif

function! s:GetJustCommands()
  let l:output = system('just --list 2>/dev/null')
  if v:shell_error != 0
    echo "No justfile found or just command failed"
    return []
  endif

  let l:lines = split(l:output, '\n')
  let l:commands = []

  for line in l:lines
    " Skip empty lines and the header
    if line =~ '^\s*$' || line =~ '^Available recipes:'
      continue
    endif

    " Extract command name (first word, might be indented)
    let l:trimmed = substitute(line, '^\s\+', '', '')
    if l:trimmed != ''
      let l:command_name = split(l:trimmed)[0]
      " Skip if it looks like a comment or description line
      if l:command_name !~ '^#' && l:command_name != ''
        call add(l:commands, line)
      endif
    endif
  endfor

  return l:commands
endfunction

function! s:RunJustCommand(command_line)
  " Extract just the command name (first word after any indentation)
  let l:trimmed = substitute(a:command_line, '^\s\+', '', '')
  let l:command = split(l:trimmed)[0]

  " Use dispatch if available, otherwise fallback
  if exists(':Dispatch')
    execute 'Dispatch just ' . l:command
  elseif has('terminal')
    execute 'terminal just ' . l:command
  else
    execute '!just ' . l:command
  endif
endfunction

function! s:JustFZF()
  let l:commands = s:GetJustCommands()

  if empty(l:commands)
    echo "No just commands found"
    return
  endif

  call fzf#run(fzf#wrap({
    \ 'source': l:commands,
    \ 'sink': function('s:RunJustCommand'),
    \ 'options': '--prompt="Just> " --preview="echo {}" --preview-window=up:1',
    \ 'down': '~40%'
  \ }))
endfunction

" Main mapping
nnoremap <silent> ,j :call <SID>JustFZF()<CR>

" Optional: Add a command too
command! Just call s:JustFZF()
