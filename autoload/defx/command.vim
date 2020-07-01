let s:temp = '/tmp/temp'
function! defx#command#main(context) abort "{{{
	execute 'vertical new ' . s:temp
	execute 'set filetype=' . fnamemodify(&shell, ':t')
	for l:target in a:context.targets
		0put=l:target
	endfor
	augroup defx_temp "{{{
		autocmd!
		execute 'autocmd BufLeave ' . s:temp . ' !source %'
		execute 'autocmd BufLeave ' . s:temp . ' call delete("' . s:temp . '")'
	augroup END "}}}
endfunction "}}}

