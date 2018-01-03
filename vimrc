set nocompatible          " don't try to be vi compatible
filetype plugin indent on " important options
syntax on                 " turn on syntax highlighting

let mapleader = "\<Space>"
colorscheme apprentice

set modelines=0           " security
set number                " show line numbers
set ruler                 " show file stats
set visualbell            " blink dont beep
set encoding=utf-8        " encoding
set hidden                " allow hidden buffers
set laststatus=2          " always show status bar
set mouse=a               " sometimesss i click
set updatetime=250        " speed up gitgutter
set autoindent

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

" cursor motion
set scrolloff=3
set backspace=indent,eol,start
set matchpairs+=<:>        " use % to jump between pairs
runtime! macros/matchit.vim
set whichwrap+=<,>,h,l,[,] " wrap cursor on more shit

" move up/down editor lines
nnoremap j gj
nnoremap k gk

" folds
set foldmethod=syntax
set foldnestmax=10
set foldlevelstart=10

" last line
set showmode
set showcmd

" searching
nnoremap / /\v
xnoremap / /\v
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch

" formatting
map <leader>q gqip
map <leader>u vipJjjj
set nojoinspaces

" execute file being edited
noremap <buffer> <leader>pl :!/usr/bin/perl % <cr>
noremap <buffer> <leader>py :!/usr/bin/env python % <cr>
noremap <buffer> <leader>sh :!/bin/bash % <cr>

" menu
set wildmenu
set wildmode=list:longest

" visualize tabs and newlines
set listchars=tab:▸\ ,eol:¬

" undo shit
set backupdir=~/.vim/junk/backup// " double slash means files are stored with
set directory=~/.vim/junk/swp// " full path, to eliminate clobbering
set undodir=~/.vim/junk/undo//
set viewdir=~/.vim//junk/view//
set undofile
set undolevels=1000
set undoreload=10000

" better arrows
nnoremap <left> :bp<cr>
nnoremap <right> :bn<cr>

" mode exit
imap jj <Esc>

" kill highlight
map <leader>l :let @/=''<cr>

" kill whitespace
nnoremap <silent> <leader>W :%s/\s\+$//<cr>:let @/=''<cr>

" vimrc
noremap <silent> <leader>ev :e ~/.vim/vimrc<cr>
noremap <silent> <leader>rv :so ~/.vim/vimrc<cr>

" alt-tab
nnoremap <leader><leader> :b#<CR>

" better window changing
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" make Y like C/D
nnoremap Y y$

" toggles
nnoremap <silent><leader>w :set wrap!<cr>
nnoremap <silent><leader>n :set number!<cr>
nnoremap <silent><leader>gg :GitGutterToggle<cr>

" let me save with sudo when needed
cmap w!! %!sudo tee > /dev/null %

" clipboard shit
vmap <leader>y "+y
vmap <leader>d "+d

" cosmetics
set shortmess=I " hide splash screen

" %< means truncate on the left if too long
set statusline=%<%F " %F is full path to the file we are editing
set statusline+=%m " %m shows [+] if the file is modified but not saved
set statusline+=%r " %r shows [RO] if a file is read-only
set statusline +=\ %{fugitive#statusline()}
set statusline+=%= " separation point between the left and right items
set statusline+=%{&fileformat}
set statusline+=%Y " %Y shows the filetype
set statusline+=%5l " %l shows the line number
set statusline+=,
set statusline+=%-5v " %v shows the virtual column number;

" plugin shit
let g:jsx_ext_required = 0 " dont require .jsx extension
let g:indentLine_color_term = 238

" ack
nnoremap <leader>a :Ack!<space>
let g:ackprg = 'rg --vimgrep'

" leaderf
map <leader>v :LeaderfMru<cr>
let g:Lf_CommandMap = {'<C-C>': ['<Esc>', '<C-C>']}
let g:Lf_ShortcutF = '<C-P>'
let g:Lf_DefaultMode = 'FullPath'

" easy align
vmap <Enter> <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" fugitive
nmap <leader>gs :Gstatus<cr>
nmap <leader>gc :Gcommit<cr>
nmap <leader>ga :Gwrite<cr>
nmap <leader>gl :Git! log<cr>
nmap <leader>gd :Gdiff<cr>
nmap <leader>gv :GV<cr>
nmap <leader>gf :GV!<cr>

" gutter
nmap [c <Plug>GitGutterPrevHunk
nmap ]c <Plug>GitGutterNextHunk

" ale
nmap [e <Plug>(ale_previous_wrap)
nmap ]e <Plug>(ale_next_wrap)

" dwm
let g:dwm_map_keys = 0
let g:dwm_make_commands = 0
nmap <C-_> <Plug>DWMRotateCounterclockwise
nmap <C-\> <Plug>DWMRotateClockwise
nmap <C-n> <Plug>DWMNew
nmap <C-c> <Plug>DWMClose
nmap <C-f> <Plug>DWMFocus
nmap <M-l> <Plug>DWMGrowMaster
nmap <M-h> <Plug>DWMShrinkMaster
nnoremap <M-j> <C-W>w
nnoremap <M-k> <C-W>W

" Add the virtualenv's site-packages to vim path
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

augroup Convenience
  " move this to ftdetect when i figure out HOW
  autocmd FileType javascript.jsx setlocal commentstring={/*\ %s\ */}

  " get completions from current syntax file
  autocmd BufEnter * exec('setlocal complete+=k$VIMRUNTIME/syntax/'.&ft.'.vim')
  set iskeyword+=-,:

  " when editing a file, always jump to the last cursor position
  autocmd BufReadPost *
  \ if line("'\"") > 0 && line ("'\"") <= line("$") |
  \   exe "normal g'\"" |
  \ endif
augroup END

augroup CursorLine
  autocmd!
  autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  autocmd WinLeave * setlocal nocursorline
augroup END

packloadall
silent! helptags ALL
