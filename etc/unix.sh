if [ -b /dev/sdb4 ] ; then
	sudo mount /dev/sdb4 /mnt/cdrom
	sudo swapon /mnt/cdrom/swapfile
	sudo swapon /mnt/cdrom/swapfile2
fi

export CACA_DRIVER=ncurses
#system
export FONTS=/usr/share/fonts
export APPLICATIONS=/usr/share/applications
export DOCUMENTS=$HOME/Documents
export ZSH=$HOME/.zinit/plugins/ohmyzsh---ohmyzsh
export QQWORKSPACE=$HOME/Downloads/qq-files/1295652958/file_recv
export WAKATIME_HOME=$HOME/.config/nvim/.vim-wakatime
#vim
export VIMCONFIG=$HOME/.config/nvim
export VIMDATA=$HOME/.local/share/nvim
export VIMWORKSPACE=$HOME/Desktop
export MYONIRC=$HOME/.config/oni/config.tsx
export MYWAKATIMESYNCRC=$HOME/.config/wakatime-sync/config.json
export UDISK=/run/media/wzy/18355528308
export PANDOCRUNTIME=/usr/share/pandoc-1.19.2.1/ghc-8.0.2/data/templates/
#git
export GITWORKSPACE=$HOME/.vim
export GITHUBWORKSPACE=$HOME/.vim/repos/github.com
#dosbox
export MYDOSBOXRC=$HOME/.dosbox/dosbox-0.74-3.conf
export DOSBOXWORKSPACE=$HOME/.dosbox
#tex
export TEXRUNTIME=/usr/share/texmf-dist
export TEXWORKSPACE=$HOME/.texlive/texmf-var/tex/latex
export MYTEXRC=/etc/texmf.cnf
#matlab
#export MATLAB=
export OCTAVEWORKSPACE=$HOME/octave
#export MYMATLABRC=/startup.m
export MYGOCTAVERC=$HOME/.config/octave/qt-settings
export MYOCTAVERC=$HOME/.octaverc

