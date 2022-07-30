gimme リ工从从工乇丂 daddy
===================

![vim on fire](https://jtm.keybase.pub/tmp/vim_on_fire.gif)

### REQUIRES

- [vim9 +python](https://github.com/shmup/vimmies/wiki/Installing-vim8)
- leans on but not so much requires: fzf, rg, various linters, etc

You can use the [vimmies script](https://github.com/shmup/vimmies/blob/master/vimmies) to help manage submodules, or just do the stuff below.

**INSTALL**

```sh
git clone https://github.com/shmup/vimmies.git ~/.vim && cd ~/.vim
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
