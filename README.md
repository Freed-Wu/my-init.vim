# my-init.vim
A backup for the config file of my computer.

[Screenshots](https://zhuanlan.zhihu.com/p/107065105)

## Usage ##

Configure vim.

## Install ##

[Config others](https://github.com/Freed-Wu/my-dotfiles.vim)

```{bash}
git clone git@github.com:Freed-Wu/my-init.vim.git ~/.config/nvim
# vimim need it
aria2c https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/vimim/vimim.pinyin_quote_sogou.txt -d ~/.config/nvim/etc/user.sh
# for GNU
sudo mv /etc/vim/vimrc /etc/vim/example.vimrc
sudo mv /etc/vim/gvimrc /etc/vim/example.gvimrc
sudo ln -s ~/.config/nvim/etc/user.sh /etc/profile.d
# for Windows
~/.config/nvim/etc/windows.ps1
```

## Customize ##

### Hotkey ###

Press `<Leader>`, `<LocalLedaer>`, `g`, `z`, `[`, `]`, `i`, `a`, `I`, `A` to see
hotkey prompt.

*NOTE*: `i`, `a`, `I`, `A` is text object which only can work in visual mode.

### Plugin ###

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

## Style ##

- Use 8 bit tab to indent file.
- Use snake_case to name variables.
- Use MixedCase to name commands.

