gimme vimmies daddy
===================

**REQUIRES**

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

**NOTES**

i'm working on a [WHY](WHY.md) thing that needs work, but explains my setup

fzf and ripgrep are for fuzzy filtering and faster grepping

* fzf        https://github.com/junegunn/fzf
* ripgrep    https://github.com/BurntSushi/ripgrep

these are for linting and formatting various languages

* flake8     http://flake8.pycqa.org/en/latest
* yapf       https://github.com/google/yapf
* eslint     https://github.com/eslint/eslint
* prettier   https://github.com/prettier/prettier
* shellcheck https://github.com/koalaman/shellcheck
