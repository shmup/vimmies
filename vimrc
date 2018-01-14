set nocompatible          " don't try to be vi compatible
filetype plugin indent on " important options
syntax on                 " turn on syntax highlighting

colorscheme apprentice

let mapleader = "\<Space>"

set modelines=0           " security
set ruler                 " show file stats
set visualbell            " dont blink
set t_vb=                 " dont beep
set encoding=utf-8        " encoding
set hidden                " allow hidden buffers
set laststatus=2          " always show status bar
set mouse=a               " sometimesss i click
set updatetime=250        " speed up gitgutter
set autoindent

" don't offer to open certain files/directories
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png,*.ico,*.svg
set wildignore+=*.pdf,*.psd
set wildignore+=node_modules/*,bower_components/*,*/.vim/junk/*

" easier change and replace word
nnoremap c* *Ncgn
nnoremap c# #NcgN
nnoremap cg* g*Ncgn
nnoremap cg# g#NcgN

" netrw
nnoremap - :Ex<cr>
let g:netrw_banner = 0
let g:netrw_hide = 1
let g:netrw_list_hide= '.*\.swp$,.DS_Store,*/tmp/*,*.so,*.swp,*.zip,*.git,^\.\.\=/\=$'

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
nnoremap ,t :tabfind *
nnoremap ,F :find ./**/*
nnoremap ,S :sfind ./**/*
nnoremap ,V :vert sfind ./**/*
nnoremap ,T :tabfind ./**/*

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
set shortmess=I " hide splash screen

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
set foldmethod=indent
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
map <space>q gqip
map <space>u vipJjjj
set nojoinspaces

" execute file being edited
noremap <buffer> <space>pl :!/usr/bin/perl % <cr>
noremap <buffer> <space>py :!/usr/bin/env python % <cr>
noremap <buffer> <space>sh :!/bin/bash % <cr>

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

" window management
set splitright
nmap <c-s>n :enew<cr>
nmap <c-n> :vnew<cr>
nmap <c-c> :x<cr>
" maximize
nnoremap <C-w>m <C-w>\|<C-w>_

" mode exit
imap jj <esc>

" kill highlight
map <space>l :let @/=''<cr>

" kill whitespace
nnoremap <silent> <space>W :%s/\s\+$//<cr>:let @/=''<cr>

" vimrc
noremap <silent> <space>ev :e ~/.vim/vimrc<cr>
noremap <silent> <space>rv :so ~/.vim/vimrc<cr>

" alt-tab
nnoremap <space><space> :b#<cr>

" search and replace
nnoremap <space>s :'{,'}s/\<<C-r>=expand('<cword>')<cr>\>/
nnoremap <space>% :%s/\<<C-r>=expand('<cword>')<cr>\>/

" auto expansion
inoremap (<cr> (<cr>)<esc>O
inoremap {<cr> {<cr>}<esc>O
inoremap {; {<cr>};<esc>O
inoremap {, {<cr>},<esc>O
inoremap [<cr> [<cr>]<esc>O
inoremap [; [<cr>];<esc>O
inoremap [, [<cr>],<esc>O

" better window changing
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" make Y like C/D
nnoremap Y y$

" toggles
nnoremap <silent><space>w :set wrap!<cr>
nnoremap <silent><space>n :set number!<cr>
nnoremap <silent><space>gg :GitGutterToggle<cr>

" let me save with sudo when needed
cmap w!! %!sudo tee > /dev/null %

" clipboard shit
vmap <space>y "+y
vmap <space>d "+d

" %< means truncate on the left if too long
" set statusline=%F " %F is full path to the file we are editing
" set statusline+=%m " %m shows [+] if the file is modified but not saved
" set statusline+=%r " %r shows [RO] if a file is read-only
" set statusline+=%= " move to the right side
" set statusline+=%5{&fileformat}
" set statusline+=%Y " %Y shows the filetype
" set statusline+=%5l " %l shows the line number
" set statusline+=,
" set statusline+=%-5v " %v shows the virtual column number;

set statusline=%5l " %l shows the line number
set statusline+=,
set statusline+=%-2v " %v shows the virtual column number;

" set statusline+=%2{v:register} " %v shows the virtual column number;

set statusline+=%5{&fileformat}
set statusline+=%Y " %Y shows the filetype

set statusline+=%= " move to the right side

set statusline+=%<%F " %F is full path to the file we are editing
set statusline+=%m " %m shows [+] if the file is modified but not saved
set statusline+=%r " %r shows [RO] if a file is read-only


" plugin shit
let g:jsx_ext_required = 0 " dont require .jsx extension
let g:indentLine_color_term = 238
let g:indentLine_setConceal = 0 " messes with markdown too

" easy align
vmap <enter> <plug>(EasyAlign)
xmap ga <plug>(EasyAlign)
nmap ga <plug>(EasyAlign)

" fugitive/rhubarb/gv
nmap <space>gb :Gblame<cr>
nmap <space>gs :Gstatus<cr>
nmap <space>gc :Gcommit<cr>
nmap <space>ga :Gwrite<cr>
nmap <space>gl :Git! log<cr>
nmap <space>gd :Gdiff<cr>
nmap <space>gv :GV!<cr>
nmap <space>gf :GV<cr>

" gutter
nmap [c <plug>GitGutterPrevHunk
nmap ]c <plug>GitGutterNextHunk

" tab nav
noremap <space>1 1gt
noremap <space>2 2gt
noremap <space>3 3gt
noremap <space>4 4gt
noremap <space>5 5gt
noremap <space>6 6gt
noremap <space>7 7gt
noremap <space>8 8gt
noremap <space>9 9gt

" markdown shit
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']

" scratch bufferrrrr
command! SC vnew | setlocal nobuflisted buftype=nofile bufhidden=wipe noswapfile

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
  set iskeyword+=-

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
