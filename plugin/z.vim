" changes working directory using z
" requires https://github.com/rupa/z
let $BASH_ENV="~/.vim/vim_bash"
function! Z(...)
  let l:z_path = get(systemlist('z -e ' . join(a:000)), 0, getcwd())
  execute 'cd ' . l:z_path
  echo l:z_path
endfunction
command! -nargs=+ Z call Z(<f-args>)

