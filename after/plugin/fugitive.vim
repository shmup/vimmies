function! StartsWith(longer, shorter) abort
  return a:longer[0:len(a:shorter)-1] ==# a:shorter
endfunction

function! InWindows() abort
  " /home/jtm/jtm is a symlink to /mnt/c/Users/jtm
  return StartsWith(fnameescape(FugitiveWorkTree()), '/mnt') || StartsWith(fnameescape(FugitiveWorkTree()), '/home/jtm/jtm')
endfunction

function! FugitiveGitPath(path) abort
  if InWindows()
    let g:fugitive_git_executable = '/mnt/c/PROGRA~1/Git/cmd/git.exe'

    return substitute(a:path, '^/mnt/\(\a\)/', '\1:/', '')
  endif

  return a:path
endfunction

function! FugitiveVimPath(path) abort
  " if InWindows()
  "   return substitute(a:path, '^\(\a\):/', '/mnt/\1/', '')
  " endif

  return a:path
endfunction
