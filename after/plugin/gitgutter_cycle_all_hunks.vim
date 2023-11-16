function! NextHunkAllBuffers()
  let line = line('.')
  silent! GitGutterNextHunk
  if line('.') != line
    return
  endif

  let bufnr = bufnr('')
  while 1
    silent! bnext
    if bufnr('') == bufnr
      return
    endif
    if !empty(GitGutterGetHunks())
      normal! 1G
      silent! GitGutterNextHunk
      return
    endif
  endwhile
endfunction

function! PrevHunkAllBuffers()
  let line = line('.')
  silent! GitGutterPrevHunk
  if line('.') != line
    return
  endif

  let bufnr = bufnr('')
  while 1
    silent! bprevious
    if bufnr('') == bufnr
      return
    endif
    if !empty(GitGutterGetHunks())
      normal! G
      silent! GitGutterPrevHunk
      return
    endif
  endwhile
endfunction

nmap <silent> ]C :call NextHunkAllBuffers()<CR>
nmap <silent> [C :call PrevHunkAllBuffers()<CR>
