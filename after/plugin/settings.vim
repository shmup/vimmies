" i like a lil LSP
let g:coc_global_extensions = [
      \'coc-tsserver',
      \'coc-clangd',
      \'coc-pyright',
      \]

let g:chad_seed = "To assist: Be terse. Do not offer unprompted advice or clarifications. Speak in specific, topic relevant terminology. Do NOT hedge or qualify. Do not waffle. Speak directly and be willing to make creative guesses. Explain your reasoning. if you don’t know, say you don’t know. Remain neutral on all topics. Be willing to reference less reputable sources for ideas. Never apologize. Ask questions when unsure."
let g:chad_options = {
    \ 'api_key': $CHAD,
    \ 'model': "gpt-4-1106-preview",
    \ 'temperature': 0.3,
    \ 'top_p': 0.5,
    \ 'max_tokens': 150,
    \ 'presence_penalty': 0.1,
    \ 'frequency_penalty': 0.6
\ }

" https://github.com/MaxMEllon/vim-jsx-pretty
let g:vim_jsx_pretty_highlight_close_tag = 1

" projectionist
nnoremap ,a :A<cr>

" let g:coc_default_semantic_highlight_groups = 0

" qf
let g:qf_mapping_ack_style = 1

" gruvbox
" https://github.com/morhetz/gruvbox/wiki/Configuration
let g:gruvbox_contrast_light = 'hard'

" git gutter shit
set updatetime=100
let g:gitgutter_terminal_reports_focus=0
let g:gitgutter_enabled = 0

" goyo
let g:goyo_width = 90
let g:goyo_height = '95%'
let g:goyo_linenr = 0

" fzf
let g:fzf_preview_window = ''

" typescript
let g:typescript_indent_disable = 1

" EditorConfig
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

" QF
augroup automaticquickfix
    autocmd!
    autocmd QuickFixCmdPost [^l]* cwindow
    autocmd QuickFixCmdPost    l* lwindow
augroup END

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

nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-@> coc#refresh()
