function! FzfSpellSink(word)
  exe 'normal! "_ciw'.a:word
endfunction
function! FzfSpell()
  let suggestions = spellsuggest(expand("<cword>"))
  " return fzf#run({'source': suggestions, 'sink': function("FzfSpellSink"), 'down': 10 })
  return fzf#run(fzf#wrap({'prompt': expand("<cword>"), 'source': suggestions, 'sink': function("FzfSpellSink")}))y
endfunction
" nnoremap z= :call FzfSpell()<CR>
