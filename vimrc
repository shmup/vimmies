set nocompatible          " don't try to be vi compatible
filetype plugin indent on " important options
syntax on                 " turn on syntax highlighting

" paused experiment
let hour = strftime("%H")
if hour >= 22 || hour <= 06
  colorscheme apprentice
else
  colorscheme apprentice
endif

let mapleader = "\<Space>"

set autoindent            " dont need smartindent. syntax files do that
set encoding=utf-8        " encoding
set hidden                " allow hidden buffers
set laststatus=2          " always show status bar
set linebreak             " breaks on space + :set breakat?
set modelines=0           " security
set mouse=a               " sometimesss i click
set noequalalways         " don't equalize window sizes when splitting
set ruler                 " show file stats
set signcolumn=number
set t_vb=                 " dont beep
set termguicolors
set visualbell            " dont blink

" TODO don't offer to open certain files/directories
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png,*.ico
set wildignore+=*.pdf,*.psd,*.com,*.tdy
set wildignore+=bower_components/*,*/.vim/junk/*
set wildignore+=**/node_modules/**

" use existing tab if possible when loading a file from quickfix
set switchbuf+=usetab

" whitespace
set nowrap
set textwidth=0
set formatoptions=tcqrn1
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround

" ui
set lazyredraw " make things like macros run faster
set wildmenu
set wildmode=list:full
set shortmess+=WI

" cursor motion
set scrolloff=1
set backspace=indent,eol,start
set matchpairs+=<:>        " use % to jump between pairs
set whichwrap+=<,>,h,l,[,] " wrap cursor on more shit

" folds
set foldmethod=indent
set foldnestmax=10
set foldlevelstart=10

" last line
set showmode
set showcmd

" searching
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch

" change cursor from block to i-beam in insert mode
" https://vim.fandom.com/wiki/Change_cursor_shape_in_different_modes
" may need but idk:  autocmd VimEnter * silent !echo -ne "\e[1 q"
let &t_SI = "\e[5 q"
let &t_EI = "\e[1 q"

" formatting
set nojoinspaces
nnoremap <space>q gggqG

" visualize tabs and newlines
set listchars=tab:▸\ ,eol:¬
let &showbreak = '↳ '

" undo/backup shit
set backupdir=~/.vim/junk/backup// " double slash means files are stored with
set directory=~/.vim/junk/swp//    " full path, to eliminate clobbering
set undodir=~/.vim/junk/undo//
set viewdir=~/.vim/junk/view//
set undofile
set undolevels=1000
set undoreload=10000
set backupcopy=yes

" window management
set splitright
nmap <c-n> :SC<cr>
nmap <c-c> :q<cr>
" maximize
nnoremap <C-w>\ <C-w>\|<C-w>_

" mode exit
imap jj <esc>

" kill highlight
map <space>l :let @/=''<cr>

nnoremap gf gF
nnoremap gF gf

" kill whitespace
nnoremap <silent> <space>W :%s/\s\+$//<cr>:let @/=''<cr>

" vimrc
nnoremap <silent> <space>rv :source ~/.vim/vimrc<cr>
nnoremap <silent> <space>eg :edit ~/.vim/tools/gpt/<cr>
nnoremap <silent> <space>el :edit ~/brain/journals/<cr>
nnoremap <silent> <space>eu :edit ~/txt/unicode.txt<cr>
nnoremap <silent> <space>ev :edit ~/.vim/vimrc<cr>
nnoremap <silent> <space>ei :edit ~/.config/i3/config<cr>
nnoremap <silent> <space>eb :edit ~/.bashrc<cr>
nnoremap <silent> <space>ex :edit ~/.Xdefaults<cr>
nnoremap <silent> <space>ed :edit ~/projects/xom.world/txt/shmup.crawlrc<cr>
nnoremap <silent> <space>et :edit ~/.tmux.conf<cr>
nnoremap <silent> <space>ef :edit ~/.mozilla/firefox/jtm/chrome/userChrome.css<cr>
nnoremap <silent> <space>ec :edit ~/.vim/coc-settings.json<cr>
nnoremap <silent> <space>ea :edit ~/.config/alacritty/alacritty.yml<cr>

" alt-tab between two buffers
nnoremap <space><space> :b#<cr>

" better window changing
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" make Y like C/D
nnoremap Y y$

" toggles, also :help *unimpaired-toggling*
" https://github.com/tpope/vim-unimpaired/blob/master/doc/unimpaired.txt#L77-L95
nnoremap <silent><expr>yot printf(":set bg=%s \| colo %s\r", &bg ==# 'dark' ? 'light' : 'dark', &bg ==# 'dark' ? 'flattened_light' : 'apprentice')
nnoremap <silent>yog :GitGutterToggle<cr>
nnoremap <silent>yoS :SCREAM<CR>
nnoremap <silent>yoW :WHISPER<CR>
nnoremap <silent>yoz :syntax sync fromstart<CR>
nnoremap yoo :ToggleChad<CR>
nmap ,q <Plug>(qf_qf_switch)
nmap ,Q <Plug>(qf_qf_toggle_stay)

" just do it
inoremap <C-x> ✅

nnoremap <leader>j :% !jq .<CR>

nnoremap j gj
nnoremap k gk

" easier change and replace word
nnoremap c* *Ncgn
nnoremap c# #NcgN
nnoremap cg* g*Ncgn
nnoremap cg# g#NcgN

" change to file dir, repo dir, or Z result
nnoremap <silent> ,cd :lcd %:p:h<cr>
nnoremap <silent> ,cr :lcd <c-r>=FugitiveWorkTree()<cr><cr>
nnoremap ,z :Z<space>
nnoremap ,e :silent Zedit<space>

" auto expansion
inoremap (<cr> (<cr>)<esc>O
inoremap {<cr> {<cr>}<esc>O
inoremap {; {<cr>};<esc>O
inoremap {, {<cr>},<esc>O
inoremap [<cr> [<cr>]<esc>O
inoremap [; [<cr>];<esc>O
inoremap [, [<cr>],<esc>O

" keep cursor put
nnoremap * *``
nnoremap # #``
nnoremap g* g*``
nnoremap g# g#``

" quicker buffer
nnoremap gb :ls<cr>:buffer<space>
nnoremap gB :ls<cr>:sbuffer<space>

" find mappings
nnoremap ,f :find *
nnoremap ,s :sfind *
nnoremap ,v :vert sfind *
nnoremap ,F :find ./**/*
nnoremap ,S :sfind ./**/*
nnoremap ,V :vert sfind ./**/*
nnoremap ,t :tabfind *
nnoremap ,T :tabfind ./**/*

