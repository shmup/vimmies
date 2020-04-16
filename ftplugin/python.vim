" ftplugin/python.vim
" http://ix.io/2ijM/vim

noremap <buffer><space>py :!clear; python %<cr>

if executable('flake8')
  setlocal errorformat=%f:%l:%c:%m
  setlocal makeprg=flake8
  nnoremap <buffer><space>m :silent make! % \| redraw!<cr>
endif

" gq{motion}
if executable('yapf')
  let &l:formatprg = 'yapf'
endif

" add the virtualenv's site-packages to vim path
if has("python")
py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF
endif
