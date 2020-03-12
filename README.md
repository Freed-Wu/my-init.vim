myInit.vim
==========

This is my init.vim. Just for reference.

![vim screenshot]

## Construction ##

```
|-- undefined
    |-- .gitignore
    |-- .gvimrc //gvim run control file
    |-- easyvim.vim //like notepad, for newbie to use temporaryly
    |-- init.vim //vim/nvim run control file
    |-- LICENSE
    |-- README.md
    |-- autoload //function user defined
    |   |-- ...
    |-- bitmaps //icon for tool bar and title bar user defined
    |   |-- vim.ico
    |-- etc //system environment variables configure file
    |   |-- cygwin.sh
    |-- ftdetect //filetype detect file user defined
    |   |-- filetype.vim
    |-- ftplugin //filetype plugin user defined
    |   |-- arduino.vim
    |   |-- ...
    |-- img //images for README.md
    |   |-- vim.png
    |-- neoformat //formater run control file
    |   |-- astylerc
    |   |-- ...
    |-- UltiSnips //snippets for UltiSnips
    |   |-- all.snippets
    |   |-- ...
    |-- vim-gutentags //tags run control file
    |   |-- default.ctags
    |   |-- ...
    |-- vim-pandoc //pandoc run control file
    |   |-- reference.docx
    |   |-- ...
    |-- vim-splash //ascii images for vim-splash
    |   |-- Yoda.txt
    |   |-- ...
    |-- vim-template //templates for vim-template
        |-- =template=.asm
        |-- ...
```

*Note:* Add `set nocompatiable` in `.vimrc`.
If OS is Windows/NT, add `set encoding=utf-8`, too.

## Style ##

- Use 8 bit tab to indent file.
- Use snake_case to name variables.
- Use MixedCase to name commands.

## Environment Variables ##

### Vim Environment Variables ###

```{vim}
let $USER = 'Freed-Wu'
let g:mapleader = ' '
let g:maplocalleader = ';'
```

### System Environment Variables ###

#### Windows/NT ####

```{powershell}
./etc/windows.ps1
```

### GNU/Unix-like ####

Add environment variables in system configure file.

e.g.

```{bash}
vim /etc/profile.d/user.sh
```

## Hotkey ##

Press `<Leader>`, `<LocalLedaer>`, `g`, `z`, `[`, `]`, `i`, `a`, `I`, `A` to see
hotkey prompt.

*NOTE*: `i`, `a`, `I`, `A` is text object which only can work in visual mode.

## Plugin ##

```{vim}
if dein#load_state($GITWORKSPACE) && !v:vim_did_enter
	call dein#begin($GITWORKSPACE)

	"add user/plugin below
	call dein#add('.../...')

	call dein#end()
	call dein#save_state()
endif
```

*NOTE*: don't recommend use `dein#load_toml()` which is slow than `dein#add()`

[vim screenshot]: img/vim.png

