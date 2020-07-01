function! defx#soffice#main(context) abort "{{{
	for l:target in a:context.targets
		if fnamemodify(l:target, ':e') ==# 'pdf'
			execute 'PdftkDump ' . l:target
		else
			let l:cmd = 'soffice --convert-to pdf ' . l:target
			execute 'AsyncRun ' . l:cmd
		endif
	endfor
endfunction "}}}
