function! defx#ssconvert#main(context) abort "{{{
	for l:target in a:context.targets
		if fnamemodify(l:target, ':e') ==# 'csv'
			let l:cmd = 'ssconvert ' . l:target . ' ' . fnamemodify(l:target, ':r') . '.xlsx'
		else
			let l:cmd = 'ssconvert ' . l:target . ' ' . fnamemodify(l:target, ':r') . '.csv'
		endif
		execute 'AsyncRun ' . l:cmd
	endfor
endfunction "}}}
