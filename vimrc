set nocompatible          " don't try to be vi compatible
syntax on                 " turn on syntax highlighting
set modelines=0           " security
set number                " show line numbers
set ruler                 " show file stats
set visualbell            " blink dont beep
set encoding=utf-8        " encoding
set hidden                " allow hidden buffers
set laststatus=2          " always show status bar

let mapleader = "\<Space>"

" whitespace
set wrap
set textwidth=79
set formatoptions=tcqrn1
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround

" cursor motion
set scrolloff=3
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs
runtime! macros/matchit.vim

" move up/down editor lines
nnoremap j gj
nnoremap k gk

" last line
set showmode
set showcmd

" searching
nnoremap / /\v
vnoremap / /\v
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch

" formatting
map <leader>q gqip

" visualize tabs and newlines
set listchars=tab:▸\ ,eol:¬

" color scheme (terminal)
set t_Co=256
set background=dark
colorscheme monokai

" undo shit
set backupdir=~/.vim/junk/backup// " double slash means files are stored with
set directory=~/.vim/junk/swp// " full path, to eliminate clobbering
set undodir=~/.vim/junk/undo//
set viewdir=~/.vim//junk/view//
set undofile
set undolevels=1000
set laststatus=2
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

" f1 shit
nnoremap <f1> <C-^>
inoremap <f1> <esc><C-^>
nnoremap <leader><leader> :b#<CR>

" better window changing
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" make Y like C/D
nnoremap Y y$

" more intuitive j/k
noremap j gj
noremap k gk

" clipboard shit
vmap <leader>y "+y
vmap <leader>d "+d
nnoremap <leader>a :Ack!<space>

" cosmetics
set shortmess=I " hide splash screen

" when editing a file, always jump to the last cursor position
autocmd BufReadPost *
\ if line("'\"") > 0 && line ("'\"") <= line("$") |
\   exe "normal g'\"" |
\ endif

" cursor line shit
augroup CursorLine
  au!
  au VimEnter * setlocal cursorline
  au WinEnter * setlocal cursorline
  au BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END

" %< means truncate on the left if too long
set statusline=%<%F " %F is full path to the file we are editing
set statusline+=%m " %m shows [+] if the file is modified but not saved
set statusline+=%r " %r shows [RO] if a file is read-only
set statusline +=\ %{fugitive#statusline()}
set statusline+=%= " separation point between the left and right items
set statusline+=%{&fileformat}
set statusline+=%Y " %Y shows the filetype, such as VIM or HTML or GO
set statusline+=%8l " %l shows the line number
set statusline+=,
set statusline+=%-8v " %v shows the virtual column number;

" plugin shit
map <leader>v :LeaderfMru<cr>
let g:Lf_CommandMap = {'<C-C>': ['<Esc>', '<C-C>']}
let g:Lf_ShortcutF = '<C-P>'
let g:Lf_DefaultMode = 'FullPath'
let g:jsx_ext_required = 0 " dont require .jsx extension
let g:ackprg = 'rg --vimgrep'
let g:indentLine_color_term = 238
vmap <Enter> <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
nmap <leader>gs :Gstatus<cr>
nmap <leader>gc :Gcommit<cr>
nmap <leader>ga :Gwrite<cr>
nmap <leader>gl :Git! log<cr>
nmap <leader>gd :Gdiff<cr>
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
" commentary custom shit
autocmd FileType vim setlocal commentstring=\"\ %s
autocmd FileType javascript.jsx setlocal commentstring={/*\ %s\ */}
