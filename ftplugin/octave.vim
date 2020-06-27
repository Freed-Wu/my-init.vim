call vimtex#init()

setlocal foldmethod=syntax
setlocal makeprg=octave\ %:p
setlocal keywordprg=:Help
setlocal iskeyword-=:
if exists('$OCTAVEFORGE')
	setlocal path+=$OCTAVERUNTIME/**2
elseif has('unix')
	setlocal path+=$HOME/octave/**2
elseif has('win32')
	setlocal path+=C:/Program\ Files/octave-5.1.0-w64/mingw64/share/octave/packages/**2
endif
if exists('$OCTAVERUNTIME')
	setlocal path+=$OCTAVERUNTIME/**2
elseif has('unix')
	setlocal path+=/usr/share/octave/5.1.0/m/**2
elseif has('win32')
	setlocal path+=C:/Program\ Files/octave-5.1.0-w64/mingw64/share/octave/5.1.0/m/**2
endif

