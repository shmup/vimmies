function! javascript#eslint#ToggleEslintInline()
    let line_content = getline('.')
    let comment = '// eslint-disable-inline'
    if line_content =~ comment
        call setline('.', substitute(line_content, '\s*' . comment, '', ''))
    else
        call setline('.', line_content . '    ' . comment)
    endif
endfunction

function! javascript#eslint#ToggleEslintBlock()
    let directives = ['eslint-disable', 'eslint-enable']
    let current_line = line('.')
    let disable_comment = search(directives[0], 'bnW')
    let enable_comment = search(directives[1], 'nW')
    if current_line >= disable_comment && current_line <= enable_comment
        silent execute enable_comment . "d"
        silent execute disable_comment . "d"
    else
        silent '<put!='/* ' . directives[0] . ' */'
        silent '>put='/* ' . directives[1] . ' */'
    endif
endfunction
