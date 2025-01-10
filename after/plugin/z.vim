" vim_bash should source z.sh
"
" nnoremap ,z :Z<space>
" nnoremap ,e :silent Zedit<space>

let $BASH_ENV="~/.vim/vim_bash"

function! Z(...)
  let path = get(systemlist('z -e ' . join(a:000)), 0, getcwd())
  execute 'lcd ' . path
  echo path
endfunction

function! Zedit(...)
  let path = get(systemlist('z -e ' . join(a:000)), 0, getcwd())
  execute 'edit ' . path
  echo path
endfunction

command! -nargs=+ Z call Z(<f-args>)
command! -nargs=+ Zedit call Zedit(<f-args>)
