if expand('%') ==# 'highlight test'
	call init#map#main()
	finish
endif

if expand('%:p') =~# 'gissues'
	call init#map#main()
	finish
endif

if expand('%:p') =~# 'pandoc output'
	call init#map#main()
	setlocal preivewwindow
	finish
endif

