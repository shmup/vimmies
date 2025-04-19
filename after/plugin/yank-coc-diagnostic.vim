" .vim/after/plugin/yank-coc-diagnostic.vim

" relies on https://github.com/neoclide/coc.nvim/

" yank line number, error, and line text to clipboard #gptfriendly
" e.g. -> error on line 83, "Terminal" is not defined. Code: term = Terminal()

function! GetDiagnosticForLine(lineNumber, columnNumber)
  let diagList = CocAction('diagnosticList')
  let bestMatch = ''
  let minDistance = 999999  " Large initial value

  for diagItem in diagList
    if a:lineNumber == diagItem['lnum']
      " Calculate distance from cursor to diagnostic
      let distance = abs(a:columnNumber - diagItem['col'])

      " If this is the closest diagnostic so far, save it
      if distance < minDistance
        let minDistance = distance
        let bestMatch = trim(diagItem['message'])
      endif
    endif
  endfor

  return bestMatch
endfunction

function! YankLineAndDiagnosticToClipboard()
  let currentLine = line('.')
  let currentCol = col('.')
  let currentLineText = trim(getline(currentLine))
  let diagnostic = GetDiagnosticForLine(currentLine, currentCol)

  if len(diagnostic) > 0
    let clipboardContent = printf("error on line %d, %s. Code: %s", currentLine, diagnostic, currentLineText)
    call setreg('+', clipboardContent)
  else
    let clipboardContent = printf("%d: %s", currentLine, currentLineText)
    call setreg('+', clipboardContent)
  endif
endfunction

function! YankAllDiagnostics() abort
  let diagnostics = CocAction('diagnosticList')
  let formatted = []

  for diagnostic in diagnostics
    let line = printf("%s:%d:%d - %s: %s",
          \ diagnostic.file,
          \ diagnostic.lnum,
          \ diagnostic.col,
          \ diagnostic.severity,
          \ diagnostic.message)
    call add(formatted, line)
  endfor

  let @+ = join(formatted, "\n")
  echo "Copied " . len(formatted) . " diagnostics to clipboard"
endfunction

command! YankDiagnostics call YankAllDiagnostics()
