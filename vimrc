let g:slime_no_mappings = 1
let g:copilot_enabled = 1

let mapleader = "\<Space>"

filetype plugin indent on " important options
syntax on                 " turn on syntax highlighting

let lightscheme = 'xcode'
let darkscheme = 'saturnite'
set background=dark
execute 'colorscheme ' . darkscheme

nnoremap gt :Tags<CR>
nnoremap gT :BTags<CR>

" i do this a lot: ggVG followed by <space>y
" TODO -DOES NOT WORK
nnoremap <C-S-c> ggVG<Space>y


" I want gL to run :Lines
nnoremap gl :Lines<CR>

set autoindent            " dont need smartindent. syntax files do that
set encoding=utf-8        " encoding
set hidden                " allow hidden buffers
set iskeyword+=-
set laststatus=2          " always show status bar
set linebreak             " breaks on space + :set breakat?
set modelines=1           " security
set noequalalways         " don't equalize window sizes when splitting
set ruler                 " show file stats
set signcolumn=number
set t_vb=                 " dont beep
set termguicolors
set visualbell            " dont blink
set mouse=a               " enable mouse

" TODO don't offer to open certain files/directories
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png,*.ico
set wildignore+=*.pdf,*.psd,*.com,*.tdy,*.dll,*.exe
set wildignore+=*.o,*.obj,*.so,*.a,*.lib;
set wildignore+=bower_components/*,*/.vim/junk/*
set wildignore+=**/node_modules/**,tags,**/dist/**

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

" formatting
set nojoinspaces
nnoremap <space>q gggqG

" visualize tabs and newlines
set listchars=tab:▸\ ,eol:¬
let &showbreak = '↳ '

" set guitablabel=%f
set guitablabel=%t

" undo/backup shit
set backupdir=~/.vim/junk/backup// " double slash means files are stored with
set directory=~/.vim/junk/swp//    " full path, to eliminate clobbering
set undodir=~/.vim/junk/undo//
set viewdir=~/.vim/junk/view//
set undofile
set undolevels=1000
set undoreload=10000
set backupcopy=yes

" change cursor from block to i-beam in insert mode
" https://vim.fandom.com/wiki/Change_cursor_shape_in_different_modes
" may need but idk:  autocmd VimEnter * silent !echo -ne "\e[1 q"
let &t_SI = "\e[5 q"
let &t_EI = "\e[1 q"

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
nnoremap <silent> <space>ev :edit ~/.vim/vimrc<cr>
nnoremap <silent> <space>es :edit ~/.vim/after/plugin/settings.vim<cr>
nnoremap <silent> <space>rv :source ~/.vim/vimrc<cr>
nnoremap <silent> <space>er :edit ~/lisp/notes/learnxiny.rkt<cr>
nnoremap <silent> <space>eg :edit ~/.vim/tools/gpt/<cr>
nnoremap <silent> <space>el :edit ~/brain/journals/<cr>
nnoremap <silent> <space>eu :edit ~/txt/unicode.txt<cr>
nnoremap <silent> <space>ei :edit ~/.config/i3/config<cr>
nnoremap <silent> <space>eb :edit ~/.bashrc<cr>
nnoremap <silent> <space>ej :edit ~/matrix/brain/journals/<cr>:$<cr>
nnoremap <silent> <space>em :edit ~/matrix<cr>
nnoremap <silent> <space>ep :edit ~/.profile<cr>
nnoremap <silent> <space>ex :edit ~/.Xdefaults<cr>
nnoremap <silent> <space>ed :edit ~/projects/xom.world/txt/shmup.crawlrc<cr>
nnoremap <silent> <space>et :edit ~/.tmux.conf<cr>
nnoremap <silent> <space>ef :edit ~/.mozilla/firefox/jtm/chrome/userChrome.css<cr>
nnoremap <silent> <space>ec :edit ~/.vim/coc-settings.json<cr>
nnoremap <silent> <space>ea :edit ~/.config/alacritty/alacritty.toml<cr>

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
nnoremap <silent><expr>yot printf(":set bg=%s \| colo %s\r", &bg ==# 'dark' ? 'light' : 'dark', &bg ==# 'dark' ? lightscheme : darkscheme)
nnoremap <silent>yog :GitGutterToggle<cr>
nnoremap <silent>yoS :SCREAM<CR>
nnoremap <silent>yoW :WHISPER<CR>
nnoremap <silent>yoz :syntax sync fromstart<CR>
nnoremap yoo :ToggleLlm<CR>
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
inoremap `<cr> `<cr>`<esc>O
inoremap {<cr> {<cr>}<esc>O
inoremap {; {<cr>};<esc>O
" inoremap {, {<cr>},<esc>O
inoremap [<cr> [<cr>]<esc>O
inoremap [; [<cr>];<esc>O
" inoremap [, [<cr>],<esc>O

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

" code assistance
inoremap <silent> <C-l> <Plug>(copilot-suggest)
inoremap <silent> <C-j> <Plug>(copilot-next)
inoremap <silent> <S-C-j> <Plug>(copilot-accept-line)
nnoremap <silent> ,cl :CocCommand document.toggleCodeLens<CR>
nnoremap <silent> ,ch :CocCommand document.toggleInlayHint<CR>
nnoremap <silent> ,cw :Workspaced<CR>
nnoremap <silent> ,cp :let g:copilot_enabled = !g:copilot_enabled
    \ <bar> echo "Copilot " . (g:copilot_enabled ? "enabled" : "disabled")
    \ <CR>

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
nnoremap <space>tn :tabnew<cr>:tabmove 0<cr>
nnoremap <space>tN :tabnew<cr>
nnoremap <space>tc :tabclose<cr>
nnoremap <space>to :tabonly<cr>
for i in range(1, 9)
  execute 'nnoremap <Space>'.i.' '.i.'gt'
  execute 'nnoremap <Space>tm'.i.' :tabmove '.(i-1).'<CR>'
endfor

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
nmap <space>gb :G blame<cr>
nmap <space>gs :G<cr>
nmap <space>ge :Gedit<cr>
nmap <space>gl :BCommits<cr>
nmap <space>gL :GcLog<cr>
nmap <space>gd :Gdiffsplit<cr>
nmap <space>gw :Gwrite<cr>
nmap <space>gp :Git log -p -- %<cr>

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" gutter
nmap [c <plug>(GitGutterPrevHunk)
nmap ]c <plug>(GitGutterNextHunk)
nmap <space>hs <Plug>(GitGutterStageHunk)
nmap <space>hu <Plug>(GitGutterUndoHunk)
nmap <space>hv <Plug>(GitGutterPreviewHunk)

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
set statusline+=%{www#status()}
set statusline+=%{ObsessionStatus('💾','')}
set statusline+=%{g:coc_enabled?'🌍':'🌕'}
set statusline+=%{g:copilot_enabled?'🌚':'🌜'} " 🌚 🌛 🌜 🌝 🌞
set statusline+=\              " and two spaces
set statusline+=%=             " move to the right side
set statusline+=%<%F           " (truncated) full path to the file we are editing
set statusline+=%m             " [+] if the file is modified but not saved
set statusline+=%r             " show [RO] if a file is read-only

nnoremap <silent> ,gg :Goyo<cr>

command! -range GOpen execute 'silent ! git browse ' . expand('%') . ' ' . <line1> . ' ' . <line2> | checktime | redraw!

" Show words and codes as colors, coc.nvim does this in some filetypes
command! CT silent! execute "ColorToggle"

" show the groupings under cursor
command! SS echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')

" Tig current file
command! Tig execute "Start tig " . expand('%:p')

" scratch buffer
command! SC vnew | setlocal nobuflisted buftype=nofile nospell filetype=markdown bufhidden=wipe noswapfile
command! JS vsplit ~/tmp/tmp.js | setlocal nobuflisted nospell filetype=javascript bufhidden=wipe noswapfile

command! Workspaced let g:copilot_workspace_folders = FugitiveWorkTree()

augroup Convenience
  " get completions from current syntax file
  autocmd BufEnter * exec('setlocal complete+=k$VIMRUNTIME/syntax/'.&ft.'.vim')

  " let ignorelist =['vim', 'help', 'perl', 'sh', 'racket']
  " autocmd Filetype * if (index(ignorelist, &ft) == -1)
  "       \ | let &l:keywordprg=fnamemodify($MYVIMRC, ":h") . "/tools/search.sh " . &l:filetype | endif

  " jump to last cursor position
  autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") |
        \ exe "normal! g'\"" | endif

  " https://vi.stackexchange.com/a/69/287
  " prevents unmodified buffer + crash = bullshit swap file
  " autocmd CursorHold,BufWritePost,BufReadPost,BufLeave *
  "       \ if isdirectory(expand("<amatch>:h")) | let &swapfile = &modified | endif
augroup END

" augroup CursorLine
"   autocmd!
"   autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
"   autocmd WinLeave * setlocal nocursorline
" augroup END


function! UpdatePluginDocs()
    silent! helptags ALL

    echo "Plugin documentation updated!"
endfunction
command! UpdatePluginDocs call UpdatePluginDocs()

function! WrapWithAsciiWalls(style) range
  let l:start = a:firstline
  let l:end = a:lastline

  if a:firstline == 0 && a:lastline == 0
    let l:start = line('.')
    let l:end = l:start
  endif

  let l:lines = getline(l:start, l:end)

  " Determine the wrapping characters based on the style parameter.
  let l:wrap_chars = get({
        \ 'H': ['█▓▒░ ', ' ░▒▓█'],
        \ 'H2': ['▓▒░ ', ' ░▒▓'],
        \ 'H3': ['▒░ ', ' ░▒'],
        \ 'H4': ['░ ', ' ░'],
        \ }, a:style, v:null)

  if l:wrap_chars is v:null
    throw "Invalid style: ".a:style
  endif

  " Apply wrapping characters to each line.
  let l:wrapped_lines = map(l:lines, '"'.l:wrap_chars[0].'" . v:val . "'.l:wrap_chars[1].'"')

  call setline(l:start, l:wrapped_lines)
endfunction

command! -range H <line1>,<line2>call WrapWithAsciiWalls('H')
command! -range H1 <line1>,<line2>call WrapWithAsciiWalls('H1')
command! -range H2 <line1>,<line2>call WrapWithAsciiWalls('H2')
command! -range H3 <line1>,<line2>call WrapWithAsciiWalls('H3')
command! -range H4 <line1>,<line2>call WrapWithAsciiWalls('H4')

" nnoremap <silent> <S-Right> :vertical resize +5<CR>
" nnoremap <silent> <S-Left> :vertical resize -5<CR>
" nnoremap <silent> <S-Up> :resize +5<CR>
" nnoremap <silent> <S-Down> :resize -5<CR>

" colors
hi SpellBad term=reverse ctermbg=226 ctermfg=0

packadd! matchit
