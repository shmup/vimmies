" MRU command-line completion
function! s:MRUComplete(ArgLead, CmdLine, CursorPos)
    return filter(copy(v:oldfiles), 'v:val =~ a:ArgLead')
endfunction

" MRU function
function! s:MRU(command, arg)
    if a:command == "tabedit"
        execute a:command . " " . a:arg . "|lcd %:p:h"
    else
        execute a:command . " " . a:arg
    endif
endfunction

" commands
command! -nargs=1 -complete=customlist,<sid>MRUComplete ME call <sid>MRU('edit', <f-args>)
command! -nargs=1 -complete=customlist,<sid>MRUComplete MS call <sid>MRU('split', <f-args>)
command! -nargs=1 -complete=customlist,<sid>MRUComplete MV call <sid>MRU('vsplit', <f-args>)
command! -nargs=1 -complete=customlist,<sid>MRUComplete MT call <sid>MRU('tabedit', <f-args>)
