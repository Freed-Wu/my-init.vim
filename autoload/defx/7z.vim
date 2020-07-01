function! defx#7z#main(context) abort "{{{
	for l:target in a:context.targets
		execute 'AsyncRun 7z a ' . l:target . '.7z ' . l:target
	endfor
endfunction "}}}

