my-init.vim
===========

A backup for the config file of my computer.

[Screenshots](https://zhuanlan.zhihu.com/p/107065105)

Install
-------

[Config others](https://github.com/Freed-Wu/my-dotfiles.vim)

```{bash}
git clone git@github.com:Freed-Wu/my-init.vim.git ~/.config/nvim
# vimim need it
aria2c https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/vimim/vimim.pinyin_quote_sogou.txt -d ~/.cache/nvim/.VimIM
sudo mv /etc/vim/vimrc /etc/vim/example.vimrc
sudo mv /etc/vim/gvimrc /etc/vim/example.gvimrc
# for Windows
~/.config/nvim/etc/windows.ps1
```

Customize
---------

Press `<Leader>`, `<LocalLedaer>`, `g`, `z`, `[`, `]`, `i`, `a`, `I`, `A` to see
hotkey prompt.

*NOTE*: `i`, `a`, `I`, `A` is text object which only can work in visual mode.
