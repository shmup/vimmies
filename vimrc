set nocompatible          " don't try to be vi compatible
filetype plugin indent on " important options
syntax on                 " turn on syntax highlighting

set background=dark

colorscheme apprentice

let g:colorizer_disable_bufleave = 1

let mapleader = "\<Space>"

set modelines=0           " security
set ruler                 " show file stats
set visualbell            " dont blink
set t_vb=                 " dont beep
set encoding=utf-8        " encoding
set hidden                " allow hidden buffers
set laststatus=2          " always show status bar
set mouse=a               " sometimesss i click
set autoindent            " dont need smartindent. syntax files do that

" TODO don't offer to open certain files/directories
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png,*.ico,*.svg
set wildignore+=*.pdf,*.psd
set wildignore+=bower_components/*,*/.vim/junk/*
set wildignore+=**/node_modules/**

" use existing tab if possible when loading a file from quickfix
set switchbuf+=usetab

" easier change and replace word
nnoremap c* *Ncgn
nnoremap c# #NcgN
nnoremap cg* g*Ncgn
nnoremap cg# g#NcgN

" search and replace
nnoremap <space>s :'{,'}s/\<<C-r>=expand('<cword>')<cr>\>/
nnoremap <space>% :%s/\<<C-r>=expand('<cword>')<cr>\>/

" change to file dir, repo dir, or Z result
nnoremap <silent> ,cd :lcd %:p:h<cr>
nnoremap <silent> ,cr :lcd <c-r>=fugitive#repo().tree()<cr><cr>
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
" nnoremap ,t :tabfind *
" nnoremap ,T :tabfind ./**/*

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
packadd matchit
set whichwrap+=<,>,h,l,[,] " wrap cursor on more shit

packadd cfilter

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
nnoremap <silent> <space>ev :edit ~/.vim/vimrc<cr>
nnoremap <silent> <space>eb :edit ~/.bashrc<cr>
nnoremap <silent> <space>en :edit ~/.ns1_aliases<cr>
nnoremap <silent> <space>rv :source ~/.vim/vimrc<cr>

" alt-tab between two buffers
nnoremap <space><space> :b#<cr>

" better window changing
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" make Y like C/D
nnoremap Y y$

" nnoremap <space>m :Make! ./upload.sh<cr>
nnoremap ,d :Dispatch!<cr>
nnoremap <space>m :Make<cr>

" toggles
nnoremap <silent>yot :exec "color " .
      \ ((g:colors_name == "apprentice") ? "modest" : "apprentice")<CR>
nnoremap <silent>yog :GitGutterToggle<cr>
nnoremap <silent><space>p :set paste!<cr>
nmap ,q <Plug>(qf_qf_switch)
nmap ,Q <Plug>(qf_qf_toggle_stay)

" let me save with sudo when needed
cmap w!! %!sudo tee > /dev/null %

" yank and delete to system clipboard
vnoremap <space>y "+y
vnoremap <space>d "+d

set statusline=%3l             " show the line number
set statusline+=,              " and a comma
set statusline+=%v             " show the virtual column number
set statusline+=,              " and a comma
set statusline+=%{strlen(@\")} " byte count in register
set statusline+=%Y             " show the filetype
" set statusline+=,%{FugitiveHead(6)}
set statusline+=,%t           " show the filename
set statusline+=\              " and two spaces
set statusline+=%{ObsessionStatus('●\ ','■\ ')}

set statusline+=\              " and two spaces
set statusline+=%=             " move to the right side
set statusline+=%<%F           " (truncated) full path to the file we are editing
set statusline+=%m             " [+] if the file is modified but not saved
set statusline+=%r             " show [RO] if a file is read-only

" clean up bc i am a filthy slob
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
xmap ga <plug>(EasyAlign)
nmap ga <plug>(EasyAlign)

" fugitive/rhubarb/gv
nmap <space>gb :Gblame<cr>
nmap <space>gs :Gstatus<cr>
nmap <space>ge :Gedit<cr>
nmap <space>gc :Gcommit -v<cr>
nmap <space>gn :Gcommit -v --no-verify<cr>
nmap <space>ga :Git add -p<cr>
nmap <space>gm :Gcommit -v --amend<cr>
nmap <space>gp :Gpush<cr>
nmap <space>gl :BCommits<cr>
nmap <space>gd :Gdiff<cr>
nmap <space>gv :GV!<cr>
nmap <space>gf :GV<cr>
nmap <space>gw :Gwrite<cr>

" gutter
nmap [c <plug>GitGutterPrevHunk
nmap ]c <plug>GitGutterNextHunk
nmap <space>hs <Plug>GitGutterStageHunk
nmap <space>hu <Plug>GitGutterUndoHunk
nmap <space>hv <Plug>GitGutterPreviewHunk

" colors
command! CT silent! execute "ColorToggle"
highlight SEND_HELP ctermbg=131 ctermfg=white
highlight CLEAN ctermbg=white ctermfg=black
highlight GENERIC cterm=reverse gui=reverse
highlight ColorColumn ctermbg=238

augroup SpecialHighlights
  autocmd!
  autocmd WinEnter,BufEnter *
    \  call clearmatches()
    \| call matchadd('ColorColumn', '\s\+$', 100)
    \| call matchadd('SEND_HELP', 'HACK')
    \| call matchadd('SEND_HELP', 'TEMPORARY')
    \| call matchadd('SEND_HELP', 'ALERT', 101)
    \| call matchadd('GENERIC', 'NOTE')
    \| call matchadd('GENERIC', 'EXCEPTION')
    \| call matchadd('CLEAN', 'CLEANME')
augroup END

" show the groupings under cursor
command! SS echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')

" Tig current file
command! Tig execute "Start tig " . expand('%:p')

" scratch buffer
command! SC vnew | setlocal nobuflisted buftype=nofile nospell filetype=markdown bufhidden=wipe noswapfile

" remove all but current buffer
command! BufOnly silent! execute "%bd|e#|bd#"

" delete current file & buffer
command! DeleteFile call DeleteFileAndCloseBuffer()

command! -nargs=1 Silent
  \ | execute ':silent !'.<q-args>
  \ | execute ':redraw!'

augroup Convenience
  " get completions from current syntax file
  autocmd BufEnter * exec('setlocal complete+=k$VIMRUNTIME/syntax/'.&ft.'.vim')
  set iskeyword+=-

  let ignorelist =['vim','help']

  autocmd! Filetype * if (index(ignorelist, &ft) == -1)
    \ | let &l:keywordprg=fnamemodify($MYVIMRC, ":h") . "/.vim/tools/search.sh " . &l:filetype | endif

  " when editing a file, always jump to the last cursor position
  autocmd BufReadPost *
  \ if line("'\"") > 0 && line ("'\"") <= line("$") |
  \   exe "normal g'\"" |
  \ endif

  " https://github.com/tpope/tpope/blob/master/.vimrc
  autocmd CursorHold,BufWritePost,BufReadPost,BufLeave *
    \ if isdirectory(expand("<amatch>:h"))
    \ | let &swapfile = &modified | endif
augroup END

augroup CursorLine
  autocmd!
  autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  autocmd WinLeave * setlocal nocursorline
augroup END

packloadall
silent! helptags ALL
