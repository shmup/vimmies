function! buffers#DeleteCurrentSwap()
  let swapfile_path = $HOME . '/.vim/junk/swp/' .
        \ substitute(expand('%:p'), '/', '%', 'g') . '.swp'
  if filereadable(swapfile_path)
    call delete(swapfile_path)
    echo "swap deleted"
  else
    echo "no swap found"
  endif
endfunction
command! DeleteSwap call buffers#DeleteCurrentSwap()

function! buffers#CloseBuffersMatching(pattern)
  let buffer_range = range(1, bufnr('$'))
  let IsMatching = {idx, val -> buflisted(val) && bufname(val) =~ a:pattern}
  let target_buffers = filter(buffer_range, IsMatching)

  for l:buffer_number in target_buffers
    execute 'bd! ' . l:buffer_number
  endfor
endfunction
command! -nargs=1 CloseBuffersMatching call buffers#CloseBuffersMatching(<q-args>)

function! buffers#DeleteFileAndCloseBuffer()
  let choice = confirm("Delete file and close buffer?", "&Yes\n&No", 1)
  if choice == 1 | call delete(expand('%:p')) | b# | bd# | endif
endfun
command! DeleteFile call buffers#DeleteFileAndCloseBuffer()

function! buffers#CloseNamelessBuffers()
  let buffer_range = range(1, bufnr('$'))
  let IsNameless = {idx, val -> buflisted(val) && bufname(val) == ''}
  let target_buffers = filter(buffer_range, IsNameless)
  for l:buffer_number in target_buffers
    execute 'bd! ' . l:buffer_number
  endfor
endfunction
command! CloseNamelessBuffers call buffers#CloseNamelessBuffers()
