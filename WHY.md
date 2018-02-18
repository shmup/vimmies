here's me briefly (or otherwise) describing each plugin i use

maybe this will make me use less plugins

## TODO

- i want to actually just explain some mappings i use in general, for vanilla vim shit, that is not related to plugins.

- also maybe explain some more mappings i've added that leverage these plugins.

### fzf.vim

on the system itself you will need fzf installed. you'll see mention for vim use to also install a fzf.vim plugin, but i've already included that in this repo

learn how to install here: https://github.com/junegunn/fzf

ultimately, even from a system level, it fuzzy filters a list of text. this can used in things like fuzzy filtering your bash history, or git commits. in vim, it can be used to fuzzy filter your repo, or files in the current directory (this will be from where you launched vim, unless you have `autochdir` set which will update your current vim working directory to the path of the file in buffer). 

the mappings i use are `ctrl-p` for the :GitFiles, or current files of the repo you're in.

i also use `<space>f`, which is all files in the directory (recursive) period.

also some git related ones, which the entirety of i keep in the `vimrc` itself. look for the block of them.

### vim-fugitive vim-gitgutter gv.vim vim-rhubarb

so **vim-fugitive** is a really popular plugin for git related commands. i have a lot of fugitive mappings (look up fugitive mappings in vimrc) but they're around things like `:Gstatus` and `:Gcommit` and so on. These are _normal git commands_ though and so they can accept all the arguments git itself can. I use `<space>ga` for example to add files to be staged, and `<space>gc` to commit.

read `help fugitive` sometime. for example in the `:Gstatus` window you can press - on a file to stage or unstage it. It's not bad for workflow.

**vim-gitgutter** is just a thing that shows symbols (+, ~, -) on the left side of the buffer (in the gutter), to show lines that have been added, modified, or removed from a currently git tracked file. I use a few bindings you can see in .vimrc like `<space>hu` to undo the changed hunk and `<space>hs` to stage the hunk. `:help gitgutter`

**vim-rhubarb** let's you interact with Github. I can type :Gbrowse on a file thta's tracked in some Github repo to open it in my browser in its Github repo.

**gv.vim** is by the dude who wrote fzf and it shows a nice commit window  with `:GV` (and other commands). I don't use it much because I love my `<space>gl` mapping for git commits. I should remove it.

### supertab

Does a lot of nice autocompletion with tab and just makes it work. I could probably replace this sometime with vanilla shit and maybe I will.

### vim-commentary

Gives you some nice commends to comment code. `gcc` comments and uncomments the current line, but this command also accepts a motion so I can `gcip` to comment the current paragraph my cursor is in. Can be extended with a one liner to add a particular comment syntax for a particule filetype.

### vim-dirvish

Press `-` to show a list of files that exist in vim's current directory (which will be where you loaded vim from unless you've used `:cd ~/foo/bar` or have `autochdir` enabled (I don't have it enabled)

Oh and press `q` to quit out of that view and return to the buffer you had loaded previously.

Vim does have a native thing called netrw that does this sorta feature you can view with `:Ex` and I did remove this plugin before, but it does some things nicer. Maybe read `:help dirvish`

### vim-easy-align

Aligns a block of text. If I have something like:

```
egg|10
fish|2
pig|7
```

And I want to add spacing so it's evened out on the | I can just select it all in visual mode (`ctrl-v and make the selection`) and press `<Enter>` and type `|`

The plugin does a lot more and you can do what I said above even simpler, but, read `:help easyalign`

### vim-qlist vim-qf

Quick example of the QuickFix list in vanilla vim (you can always view vanilla vim by opening it with vim -u NONE) is doing this:

`:grep foo *.js` which greps for foo in all .js files in current working directory. To view the results, you can type `:copen` to open the QuickFix list.

Cool! It's not that nice of a window though. You can't interact with it really easily.

**vim-qlist** is much nicer. It just lets you cursor up and down on the results and press `<Enter>` on a line to open the file directly.

But also I use **vim-qf** which adds some really nice commands/mappings to the QuickFix list. Things like `:Keep` and `:Reject`. If you had the list populated with things, you could remove from the list by a pattern or only keep things that match a specified pattern. 

All of this is useful for things I like to do with **grepping**, which behind the scenes will use `ripgrep` if you have it installed. 

But I have some find file/grep mappings in my vimrc you can see.

To see a nice **grep** example, press `,G` when your cursor is on a word you want to search all other files (recursively, from working directory) for.

### vim-surround

Admittedly I only use this for one thing: _changing single quotes to double quotes or to backticks or similar things_. But it lets you remove quotes from things and also add html tags around things. Has a command followed by a pattern. Read `:help surround` if you wanna learn more.

### vim-repeat

In vim, commands can be repeated with `.` but commands from plugins often cannot. tpope wrote a thing which allows command repeating for things like vim-commentary and vim-surround.

### vim-javascript

Some syntax and shit for javascript/es6

### vim-jsx

Some syntax and shit for jsx which is an html templating thing for javascript
