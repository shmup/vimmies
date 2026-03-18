this is shmup's vim project

# structure

- vimrc: main config, space is leader
- after/ftplugin/: per-filetype settings (~30 languages)
- after/plugin/: feature configs (coc, fzf, slime, git, toggles, etc)
- after/syntax/: syntax tweaks (markdown, sh, journal)
- autoload/: small helpers (visual selection, eslint)
- colors/: colorschemes (downloaded via vimmies script, not submodules)
- ftdetect/: custom filetype detection
- tools/: shell scripts and figlet fonts
- junk/: backup, swp, undo, view dirs (not tracked)

# plugins

managed as git submodules in pack/plugins/start/. ~60 plugins.

key ones:
- lsp/completion: coc.nvim (extensions: clangd, go, phpactor, pyright, rust-analyzer, sh, tsserver, zig)
- git: vim-fugitive, vim-rhubarb, vim-gitgutter
- fuzzy: fzf.vim (Files, GFiles, Buffers, History, Lines, Tags, BCommits)
- editing: vim-commentary, vim-surround, vim-repeat, vim-easy-align, vim-unimpaired, traces.vim
- navigation: vim-dirvish, file-line, vim-projectionist
- ai: copilot.vim (disabled by default), aichat.vim (local plugin from ~/projects/), vim-ai
- lisp/sexp: vim-sexp, vim-sexp-mappings-for-regular-people, vim-slime (tmux target)
- languages: vim-go, elm-vim, vim-raku, vim-racket, zig.vim, python-syntax, typescript-vim, etc
- misc: goyo.vim, vim-obsession, far.vim, vim-table-mode, vim-just

# vimmies script

bash script at repo root for managing this setup:
- -s/--setup: init submodules, create junk dirs, install bash completion
- -u/--update-plugins: update all (-a flag) or pick one via fzy
- -U/--upgrade-vim: build vim from source (linux) or brew upgrade (mac)
- -i/--install-plugin: add plugin as submodule (with cache for reinstall)
- -r/--remove-plugin: proper submodule removal with cache
- -l/--list-plugins: show all installed plugins with urls
- -c/--plugin-changes: git log for each plugin
- -f/--flush-junk: clear backup/swp/undo/view dirs
- -v/--verify: check submodule health
- also updates colorschemes from github raw urls and runs coc npm install

# conventions

- colorscheme: saturnite (dark), xcode (light), toggled with yot
- 2-space indent, expandtab
- fzf for fuzzy finding everything (files, buffers, history, tags, coc commands)
- space-prefixed mappings for common actions, comma-prefixed for plugin/find stuff
- coc inlay hints and codelens disabled by default (toggle with ,ch and ,cl)
- copilot disabled by default (toggle with ,cp)
- osc52 clipboard disabled by default (toggle with yoy)
- gitgutter disabled by default (toggle with yog)
- custom statusline with register byte count, hex char, filetype, coc/copilot/llm indicators
- sessions stored in ~/.vim_sessions/, loaded via :Source command
