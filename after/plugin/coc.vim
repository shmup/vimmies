function! s:get_coc_commands() abort
  let commands = CocAction('commands')
  let result = []
  for cmd in commands
    call add(result, cmd.id . ': ' . cmd.title)
  endfor
  return sort(result)
endfunction

function! s:run_coc_command(selected) abort
  let cmd_id = split(a:selected, ':')[0]
  execute 'CocCommand ' . cmd_id
endfunction

function! s:coc_commands_fzf() abort
  return fzf#run(fzf#wrap({
        \ 'source': s:get_coc_commands(),
        \ 'sink': function('s:run_coc_command'),
        \ 'options': '--prompt "Coc Commands> "'
        \ }))
endfunction

command! -nargs=0 CocFzfCommands call s:coc_commands_fzf()
