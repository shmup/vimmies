gimme vimmies daddy
===================

### REQUIRES

[vim8 +python](https://github.com/shmup/vimmies/wiki/Installing-vim8)

I forget but the git submodule commands below may specifically require a particular version of git

**INSTALL**

```sh
git clone https://github.com/shmup/vimmies.git ~/.vim
git submodule update --init --recursive
mkdir -p ~/.vim/junk/backup ~/.vim/junk/swp ~/.vim/junk/undo ~/.vim/junk/view
```

**UPDATE SUBMODULES**
```
git submodule update --remote --merge
git commit
```

**REMOVE SUBMODULE**
```
git submodule deinit ~/.vim/pack/plugins/start/supertab
git rm ~/.vim/pack/plugins/start/supertab
rm -Rf .git/modules/pack/plugins/start/supertab
git commit
```

### NOTES

I'm working on a [WHY](WHY.md) thing that needs work, but explains my setup

fzf and ripgrep are for fuzzy filtering and faster grepping

* fzf        https://github.com/junegunn/fzf
* ripgrep    https://github.com/BurntSushi/ripgrep

These are for linting and formatting various languages

* flake8     http://flake8.pycqa.org/en/latest
* yapf       https://github.com/google/yapf
* eslint     https://github.com/eslint/eslint
* prettier   https://github.com/prettier/prettier
* shellcheck https://github.com/koalaman/shellcheck

### DIR STRUCTURE EXPLANATION

I'm going to explain what sort of files go in each directory

```
├── colors            | colorschemes
├── ftdetect          | simply for detecting a filetype, and setting another (ala md becomes markdown)
├── ftplugin          | plugins ran when a particular filetype is loaded
├── junk              | i just put all my backup/swap/undo/view shit here
│   ├── backup
│   ├── swp
│   ├── undo
│   └── view
├── pack
│   └── plugins/start | where i keep gitsubmodule loaded plugins
├── plugin            | smaller plugins i don't maintain through submodules
└── syntax            | filetype related syntax i want to add/overwrite
```
