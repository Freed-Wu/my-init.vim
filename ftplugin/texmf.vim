if expand('%:p:h:t') == 'web2c'
	nnoremap <buffer><silent> <LocalLeader>g :split ./../../texmf.cnf<CR>
else
	nnoremap <buffer><silent> <LocalLeader>g :split ./texmf-dist/web2c/texmf.cnf<CR>
	setlocal nomodifiable
	setlocal readonly
	call init#map#main()
endif

setlocal makeprg=fmtutil-sys\ -all