nnoremap <silent> ,cc :silent! let b:copilot_enabled = !get(b:, 'copilot_enabled', v:false)<CR>

" let me save with sudo when needed
cmap w!! %!sudo tee > /dev/null %

" yank and delete to system clipboard
vnoremap <space>y "+y
vnoremap <space>d "+d

" it's a mood thing
command! BufOnly silent! execute "%bd|e#|bd#"
nnoremap <space>o :only<cr>
nnoremap <space>O :BufOnly<cr>

" tab nav
nnoremap <space>1 1gt
nnoremap <space>2 2gt
nnoremap <space>3 3gt
nnoremap <space>4 4gt
nnoremap <space>5 5gt
nnoremap <space>6 6gt
nnoremap <space>7 7gt
nnoremap <space>8 8gt
nnoremap <space>9 9gt
nnoremap <space>tn :tabnew<cr>
nnoremap <space>tc :tabclose<cr>
nnoremap <space>to :tabonly<cr>

" easy align
vmap <enter> <plug>(EasyAlign)
" xmap ga <plug>(EasyAlign)
" nmap ga <plug>(EasyAlign)

" GoTo code navigation.
nmap <silent><space>m :CocList --height=10 diagnostics<cr>
nmap <silent><space>M :CocDiagnostics 10<cr>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" inoremap <silent><expr> <tab> coc#refresh()


" fugitive/rhubarb/gv
nmap <space>gb :Git blame<cr>
nmap <space>gs :Git<cr>
nmap <space>ge :Gedit<cr>
nmap <space>gc :Gcommit -v<cr>
nmap <space>gn :Gcommit -v --no-verify<cr>
nmap <space>gm :Gcommit -v --amend<cr>
nmap <space>gp :Gpush<cr>
nmap <space>gl :BCommits<cr>
nmap <space>gL :GcLog<cr>
nmap <space>gd :Gdiffsplit<cr>
nmap <space>gw :Gwrite<cr>

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" gutter
nmap [c <plug>(GitGutterPrevHunk)
nmap ]c <plug>(GitGutterNextHunk)
nmap <space>hs <Plug>(GitGutterStageHunk)
nmap <space>hu <Plug>(GitGutterUndoHunk)
nmap <space>hv <Plug>(GitGutterPreviewHunk)

command! -range GOpen execute 'silent ! git browse ' . expand('%') . ' ' . <line1> . ' ' . <line2> | checktime | redraw!

