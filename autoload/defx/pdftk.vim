function! defx#pdftk#main(context) abort "{{{
	execute 'AsyncRun pdftk ' . join(a:context.targets, ' ') . ' output pdftk.pdf'
endfunction "}}}
