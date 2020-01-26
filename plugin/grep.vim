" nice .vim/plugin/grep.vim things

if executable("rg")
  set grepprg=rg\ --vimgrep
endif

function LazyGrep(string)
  " currently just throw it all at your &grepprg
  return system(join([&grepprg, shellescape(a:string)]))
endfunction

function! Grep(args)
  let args = split(a:args, ' ')
  return system(join([&grepprg, shellescape(args[0]), len(args) > 1 ? join(args[1:-1], ' ') : ''], ' '))
endfunction

command! -nargs=+ -complete=file_in_path -bar Piss  cgetexpr Piss(<q-args>)
command! -nargs=+ -complete=file_in_path -bar LazyGrep  cgetexpr LazyGrep(<q-args>)
command! -nargs=+ -complete=file_in_path -bar Grep  cgetexpr LazyGrep(<q-args>)
command! -nargs=+ -complete=file_in_path -bar LGrep lgetexpr LazyGrep(<q-args>)

augroup quickfix
	autocmd!
	autocmd QuickFixCmdPost cgetexpr cwindow
	autocmd QuickFixCmdPost lgetexpr lwindow
augroup END

nnoremap <silent> ,G :LazyGrep <C-r><C-w><CR>
nnoremap <space>a :LazyGrep<space>

xnoremap <silent> ,G :<C-u>let cmd = "LazyGrep " . visual#GetSelection() <bar>
      \ call histadd("cmd", cmd) <bar>
      \ execute cmd<CR>

command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
