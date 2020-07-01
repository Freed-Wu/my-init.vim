function! defx#calibredb#main(context) abort "{{{
	for l:target in a:context.targets
		if fnamemodify(l:target, ':e') ==# 'pdf'
			let l:cmd = 'calibredb add ' . l:target
		else
			let l:cmd = 'ebook-convert ' . l:target . ' ' . fnamemodify(l:target, ':h') . '.pdf'
		endif
		execute 'AsyncRun ' . l:cmd
	endfor
endfunction "}}}
