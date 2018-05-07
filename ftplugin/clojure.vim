if executable('lein')
  nnoremap <buffer><space>m :Require<cr>
endif

nmap <buffer> <c-l> <Plug>(sexp_emit_head_element)
nmap <buffer> <c-h> <Plug>(sexp_emit_tail_element)

colorscheme paramount
setlocal iskeyword-=.

