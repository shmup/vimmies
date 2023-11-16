" scream.vim, so comments stand out when I'm intently combing code
" :SCREAM - Grey100 on IndianRed
" :WHISPER - Apprentice defaults

function! LouderComments() abort
  highlight Comment ctermbg=131 ctermfg=231
  highlight Todo ctermbg=131 ctermfg=231 cterm=reverse
endfunction

command! SCREAM silent! call LouderComments()
command! WHISPER silent! colorscheme apprentice
