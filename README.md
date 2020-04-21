gimme 𝕧immies daddy
===================

![vim on fire](https://jtm.keybase.pub/tmp/vim_on_fire.gif)

### REQUIRES

[vim8 +python](https://github.com/shmup/vimmies/wiki/Installing-vim8)
..and various other command line tools I lean on..

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

- Learn from https://github.com/romainl/idiomatic-vimrc
- Reduce bullshit
