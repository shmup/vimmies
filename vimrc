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
set autoindent            " dont need smartindent. syntax files do that

" don't offer to open certain files/directories
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png,*.ico,*.svg
set wildignore+=*.pdf,*.psd
set wildignore+=node_modules/*,bower_components/*,*/.vim/junk/*

" use existing tab if possible when loading a file from quickfix
set switchbuf+=usetab

" easier change and replace word
nnoremap c* *Ncgn
nnoremap c# #NcgN
nnoremap cg* g*Ncgn
nnoremap cg# g#NcgN

" i don't like autochdir, but i like to quickly do either of these
nnoremap <silent> ,cd :lcd %:p:h<cr>
nnoremap <silent> ,ch :lcd <c-r>=fugitive#repo().tree()<cr><cr>

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
set scrolloff=1
set backspace=indent,eol,start
set matchpairs+=<:>        " use % to jump between pairs
runtime! macros/matchit.vim
set whichwrap+=<,>,h,l,[,] " wrap cursor on more shit

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
set nojoinspaces

" visualize tabs and newlines
set listchars=tab:▸\ ,eol:¬

" undo/backup shit
set backupdir=~/.vim/junk/backup// " double slash means files are stored with
set directory=~/.vim/junk/swp//    " full path, to eliminate clobbering
set undodir=~/.vim/junk/undo//
set viewdir=~/.vim//junk/view//
set undofile
set undolevels=1000
set undoreload=10000
set backupcopy=yes

" better arrows
nnoremap <left> :bp<cr>
nnoremap <right> :bn<cr>

" window management
set splitright
nmap <c-n> :vnew<cr>
nmap <c-c> :x<cr>
" maximize
nnoremap <C-w>\ <C-w>\|<C-w>_

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

set statusline=%3l   " show the line number
set statusline+=,    " and a comma
set statusline+=%v   " show the virtual column number
set statusline+=%Y   " show the filetype
set statusline+=\ \  " and two spaces
set statusline+=%t   " show the filetype
set statusline+=\ \  " and two spaces
set statusline+=%=   " move to the right side
set statusline+=%<%F " (truncated) full path to the file we are editing
set statusline+=%m   " [+] if the file is modified but not saved
set statusline+=%r   " show [RO] if a file is read-only

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

" netrw
nnoremap - :Ex<cr>

" markdown shit
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']

" plugin shit
let g:jsx_ext_required = 0 " dont require .jsx extension

" easy align
vmap <enter> <plug>(EasyAlign)
xmap ga <plug>(EasyAlign)
nmap ga <plug>(EasyAlign)

" fugitive/rhubarb/gv
nmap <space>gb :Gblame<cr>
nmap <space>gs :Gstatus<cr>
nmap <space>gc :Gcommit -v<cr>
nmap <space>ga :Git add -p<cr>
nmap <space>gm :Gcommit --amend<cr>
nmap <space>gl :BCommits<cr>
nmap <space>gd :Gdiff<cr>
nmap <space>gv :GV!<cr>
nmap <space>gf :GV<cr>
nmap <space>gw :Gwrite<cr>

" gutter
nmap [c <plug>GitGutterPrevHunk
nmap ]c <plug>GitGutterNextHunk

" scratch bufferrrrr
command! SC vnew | setlocal nobuflisted buftype=nofile filetype=markdown bufhidden=wipe noswapfile

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
