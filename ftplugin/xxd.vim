if !exists('b:bin')
	%!xxd
	let b:bin = 1
endif

autocmd BufWrite *.bin,*.exe,*.com call xxd#xxd#main(0)
			\| call xxd#xxd#main(0)

nnoremap <LocalLeader>t :call xxd#xxd#main(0)<CR>
nnoremap <buffer> <C-q> :call xxd#xxd#main(1)\| xit<CR>