set statusline=%3l             " show the line number
set statusline+=,              " and a comma
set statusline+=%v             " show the virtual column number
set statusline+=\              " and two spaces
set statusline+=(              " and a (
set statusline+=%{strlen(@\")} " byte count in register
set statusline+=)\              " and a )
set statusline+=%{printf('x%X',char2nr(getline('.')[getpos('.')[2]-1]))}
set statusline+=\              " and two spaces
set statusline+=%Y             " show the filetype
set statusline+=\              " and two spaces
set statusline+=%{ObsessionStatus('●\ ','■\ ')}
set statusline+=%{get(b:,'copilot_enabled',0)?'👂':'🙉'}
set statusline+=\              " and two spaces
set statusline+=%=             " move to the right side
set statusline+=%<%F           " (truncated) full path to the file we are editing
set statusline+=%m             " [+] if the file is modified but not saved
set statusline+=%r             " show [RO] if a file is read-only

" Show words and codes as colors, coc.nvim does this in some filetypes
command! CT silent! execute "ColorToggle"

" Session management
command! -bang Source call fzf#run({'source': 'ls', 'sink': 'source', 'dir': '~/.vim_sessions'})
command! -bang SourceOverwrite call fzf#run({'Obsession': 'ls', 'sink': 'Obsession', 'dir': '~/.vim_sessions'})

" show the groupings under cursor
command! SS echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')

" Tig current file
command! Tig execute "Start tig " . expand('%:p')

" scratch buffer
command! SC vnew | setlocal nobuflisted buftype=nofile nospell filetype=markdown bufhidden=wipe noswapfile
command! JS vsplit ~/tmp/tmp.js | setlocal nobuflisted nospell filetype=javascript bufhidden=wipe noswapfile

" delete current file & buffer
function! DeleteFileAndCloseBuffer()
  let choice = confirm("Delete file and close buffer?", "&Yes\n&No", 1)
  if choice == 1 | call delete(expand('%:p')) | b# | bd# | endif
endfun
command! DeleteFile call DeleteFileAndCloseBuffer()

augroup Convenience
  autocmd BufEnter * let b:copilot_enabled = v:false

  " get completions from current syntax file
  autocmd BufEnter * exec('setlocal complete+=k$VIMRUNTIME/syntax/'.&ft.'.vim')
  set iskeyword+=-

  let ignorelist =['vim','help','perl','sh']
  let g:vim_json_warnings = 0

  autocmd Filetype * if (index(ignorelist, &ft) == -1)
        \ | let &l:keywordprg=fnamemodify($MYVIMRC, ":h") . "/tools/search.sh " . &l:filetype | endif

  " when editing a file, always jump to the last cursor position
  autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") |
        \ exe "normal! g'\"" | endif

  " https://vi.stackexchange.com/a/69/287
  " prevents unmodified buffer + crash = bullshit swap file
  autocmd CursorHold,BufWritePost,BufReadPost,BufLeave *
        \ if isdirectory(expand("<amatch>:h")) | let &swapfile = &modified | endif
augroup END

augroup CursorLine
  autocmd!
  autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  autocmd WinLeave * setlocal nocursorline
augroup END

" colors
hi SpellBad term=reverse ctermbg=226 ctermfg=0
highlight SEND_HELP ctermbg=131 ctermfg=white
highlight SEND_WARNING ctermbg=129 ctermfg=white
highlight CLEAN ctermbg=white ctermfg=black
highlight PASS ctermbg=131 ctermfg=65
highlight GENERIC cterm=reverse gui=reverse
highlight ColorColumn ctermbg=238
highlight YELLOW ctermbg=black ctermfg=yellow
highlight GREEN ctermbg=black ctermfg=green
highlight RED ctermbg=black ctermfg=red

augroup SpecialHighlights
  autocmd!
  autocmd WinEnter,BufEnter *
        \  call clearmatches()
        \| call matchadd('ColorColumn', '\s\+$', 100)
        \| call matchadd('SEND_HELP', '\<HACK\>')
        \| call matchadd('SEND_HELP', '\<ERROR\>')
        \| call matchadd('SEND_HELP', '\<CLOSED\>')
        \| call matchadd('SEND_HELP', '\<BLOCKED\>')
        \| call matchadd('SEND_HELP', '\<REMOVED\>')
        \| call matchadd('SEND_HELP', '\<ALERT\>', 101)
        \| call matchadd('GENERIC', '^\<EMILY\>', 101)
        \| call matchadd('GENERIC', '^\<KRISTIAN\>', 101)
        \| call matchadd('GENERIC', '\<TODO\>')
        \| call matchadd('GENERIC', '\<NOTE\>')
        \| call matchadd('YELLOW', '^\<ASK\>')
        \| call matchadd('YELLOW', '#\d\+')
        \| call matchadd('SEND_WARNING', '\*priority\*')
        \| call matchadd('SEND_WARNING', '\*deprioritize\*')
        \| call matchadd('RED', '^\zs>')
        \| call matchadd('YELLOW', '^\zs<')
        \| call matchadd('GREEN', '^\zs!')
        \| call matchadd('YELLOW', '\/\/\s\+@.*')
        \| call matchadd('YELLOW', '\d\{4}-\d\{2}-\d\{2}T\d\{2}:\d\{2}:\d\{2}-\d\{4}')
        \| call matchadd('GENERIC', '\<NOTES\>')
        \| call matchadd('GENERIC', '\<EXCEPTION\>')
        \| call matchadd('CLEAN', '\<CLEANME\>')
augroup END

" TODO - investigate if you want these
packadd! cfilter
packadd! editexisting
packadd! matchit
packadd! justify

packloadall
silent! helptags ALL
