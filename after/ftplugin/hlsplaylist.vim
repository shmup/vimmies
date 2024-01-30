" WIP - not working
" Define syntax regions for folding
syn region hlsFold start="#EXTINF:" end="#EXT-X-DISCONTINUITY" keepend

" Set fold method to syntax
setlocal foldmethod=syntax

" Optional: Automatically close folds when opening HLSPLAYLIST files
setlocal foldlevel=0
