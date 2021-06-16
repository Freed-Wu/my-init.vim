if expand('%:t')[-4:-1] ==# '.txt'
	setlocal makeprg=pandoc\ -o\ %:r.pdf\ --latex-engine=lualatex\ %
elseif expand('%:t') ==# 'aria2.session'
	setlocal makeprg=aria2c\ -i\ %
endif
setlocal colorcolumn=
setlocal nofoldenable
setlocal formatexpr=bucky#md#format()
setlocal expandtab
setlocal textwidth=0
setlocal noautoindent
