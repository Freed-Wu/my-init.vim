function! defx#yank_name#main(context) abort
	let @" = ''
	for l:target in a:context.targets
		let @" .= fnamemodify(l:target, ':t') . "\n"
	endfor
endfunction

