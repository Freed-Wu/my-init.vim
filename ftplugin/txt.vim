scriptencoding utf-8

if (expand('%:p:h') =~# substitute($VIMRUNTIME, '\', '\\\\', 'g') || expand('%:p:h') =~# substitute($GITWORKSPACE, '\', '\\\\', 'g')) && expand('%:p:h') !~# $USER
	setlocal nomodifiable
	setlocal readonly
	call init#map#main()
endif

if expand('%:t') ==# 'requirements.txt'
	setlocal makeprg=pip\ install\ -r\ %
else
	setlocal makeprg=aria2c\ -i\ %
endif

setlocal colorcolumn=+1
setlocal formatexpr=bucky#md#format()
setlocal expandtab
setlocal tabstop=4
setlocal shiftwidth=4
setlocal noautoindent
setlocal nocindent
setlocal textwidth=0
setlocal nolinebreak

nnoremap <buffer> J :<C-u>execute('silent! .+1,.+'.v:count1.'substitute/\v^　*//g\|.-'.v:count1.',.join\| normal! ``')<CR>:let @/= ''<CR>
xnoremap <buffer> J :<C-u>execute('silent! ''<+1,''>substitute/\v^　*//g\|''<,''>join\| normal! ``')<CR>:let @/= ''<CR>
if expand('%:p:h:t') !=# 'doc'
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
endif
