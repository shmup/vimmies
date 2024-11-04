setlocal foldmethod=syntax
setlocal commentstring=\/\/\ %s

noremap <buffer> <space>js :!node % <cr>

if executable('tsc')
  setlocal makeprg=tsc
  nnoremap <buffer><space>m :Dispatch tsc %<cr>
endif

let s:in_git_repo = system('git rev-parse --is-inside-work-tree 2>/dev/null') =~# '^true$'
let s:has_deno_json = filereadable(findfile('deno.json', '.;'))

if s:in_git_repo && s:has_deno_json
  let &l:formatprg = 'deno fmt --'
elseif executable('prettier')
  let &l:formatprg = 'prettier --stdin-filepath %'
endif
