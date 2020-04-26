if expand('%:t') =~# 'python'
	setlocal syntax=python
elseif expand('%:t') =~# 'julia'
	setlocal syntax=julia
elseif expand('%:t') =~# 'octave'
	setlocal syntax=octave
elseif expand('%:t') =~# 'zsh'
	setlocal syntax=zsh
elseif expand('%:t') =~# 'bash'
	setlocal syntax=bash
elseif expand('%:t') =~# 'shell'
	setlocal syntax=shell
elseif expand('%:t') =~# 'csh'
	setlocal syntax=csh
elseif expand('%:t') =~# 'wsh'
	setlocal syntax=wsh
elseif expand('%:t') =~# 'fish'
	setlocal syntax=fish
elseif expand('%:t') =~# 'mush'
	setlocal syntax=mush
elseif expand('%:t') =~# 'tcsh'
	setlocal syntax=tcsh
elseif expand('%:t') =~# 'gnash'
	setlocal syntax=gnash
elseif expand('%:t') =~# 'nodejs'
	setlocal syntax=javascript
else
	setlocal syntax=log
endif

