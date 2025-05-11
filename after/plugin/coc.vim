 " ▄▄·        ▄▄·     .▄▄ · ▄▄▄▄▄▄• ▄▌·▄▄▄·▄▄▄
" ▐█ ▌▪▪     ▐█ ▌▪    ▐█ ▀. •██  █▪██▌▐▄▄·▐▄▄·
" ██ ▄▄ ▄█▀▄ ██ ▄▄    ▄▀▀▀█▄ ▐█.▪█▌▐█▌██▪ ██▪
" ▐███▌▐█▌.▐▌▐███▌    ▐█▄▪▐█ ▐█▌·▐█▄█▌██▌.██▌.
" ·▀▀▀  ▀█▄▀▪·▀▀▀      ▀▀▀▀  ▀▀▀  ▀▀▀ ▀▀▀ ▀▀▀
" COC STUFF

" let g:coc_default_semantic_highlight_groups = 0

nnoremap <silent><space>yd :call YankLineAndDiagnosticToClipboard()<CR>
nnoremap <silent> <space>ec :edit ~/.vim/coc-settings.json<cr>
nnoremap <silent> <space>ec :edit ~/.vim/coc-settings.json<cr>
nnoremap <silent> ,cl :CocCommand document.toggleCodeLens<CR>
nnoremap <silent> ,ch :CocCommand document.toggleInlayHint<CR>
nmap <silent><space>m :CocList --height=10 diagnostics<cr>
nmap <silent><space>M :CocDiagnostics 10<cr>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" to install phpactor:
" 1. sudo dnf install composer
" 2. composer global require phpactor/phpactor
" 3. export PATH="$PATH:$HOME/.config/composer/vendor/bin"

let g:coc_global_extensions = [
      \'coc-clangd',
      \'coc-go',
      \'coc-phpactor',
      \'coc-pyright',
      \'coc-rust-analyzer',
      \'coc-sh',
      \'coc-tsserver',
      \'coc-zig',
      \]

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


" helper functions for ANSI colors
function! s:get_color(attr, ...) abort
  let gui = has('termguicolors') && &termguicolors
  let fam = gui ? 'gui' : 'cterm'
  let pat = gui ? '^#[a-f0-9]\+' : '^[0-9]\+$'
  for group in a:000
    let code = synIDattr(synIDtrans(hlID(group)), a:attr, fam)
    if code =~? pat
      return code
    endif
  endfor
  return ''
endfunction

function! s:csi(color, fg) abort
  let prefix = a:fg ? '38;' : '48;'
  if a:color[0] == '#'
    return prefix.'2;'.join(map([a:color[1:2], a:color[3:4], a:color[5:6]], 'str2nr(v:val, 16)'), ';')
  endif
  return prefix.'5;'.a:color
endfunction

let s:ansi = {'black': 30, 'red': 31, 'green': 32, 'yellow': 33, 'blue': 34, 'magenta': 35, 'cyan': 36}

function! s:ansi(str, group, default, ...) abort
  let fg = s:get_color('fg', a:group)
  let bg = s:get_color('bg', a:group)
  let code = (empty(fg) ? s:ansi[a:default] : s:csi(fg, 1)) .
        \ (empty(bg) ? '' : ';'.s:csi(bg, 0))
  return printf("\x1b[%s%sm%s\x1b[m", code, a:0 ? ';1' : '', a:str)
endfunction

function! s:green(str, highlight) abort
  return s:ansi(a:str, a:highlight, 'green')
endfunction

function! s:get_coc_commands() abort
  let commands = CocAction('commands')
  let result = []
  for cmd in commands
    call add(result, cmd.id . ': ' . s:green(cmd.title, 'Comment'))
  endfor
  return sort(result)
endfunction

function! s:run_coc_command(selected) abort
  let cmd_parts = split(a:selected, ':')
  let cmd_id = trim(cmd_parts[0])
  execute 'CocCommand ' . cmd_id
endfunction

function! CocCommandsFzf() abort
  call fzf#run(fzf#wrap({
        \ 'source': s:get_coc_commands(),
        \ 'sink': function('s:run_coc_command'),
        \ 'options': '--ansi --prompt "Coc Commands> "'
        \ }))
endfunction

command! -nargs=0 CocCommands call CocCommandsFzf()
