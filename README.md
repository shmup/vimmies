gimme リ工从从工乇丂 daddy
===================

![vim on fire](junk/vim_on_fire.gif)

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

### THOUGHTS
- If you're new watch this: https://www.youtube.com/watch?v=wlR5gYd6um0
- Learn from: https://github.com/romainl/idiomatic-vimrc
- Remove any stuff ya don't need

### coc things

npm i -g bash-language-server





### fix my submodules

# Synchronize submodule URLs (useful if they have changed)
git submodule sync --recursive

# Initialize submodules (in case they weren't initialized)
git submodule update --init --recursive

# Forcefully update each submodule to match the remote tracking branch
git submodule foreach --recursive 'git fetch origin && git reset --hard origin/$(git rev-parse --abbrev-ref HEAD)'
