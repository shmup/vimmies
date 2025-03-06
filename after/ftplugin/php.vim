if executable('php')
  setlocal makeprg=php\ -l\ %
  setlocal errorformat=%m\ in\ %f\ on\ line\ %l,%-GErrors\ parsing\ %f,%-G
  nnoremap <buffer> <silent> <f5> :update<bar>sil! make<bar>cwindow<cr>
endif

if executable('prettier')
  let &l:formatprg = 'NODE_PATH=/home/jtm/.config/nvm/versions/node/v20.17.0/lib/node_modules prettier --stdin-filepath % --parser=php'
endif

let g:PHP_outdentphpescape = 0
let g:PHP_htmlInStrings = 1
