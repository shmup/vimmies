" https://github.com/MaxMEllon/vim-jsx-pretty
let g:vim_jsx_pretty_highlight_close_tag = 1 

" projectionist
nnoremap ,a :A<cr>

" qf
let g:qf_mapping_ack_style = 1

" git gutter shit
set updatetime=100
let g:gitgutter_terminal_reports_focus=0
let g:gitgutter_enabled = 0

" fzf
let g:fzf_preview_window = ''

" typescript
let g:typescript_indent_disable = 1

" EditorConfig
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

" coc
highlight CocErrorFloat ctermfg=206 ctermbg=233
highlight CocErrorSign ctermfg=206 ctermbg=233
highlight CocWarningFloat ctermfg=229 ctermbg=233
highlight CocWarningSign ctermfg=229 ctermbg=233
highlight CocHintFloat ctermfg=87 ctermbg=233
highlight CocHintSign  ctermfg=87 ctermbg=233
highlight CocInfoFloat ctermfg=253 ctermbg=233
highlight CocInfoSign ctermfg=253 ctermbg=233
highlight CocInfoSign ctermfg=253 ctermbg=233
highlight CocSelectedLine ctermfg=229 ctermbg=233
" highlight CocLocationLine ctermfg=229 ctermbg=233
" highlight CocLocationName ctermfg=229 ctermbg=233
" highlight CocSelectedText ctermfg=229 ctermbg=233
" highlight CocHighlightText ctermfg=229 ctermbg=233

" CocSelectedLine, CocSelectedText, CocHighlightText

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction
" end coq
