set keywordprg=:call\ Lookup6502()
function! Lookup6502()
    let cmd = "grep -i '^" . expand("<cword>") . "' ~/.vim/mans/6502.txt"
    echo system(cmd)
endfunction
