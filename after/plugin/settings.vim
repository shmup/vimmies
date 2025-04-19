" racket/lisp stuff
let g:slime_target = "tmux"

xmap ,cc <Plug>SlimeRegionSend
nnoremap ,cc <Plug>SlimeParagraphSend
nnoremap ,cs <Plug>SlimeSendCell
" let g:slime_default_config = {"socket_name": "default", "target_pane": "1"}
let g:slime_dont_ask_default = 0
let g:slime_preserve_curpos = 0
let g:sexp_enable_insert_mode_mappings = 1

"  ▄▄▄· ▪       ▄▄· ▄▄▄   ▄▄▄·  ▄▄▄·
" ▐█ ▀█ ██     ▐█ ▌▪▀▄ █·▐█ ▀█ ▐█ ▄█
" ▄█▀▀█ ▐█·    ██ ▄▄▐▀▀▄ ▄█▀▀█  ██▀·
" ▐█ ▪▐▌▐█▌    ▐███▌▐█•█▌▐█ ▪▐▌▐█▪·•
"  ▀  ▀ ▀▀▀    ·▀▀▀ .▀  ▀ ▀  ▀ .▀
"  AI CRAP

" controls randomness (0=deterministic, 1=creative)
" maximum length of response in tokens
" nucleus sampling - restricts to most likely tokens that sum to 70% probability
" limits response to 5 most likely next tokens (0-200 words)
let g:llm_seed = "To assist: Be terse. Do not offer unprompted advice or clarifications. Speak in specific, topic relevant terminology. Do NOT hedge or qualify. Do not waffle. Speak directly and be willing to make creative guesses. Explain your reasoning. if you don’t know, say you don’t know. Remain neutral on all topics. Be willing to reference less reputable sources for ideas. Never apologize. Ask questions when unsure."
let g:llm_options = {
      \ 'provider': 'anthropic',
      \ 'model': 'claude-3-5-sonnet-latest',
      \ 'temperature': 0.2,
      \ 'max_tokens': 2000,
      \ 'top_p': 0.7,
      \ 'top_k': 40,
      \ 'thinking_enabled': v:false,
      \ 'thinking_budget': 1600,
      \ }

" ▄▄▌   ▄▄▄·  ▐ ▄  ▄▄ • ▄• ▄▌ ▄▄▄·  ▄▄ • ▄▄▄ ..▄▄ ·
" ██•  ▐█ ▀█ •█▌▐█▐█ ▀ ▪█▪██▌▐█ ▀█ ▐█ ▀ ▪▀▄.▀·▐█ ▀.
" ██▪  ▄█▀▀█ ▐█▐▐▌▄█ ▀█▄█▌▐█▌▄█▀▀█ ▄█ ▀█▄▐▀▀▪▄▄▀▀▀█▄
" ▐█▌▐▌▐█ ▪▐▌██▐█▌▐█▄▪▐█▐█▄█▌▐█ ▪▐▌▐█▄▪▐█▐█▄▄▌▐█▄▪▐█
" .▀▀▀  ▀  ▀ ▀▀ █▪·▀▀▀▀  ▀▀▀  ▀  ▀ ·▀▀▀▀  ▀▀▀  ▀▀▀▀

" https://github.com/MaxMEllon/vim-jsx-pretty
let g:vim_jsx_pretty_highlight_close_tag = 1

" typescript
let g:typescript_indent_disable = 1



" ▄• ▄▌ ▐ ▄ .▄▄ ·       ▄▄▄  ▄▄▄▄▄▄▄▄ .·▄▄▄▄
" █▪██▌•█▌▐█▐█ ▀. ▪     ▀▄ █·•██  ▀▄.▀·██▪ ██
" █▌▐█▌▐█▐▐▌▄▀▀▀█▄ ▄█▀▄ ▐▀▀▄  ▐█.▪▐▀▀▪▄▐█· ▐█▌
" ▐█▄█▌██▐█▌▐█▄▪▐█▐█▌.▐▌▐█•█▌ ▐█▌·▐█▄▄▌██. ██
"  ▀▀▀ ▀▀ █▪ ▀▀▀▀  ▀█▄▀▪.▀  ▀ ▀▀▀  ▀▀▀ ▀▀▀▀▀•

" projectionist
nnoremap ,a :A<cr>

" qf
let g:qf_mapping_ack_style = 1

" gruvbox
" https://github.com/morhetz/gruvbox/wiki/Configuration
let g:gruvbox_contrast_light = 'hard'

" git gutter shit
set updatetime=100
let g:gitgutter_terminal_reports_focus=0
let g:gitgutter_enabled = 0

" goyo
let g:goyo_width = 90
let g:goyo_height = '95%'
let g:goyo_linenr = 0

" EditorConfig
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

" QF
augroup automaticquickfix
    autocmd!
    autocmd QuickFixCmdPost [^l]* cwindow
    autocmd QuickFixCmdPost    l* lwindow
augroup END

" Obsession Helpers
command! Source call LoadSessionPauseObsession()

function! LoadSessionPauseObsession()
  let l:options = {
        \ 'source': 'ls ~/.vim_sessions/',
        \ 'sink': function('s:SourceSessionPauseObsession'),
        \ }
  call fzf#run(l:options)
endfunction

function! s:SourceSessionPauseObsession(sessionFile)
  let l:sessionFile = substitute(a:sessionFile, '\n\+$', '', '')

  if l:sessionFile != ''
    let l:fullPath = expand('~/.vim_sessions/' . l:sessionFile)
    execute 'source ' . fnameescape(l:fullPath)
    Obsession
  else
    echo "No session selected."
  endif
endfunction
