function! xxd#xxd#main(exit) "{{{
	if b:bin
		%!xxd -r
		let b:bin = 0
	elseif a:exit == 0
		%!xxd
		let b:bin = 1
	endif
endfunction "}}}

