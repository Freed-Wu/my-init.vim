if expand('%') ==# 'highlight test'
	call init#map#main()
endif

if expand('%') ==# '[BufExplorer]'
	nnoremap <buffer> <C-q> :bdelete<CR>
endif

if expand('%:p') =~# 'gissues'
	call init#map#main()
endif

if expand('%:p') =~# 'pandoc output'
	call init#map#main()
	setlocal preivewwindow
endif

if expand('%:p:t') ==# '[YankRing]'
	nnoremap <buffer> <C-r> :<C-u>execute 'vertical resize '.(winwidth(0) == g:columns? &columns / 2:g:columns)<CR>
endif

if expand('%:p:t') ==# g:vimtex_toc_config.name
	augroup init_vimtex_toc "{{{
		autocmd!
		autocmd User VimtexEventTocCreated call s:textoc()
	augroup END "}}}
	function! s:textoc() "{{{
		nnoremap <buffer> <C-r> :<C-u>execute 'vertical resize '.(winwidth(0) == g:columns? &columns / 2:g:columns)<CR>
		nnoremap <buffer> h h
		nnoremap <buffer> <Esc> <Esc>
		nnoremap <buffer> q q
		nnoremap <nowait><buffer> <Leader> :<C-u>WhichKey '<Leader>'<CR>
		nmap <buffer> t <Plug>Sneak_t
		nmap <buffer> f <Plug>Sneak_f
		nmap <buffer> F <Plug>Sneak_F
		nnoremap <buffer> gK :<C-u>call b:toc.toggle_help()<CR>
		nnoremap <buffer> <C-q> :<C-u>call b:toc.close()<CR>
		nnoremap <buffer> S :<C-u>call b:toc.toggle_sorted_todos()<CR>
		nnoremap <buffer> . :<C-u>call b:toc.clear_filter()<CR>
		nnoremap <buffer> = :<C-u>call b:toc.filter()<CR>
		nnoremap <buffer> K :<C-u>call b:toc.increase_depth()<CR>
		nnoremap <buffer> J :<C-u>call b:toc.decrease_depth()<CR>
	endfunction "}}}
endif

