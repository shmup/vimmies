gimme 𝕧immies daddy
===================

![vim on fire](https://jtm.keybase.pub/tmp/vim_on_fire.gif)

### REQUIRES

- [vim8 +python](https://github.com/shmup/vimmies/wiki/Installing-vim8)
- leans on but not so much requires: fzf, rg, various linters, etc

You can use the [vimmies script](https://github.com/shmup/vimmies/blob/master/vimmies) to help manage submodules, or just do the stuff below.

**INSTALL**

```sh
git clone https://github.com/shmup/vimmies.git ~/.vim
git submodule update --init --recursive
mkdir -p ~/.vim/junk/{backup,swp,undo,view}
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

- First timers, watch this: https://www.youtube.com/watch?v=wlR5gYd6um0
- Learn from: https://github.com/romainl/idiomatic-vimrc
- Reduce bullshit


# TODO

apt install build-essential ncurses-dev python2 xclip libx11-dev libxtst-dev libxt-dev libsm-dev libxpm-dev

apt install tlp
