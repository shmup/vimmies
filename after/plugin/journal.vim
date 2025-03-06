vim9script

const pages_home = '~/matrix/brain/pages'

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

