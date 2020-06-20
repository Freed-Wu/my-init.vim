scriptencoding utf-8
function! cn#map#main() "{{{
	nnoremap <buffer> J :<C-u>execute('silent! .+1,.+'.v:count1.'substitute/\v^　*//g\|.-'.v:count1.',.join\| normal! ``')<CR>:let @/= ''<CR>
	xnoremap <buffer> J :<C-u>execute('silent! ''<+1,''>substitute/\v^　*//g\|''<,''>join\| normal! ``')<CR>:let @/= ''<CR>
	nmap <buffer> w <Plug>(coc-ci-w)
	nmap <buffer> b <Plug>(coc-ci-b)
	nmap <buffer> e <Plug>(coc-ci-w)h
	nmap <buffer> ge <Plug>(coc-ci-b)l
	nnoremap <buffer> W w
	nnoremap <buffer> B b
	nnoremap <buffer> E e
	nnoremap <buffer> gE gE
	xmap <buffer> w <Plug>(coc-ci-w)
	xmap <buffer> b <Plug>(coc-ci-b)
	xmap <buffer> e <Plug>(coc-ci-w)h
	xmap <buffer> ge <Plug>(coc-ci-b)l
	xnoremap <buffer> W w
	xnoremap <buffer> B b
	xnoremap <buffer> E e
	xnoremap <buffer> gE gE
	omap <buffer> w <Plug>(coc-ci-w)
	omap <buffer> b <Plug>(coc-ci-b)
	omap <buffer> e <Plug>(coc-ci-w)h
	omap <buffer> ge <Plug>(coc-ci-b)l
	onoremap <buffer> W w
	onoremap <buffer> B b
	onoremap <buffer> E e
	onoremap <buffer> gE gE
endfunction "}}}

