" nice .vim/plugin/grep.vim things

if executable("rg")
  set grepprg=rg\ --vimgrep
endif

function! Grep(...)
  return system(join(extend([&grepprg], a:000), ' '))
endfunction

" <nova> devilegg, also :grep "\b<c-r><c-w>\b"  h c_CTRL-R_CTRL-W
function! ExactGrep(...)
  return system(join(extend([&grepprg, '-w'], a:000), ' '))
endfunction

command! -nargs=+ -complete=file_in_path -bar Grep  cgetexpr Grep(<q-args>)
command! -nargs=+ -complete=file_in_path -bar ExactGrep  cgetexpr ExactGrep(<q-args>)

augroup quickfix
	autocmd!
	autocmd QuickFixCmdPost cgetexpr cwindow
	autocmd QuickFixCmdPost lgetexpr lwindow
augroup END

nnoremap <space>a :Grep<space>
nnoremap <silent> ,G :Grep <C-r><C-w><CR>
nnoremap <silent> ,E :ExactGrep <C-r><C-w><CR>
nnoremap <silent> ,L :Lines <C-r><C-w><CR>
nnoremap <silent> ,B :BLines <C-r><C-w><CR>
xnoremap <silent> ,G :<C-u>let cmd = "Grep " . visual#GetSelection() <bar>
      \ call histadd("cmd", cmd) <bar>
      \ execute cmd<CR>

command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
