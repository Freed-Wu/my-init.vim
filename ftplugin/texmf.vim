if expand('%:p:h:t') !=# 'web2c'
	setlocal nomodifiable
	setlocal readonly
	call init#map#main()
endif

setlocal makeprg=fmtutil-sys\ -all

