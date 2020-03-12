if expand('%') == 'highlight test'
	call init#map#main()
endif

if expand('%') == '[BufExplorer]'
	nnoremap <buffer> <C-q> :bdelete<CR>
endif

if expand('%:p') =~ 'gissues'
	call init#map#main()
endif

if expand('%:p') =~ 'pandoc output'
	call init#map#main()
	setlocal preivewwindow
endif

