" nice .vim/plugin/grep.vim things

if executable("rg")
  set grepprg=rg\ --vimgrep
endif

" search and replace
nnoremap <space>s :'{,'}s/\<<C-r>=expand('<cword>')<cr>\>/
nnoremap <space>% :%s/\<<C-r>=expand('<cword>')<cr>\>/

function! ReplaceText()
    " Get the current word under the cursor
    let l:original_text = expand('<cword>')

    " Construct the command
    let l:cmd = "!git grep -l '" . l:original_text . "' | xargs sed -i '' -e 's/" . l:original_text . "/"

    " Place the command on the command-line
    call feedkeys(":" . l:cmd)
endfunction

" Map <Space>R to call this function
nnoremap <Space>R :call ReplaceText()<CR>

function! Grep(...)
  return system(join([&grepprg] + [expandcmd(join(a:000, ' '))], ' ')) "romainls
endfunction

" <nova> devilegg, also :grep "\b<c-r><c-w>\b"  h c_CTRL-R_CTRL-W
function! ExactGrep(...)
  return system(join(extend([&grepprg, '-w'], a:000), ' '))
endfunction

command! -nargs=+ -complete=file_in_path -bar Grep  cgetexpr Grep(<f-args>)
command! -nargs=+ -complete=file_in_path -bar ExactGrep  cgetexpr ExactGrep(<f-args>)

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
