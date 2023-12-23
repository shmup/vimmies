" resize.vim - adjust buffer height to visual selection height and resize all

function! Resize()
  let l:height = &cmdheight
  if mode() ==# 'v'
    let l:start_line = line("'<")
    let l:end_line = line("'>")
    let l:height = l:end_line - l:start_line + 1
    exec "resize " . l:height
    normal! gv
  else
    let l:height = line("$") - l:height
    exec "resize " . l:height
    normal! gg
  endif
  setl scrolloff=0
endfunction

" resize all but the last window
function! ResizeAll()
  let l:current_win_id = win_getid()
  let l:windows = range(1, winnr('$') - 1)

  for l:winnum in l:windows
    call win_gotoid(win_getid(l:winnum))
    call Resize()
  endfor

  call win_gotoid(l:current_win_id)
endfunction

command! -range Resize call Resize()
command! ResizeAll call ResizeAll()

vnoremap <space>r :Resize<cr>
nnoremap <space>ra :ResizeAll<cr>
