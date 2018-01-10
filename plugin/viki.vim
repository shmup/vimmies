" minimal vimwiki

" let b:viki_dir = "~/Dropbox/Briefcase/viki"
" nnoremap <space>ww :edit <c-r>=b:viki_dir . "/index.md"<cr><cr>

" try this
" autocmd BufEnter * if exists('b:viki_dir') | call InitFolds() | endif
" and then create the b:viki_dir value idk

let viki_dir = "~/Dropbox/Briefcase/viki"

nnoremap <space>ww :edit <c-r>=viki_dir . "/index.md"<cr><cr>

augroup Viki
  autocmd!
  execute 'autocmd BufEnter '.viki_dir.'/* call InitFolds()'
augroup END

function! InitFolds()
    setlocal ft=markdown.note
    nnoremap <buffer><cr> :e <c-r>=expand(viki_dir . '/' . "<cword>")<cr>.md<cr>
    nnoremap <buffer><bs> :b#<cr>
endfunction
