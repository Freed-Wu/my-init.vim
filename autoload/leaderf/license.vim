function! leaderf#license#source(args) abort "{{{
	return LicenseComplete(0, 0, 0)
endfunction "}}}

function! leaderf#license#accept(line, args) abort "{{{
	execute 'License ' . a:line
endfunction "}}}

	" execute 'Stub ' . a:line
