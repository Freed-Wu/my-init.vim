if (expand('%:p:h') =~# substitute($VIMRUNTIME, '\', '\\\\', 'g') || expand('%:p:h') =~# substitute($GITWORKSPACE, '\', '\\\\', 'g')) && expand('%:p:h') !~# $USER
	setlocal nomodifiable
	setlocal readonly
	call init#map#main()
endif

setlocal makeprg=pandoc\ -o\ %:r.pdf\ --latex-engine=lualatex\ %
setlocal colorcolumn=+1
setlocal formatexpr=bucky#md#format()
setlocal expandtab
setlocal noautoindent
setlocal nocindent
setlocal textwidth=0
setlocal nolinebreak

call cn#map#main()
