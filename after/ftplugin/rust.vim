if executable('rustc')
  setlocal errorformat=%-G
  setlocal errorformat+=%-Gerror:\ aborting\ %.%#
  setlocal errorformat+=%-Gerror:\ Could\ not\ compile\ %.%#
  setlocal errorformat+=%Eerror:\ %m
  setlocal errorformat+=%Eerror[E%n]:\ %m
  setlocal errorformat+=%-Gwarning:\ the\ option\ `Z`\ is\ unstable\ %.%#
  setlocal errorformat+=%Wwarning:\ %m
  setlocal errorformat+=%Inote:\ %m
  setlocal errorformat+=%C\ %#-->\ %f:%l:%c

  if filereadable("Cargo.toml")
    setlocal makeprg=cargo\ build
    nnoremap <buffer><space>m :Dispatch<cr>
  else
    setlocal makeprg=rustc\ %
    nnoremap <buffer><space>m :silent make! \| redraw!<cr>
  endif
endif

if executable('rustfmt')
  let &l:formatprg = 'rustfmt'
endif

nnoremap <silent> ,rr :CocCommand rust-analyzer.run<CR>
nnoremap <silent> ,rd :CocCommand rust-analyzer.debug<CR>
