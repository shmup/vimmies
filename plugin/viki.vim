" minimal vim wiki
" save this to .vim/plugin/viki.vim
" add `export VIM_VIKI_HOME=/keybase/private/example/notes` to .bashrc

" features:
"   - open index with <space>ww
"   - type a word (foo) and press return on it to create foo.md
"   - backspace takes you back a file

" TODO
" use namespaces so when pressing <CR> on foo from index.md
" it creates index_foo.md, and pressing <cr> on bar in foo.md
" creates index_foo_bar.md (possibly)

nnoremap <space>ww :edit $VIM_VIKI_HOME/index.txt<cr>
nnoremap <space>wt :edit $VIM_VIKI_HOME/todo.txt<cr>

augroup Viki
  autocmd!
  autocmd BufEnter $VIM_VIKI_HOME/* call SetFiletypeAndMappings()
augroup END

function! SetFiletypeAndMappings()
  setlocal ft=text.note
  setlocal nospell
  setlocal textwidth=80
  nnoremap <buffer><cr> :call SaveAndEdit()<cr>
  nnoremap <buffer><bs> :b#<cr>
endfunction

function! SaveAndEdit()
  let l:txt = expand("<cword>")
  if l:txt != ''
    silent! write
    silent! execute 'edit ' $VIM_VIKI_HOME.'/'.l:txt.'.txt'
  endif
endfunction
