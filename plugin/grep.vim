" nice .vim/plugin/grep.vim things

if executable("rg")
  set grepprg=rg\ --vimgrep
endif

" currently does not let you pass arguments to Rg
" https://gist.github.com/romainl/56f0c28ef953ffc157f36cc495947ab3
function! Grep(string)
  return system(join([&grepprg, shellescape(a:string)]))
endfunction

command! -nargs=+ -complete=file_in_path -bar Piss  cgetexpr Piss(<q-args>)
command! -nargs=+ -complete=file_in_path -bar Grep  cgetexpr Grep(<q-args>)
command! -nargs=+ -complete=file_in_path -bar LGrep lgetexpr Grep(<q-args>)

augroup quickfix
	autocmd!
	autocmd QuickFixCmdPost cgetexpr cwindow
	autocmd QuickFixCmdPost lgetexpr lwindow
augroup END

nnoremap <silent> ,G :Grep <C-r><C-w><CR>
nnoremap <space>z :Piss<space>
nnoremap <space>a :Grep<space>

command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)

xnoremap <silent> ,G :<C-u>let cmd = "Grep " . visual#GetSelection() <bar>
      \ call histadd("cmd", cmd) <bar>
      \ execute cmd<CR>
