function! defx#ffplay#main(context) abort "{{{
	for l:target in a:context.targets
		let l:cmd = "ffplay '" . l:target . "'"
		execute 'AsyncRun ' . l:cmd
	endfor
endfunction "}}}
