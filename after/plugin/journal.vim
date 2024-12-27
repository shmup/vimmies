vim9script

# Define the directory where new pages will be created
const pages_home = '~/matrix/brain/pages'

# Function to save and edit the new file
export def g:JournalSaveAndEdit()
  var word = expand('<cWORD>')
  if empty(word)
    return
  endif

  if stridx(word, '.') == -1
    word ..= '.txt'
  endif

  silent! write
  var filepath = fnamemodify(expand(pages_home .. '/' .. word), ':p')
  execute 'edit ' .. fnameescape(filepath)
enddef

# Function to set up journal settings and key mappings
export def g:JournalSetup()
  setlocal nospell
  setlocal nowrap
  nnoremap <buffer> <Enter> :call JournalSaveAndEdit()<CR>
  nnoremap <buffer> <BS> :b#<CR>
enddef

# Autocommand group for journal files
augroup Journal
  autocmd!
  autocmd FileType journal call JournalSetup()
augroup END
