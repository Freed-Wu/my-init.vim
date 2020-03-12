if expand('%') =~ 'xls'
	nnoremap <buffer> <C-r> :ExcelView %<CR>
endif

if expand('%') =~ 'jar'
	setlocal makeprg=java\ -jar\ %:p
else
	setlocal makeprg=7z\ x\ %:p
endif

call init#map#main()

setlocal buftype=

nnoremap <buffer> . :split %<<CR>

