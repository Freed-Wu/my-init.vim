function! defx#git_init#main(context) abort "{{{
	for l:target in a:context.targets
		execute 'AsyncRun git init ' . l:target
	endfor
endfunction "}}}

