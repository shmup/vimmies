" tmux related mappings to re-run commands in X pane

" get the pane # by running `tmux_leader + q`
" run your command in that pane so that !! reruns it

" use the mappings below to rerun your tests or whatever the fuck you're doing
nnoremap tk0 :Tmux send-keys -t 0 'C-c' Enter '!!' Enter<CR>
nnoremap tk1 :Tmux send-keys -t 1 'C-c' Enter '!!' Enter<CR>
nnoremap tk2 :Tmux send-keys -t 2 'C-c' Enter '!!' Enter<CR>
nnoremap tk3 :Tmux send-keys -t 3 'C-c' Enter '!!' Enter<CR>
nnoremap tm0 :Tmux send-keys -t 0 '!!' Enter<CR>
nnoremap tm1 :Tmux send-keys -t 1 '!!' Enter<CR>
nnoremap tm2 :Tmux send-keys -t 2 '!!' Enter<CR>
nnoremap tm3 :Tmux send-keys -t 3 '!!' Enter<CR>

" obv you can make these command more customized but this technique allowed me
" to be minimal and very dynamic via `!!` referring to `previous command`

" https://github.com/tpope/vim-tbone
" very basic tmux support.

" http://ix.io/2kb9/vim
