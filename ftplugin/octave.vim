if expand('%:') =~ '.*tab.*plot\.m'
	nnoremap <buffer> <LocalLeader>b gg:/fpath<CR>f'<C-w>f
endif

setlocal makeprg=octave\ %:p
if exists('$OCTAVERUNTIME')
	setlocal runtimepath+=$OCTAVERUNTIME/**2
elseif has('unix')
	setlocal runtimepath+=$HOME/octave/**2
elseif has('win32')
	setlocal runtimepath+=C:/Program\ Files/octave-5.1.0-w64/mingw64/share/octave/packages
endif
nnoremap <buffer> gs :split $HOME/.octaverc<CR>
nnoremap <buffer> gS :split $HOME/.config/octave/qt-settings<CR>

