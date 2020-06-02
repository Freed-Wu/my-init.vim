function! defx#yank_name#main(context) abort
	let @0 = ''
	for l:target in a:context.targets
		let @0 .= fnamemodify(l:target, ':t') . "\n"
	endfor
endfunction

