" .vim/after/plugin/yank-coc-diagnostic.vim

" relies on https://github.com/neoclide/coc.nvim/

" yank line number, error, and line text to clipboard #gptfriendly
" e.g. -> error on line 83, "Terminal" is not defined. Code: term = Terminal()

nnoremap <silent><space>yd :call YankLineAndDiagnosticToClipboard()<CR>

function! GetDiagnosticForLine(lineNumber)
    let diagList = CocAction('diagnosticList')

    for diagItem in diagList
        if a:lineNumber == diagItem['lnum']
            return trim(diagItem['message'])
        endif
    endfor

    return ''
endfunction

function! YankLineAndDiagnosticToClipboard()
    let currentLine = line('.')
    let currentLineText = trim(getline(currentLine))
    let diagnostic = GetDiagnosticForLine(currentLine)

    if len(diagnostic) > 0
        let clipboardContent = printf("error on line %d, %s. Code: %s", currentLine, diagnostic, currentLineText)
        call setreg('+', clipboardContent)
    else
        let clipboardContent = printf("%d: %s", currentLine, currentLineText)
        call setreg('+', clipboardContent)
    endif
endfunction

" http://ix.io/3JJi
