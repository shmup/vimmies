gimme vimmies daddy
===================

**REQUIRES**

[vim8 +python](https://github.com/shmup/vimmies/wiki/Installing-vim8)

**INSTALL**

```sh
git clone --recursive -j8 https://github.com/shmup/vimmies.git ~/.vim
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

fzf and ripgrep are for fuzzy filtering and faster grepping

the rest are for linting and formatting various languages

* fzf        https://github.com/junegunn/fzf
* ripgrep    https://github.com/BurntSushi/ripgrep
* shellcheck https://github.com/koalaman/shellcheck
* flake8     https://github.com/koalaman/shellcheck
* yapf       https://github.com/google/yapf
* eslint     https://github.com/eslint/eslint
* prettier   https://github.com/prettier/prettier
