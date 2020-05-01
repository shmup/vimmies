" tmux related mappings to re-run commands in X pane

" tmux: leader + q to see pane numbers.
" pane: run command so that !! will rerun it

" use the mappings below to rerun your tests or whatever the fuck you're doing
nnoremap tm1 :Tmux send-keys -t 1 '!!' Enter<CR>
nnoremap tm2 :Tmux send-keys -t 2 '!!' Enter<CR>
nnoremap tm3 :Tmux send-keys -t 3 '!!' Enter<CR>
nnoremap tm4 :Tmux send-keys -t 4 '!!' Enter<CR>
nnoremap tm5 :Tmux send-keys -t 5 '!!' Enter<CR>

" obv you can make these command more customized but this technique allowed me
" to be minimal and very dynamic via `!!` referring to `previous command`

" https://github.com/tpope/vim-tbone
" very basic tmux support.

" http://ix.io/2kb9/vim
