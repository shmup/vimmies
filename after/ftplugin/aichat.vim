setlocal wrap
nmap <buffer> <c-c> <nop>

syntax match system /^###\ssystem$/
syntax match user /^###\suser$/
syntax match assistant /^###\sassistant$/

highlight system ctermfg=Red guifg=Red
highlight user ctermfg=Green guifg=Green
highlight assistant ctermfg=Yellow guifg=Yellow

