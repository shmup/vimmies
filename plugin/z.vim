" changes working directory using z
" requires https://github.com/rupa/z
" I use a map like: nnoremap ,z :Z<space>

" TODO: make this portable (systemlist might be bad)

" since z needs to be sourced, and not even in your $PATH, this is required.
" https://vi.stackexchange.com/questions/2950/bash-not-recognizing-aliases-when-run-from-vim

" vim_bash should minimally contain two things:
"   shopt -s expand_aliases
"   . $HOME/path/to/z.sh

let $BASH_ENV="~/.vim/vim_bash"

function! Z(...)
  let l:z_path = get(systemlist('z -e ' . join(a:000)), 0, getcwd())
  execute 'lcd ' . l:z_path
  echo l:z_path
endfunction
command! -nargs=+ Z call Z(<f-args>)

function! Zedit(...)
  let l:z_path = get(systemlist('z -e ' . join(a:000)), 0, getcwd())
  execute 'edit ' . l:z_path
  echo l:z_path
endfunction
command! -nargs=+ Zedit call Zedit(<f-args>)
