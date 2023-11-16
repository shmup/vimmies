" cyclecolors.vim
" cycle through colorschemes

function! CycleColors(direction, all_colors=0)
  if a:all_colors
      let colorscheme_names = getcompletion("", "color")
  else
    let colorschemes = split(globpath(expand("~/.vim/colors/"), "*.vim"), "\n")
    let colorscheme_names = map(colorschemes, {_,v -> fnamemodify(v, ':t:r')})
  endif
  let current_color_index = index(colorscheme_names, g:colors_name)
  let next_colorscheme = a:direction == '→' ? current_color_index + 1 : current_color_index - 1
  let next_colorscheme = (next_colorscheme + len(colorscheme_names)) % len(colorscheme_names)
  execute 'colorscheme ' . colorscheme_names[next_colorscheme]
  redraw
  echo colorscheme_names[next_colorscheme]
endfunction

nnoremap <silent> <Right> :call CycleColors('→')<CR>
nnoremap <silent> <Left> :call CycleColors('←')<CR>
nnoremap <silent> <Up> :call CycleColors('→', 1)<CR>
nnoremap <silent> <Down> :call CycleColors('←', 1)<CR>

" http://ix.io/4rDX
