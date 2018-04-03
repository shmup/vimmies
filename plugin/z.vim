" changes working directory using z
" requires https://github.com/rupa/z
" I use a map like: nnoremap ,z :Z<space>

" TODO: make this portable (systemlist might be bad)

" vim_bash should minimally contain two things:
"   shopt -s expand_aliases  
"   . $HOME/path/to/z.sh
let $BASH_ENV="~/.vim/vim_bash"

function! Z(...)
  let l:z_path = get(systemlist('z -e ' . join(a:000)), 0, getcwd())
  execute 'cd ' . l:z_path
  echo l:z_path
endfunction
command! -nargs=+ Z call Z(<f-args>)
