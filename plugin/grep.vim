" nice grep things

if executable("rg")
  set grepprg=rg\ --vimgrep
  set grepformat^=%f:%l:%c:%m
endif

" Open the location/quickfix window automatically if there are valid entries in the list.
augroup quickfix
  autocmd!
  autocmd QuickFixCmdPost cgetexpr cwindow
  autocmd QuickFixCmdPost lgetexpr lwindow
augroup END

" Use :Grep instead of :grep! and :LGrep instead of :lgrep!.
" :cgetexpr and :lgetexpr are much faster than :grep and :lgrep
" and they don't mess with your terminal emulator.
command! -nargs=+ -complete=file_in_path -bar Grep  cgetexpr system(&grepprg . ' ' . shellescape(<q-args>))
command! -nargs=+ -complete=file_in_path -bar LGrep lgetexpr system(&grepprg . ' ' . shellescape(<q-args>))

command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)

nnoremap <space>a :Grep<space>
nnoremap <silent> ,G :Grep <C-r><C-w><CR>

xnoremap <silent> ,G :<C-u>let cmd = "Grep " . visual#GetSelection() <bar>
      \ call histadd("cmd", cmd) <bar>
      \ execute cmd<CR>
