" www.vim - Toggle browser-sync server with status indicator

let s:job = 0
let s:url = ''

function! s:toggle(...) abort
  if a:0 && a:1 ==# 'status'
    echo s:is_running() ? s:url : 'not running'
    return
  endif

  if s:is_running()
    call s:stop()
  else
    call s:start()
  endif
endfunction

function! s:is_running() abort
  return type(s:job) == v:t_job && job_status(s:job) ==# 'run'
endfunction

function! s:browser_sync_installed() abort
  return executable('browser-sync')
endfunction

function! s:start() abort
  if !s:browser_sync_installed()
    echohl ErrorMsg | echomsg 'please npm install -g browser-sync' | echohl None
    return
  endif
  let cmd = ['browser-sync', 'start', '--server', '--files', '.', '--no-ui', '--port', '3001']
  let s:job = job_start(cmd, {
        \ 'out_cb': function('s:handle_output'),
        \ 'err_cb': function('s:handle_error'),
        \ 'exit_cb': function('s:handle_exit'),
        \ })
  echohl Directory | echomsg 'Server starting...' | echohl None
endfunction

function! s:stop() abort
  if s:is_running()
    call job_stop(s:job)
    let s:job = 0
    echohl WarningMsg | echomsg 'Server stopped' | echohl None
  endif
endfunction

function! s:handle_output(channel, msg) abort
  if match(a:msg, 'External:') != -1
    let s:url = matchstr(a:msg, 'http://\S\+')
    echohl MoreMsg | echomsg 'Server running: '.s:url | echohl None
  endif
endfunction

function! s:handle_error(channel, msg) abort
  echohl ErrorMsg | echomsg 'SERVER ERROR: '.a:msg | echohl None
endfunction

function! s:handle_exit(job, status) abort
  let s:job = 0
  echohl WarningMsg | echomsg 'Server exited' | echohl None
endfunction

function! www#status() abort
  return s:is_running() ? '🌐' : ''
endfunction

function! www#get_url() abort
  return s:is_running() ? s:url : 'not running'
endfunction

command! -nargs=? WWW call s:toggle(<f-args>)

