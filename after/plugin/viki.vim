" minimal vim wiki
" save this to .vim/plugin/viki.vim
" add `export VIM_VIKI_HOME=$HOME/path/to/dir` to .bashrc

let s:wiki_home = expand("$VIM_VIKI_HOME")

" features:
"   - open index with <space>ww
"   - type a word (foo) and press return on it to create foo.txt
"   - use foo.md if you want to specify the extension
"   - backspace takes you back a file

execute 'nnoremap <space>ww :edit' s:wiki_home . '/index.txt<cr>'

augroup Viki
  autocmd!
  function! SetFiletypeAndMappingsForWikiHome()
      execute 'autocmd BufEnter' s:wiki_home . '/*.txt call SetFiletypeAndMappings()'
  endfunction

  call SetFiletypeAndMappingsForWikiHome()
augroup END

function! SetFiletypeAndMappings()
  " setlocal ft=text.note
  setlocal nospell
  setlocal nowrap
  nnoremap <buffer><cr> :call SaveAndEdit()<cr>
  nnoremap <buffer><bs> :b#<cr>
endfunction

function! SaveAndEdit()
  let l:txt = expand("<cWORD>")
  if l:txt == '' | return | endif

  if count(l:txt, ".") == 0
    let l:txt = l:txt.'.txt'
  endif

  silent! write
  silent! execute 'edit '.s:wiki_home.'/'.l:txt
endfunction
