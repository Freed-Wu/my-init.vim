function! tex#map#main() "{{{
	nnoremap <buffer> <LocalLeader>/ :<C-u>silent !texdoc<Space>
	nmap <buffer> yse <plug>(vimtex-cmd-toggle-star)
	nmap <buffer> ysc <plug>(vimtex-env-toggle-star)
	nmap <buffer> ysd <plug>(vimtex-delim-toggle-modifier)
	nmap <buffer> ysD <plug>(vimtex-delim-toggle-modifier-reverse)
	nmap <buffer> <LocalLeader>i <plug>(vimtex-cmd-create)
	xmap <buffer> <LocalLeader>i <plug>(vimtex-cmd-create)
	xmap <buffer> af <Plug>(textobj-latex-paren-math-a)
	xmap <buffer> if <Plug>(textobj-latex-paren-math-i)
	xmap <buffer> aF <Plug>(textobj-latex-bracket-math-a)
	xmap <buffer> iF <Plug>(textobj-latex-bracket-math-i)
	xmap <buffer> aq <Plug>(textobj-latex-quote-a)
	xmap <buffer> iq <Plug>(textobj-latex-quote-i)
	xmap <buffer> aQ <Plug>(textobj-latex-double-quote-a)
	xmap <buffer> iQ <Plug>(textobj-latex-double-quote-i)
	if exists('$TEXMFDIST')
		execute 'nnoremap <buffer> <LocalLeader>l1 :<C-u>Leaderf file '.$TEXMFDIST.' --input=.pdf<CR>'
	elseif has('unix')
		nnoremap <buffer> <LocalLeader>l1 :<C-u>Leaderf file /usr/share/texmf-dist --input=.pdf<CR>
	elseif has('win32')
		nnoremap <buffer> <LocalLeader>l1 :<C-u>Leaderf file C:/Program files/texlive/texmf-dist --input=.pdf<CR>
	endif
	if exists('$TEXMFSITE')
		execute 'nnoremap <buffer> <LocalLeader>l2 :<C-u>Leaderf file '.$TEXMFSITE.' --input=.pdf<CR>'
	elseif has('unix')
		nnoremap <buffer> <LocalLeader>l2 :<C-u>Leaderf file /usr/share/texmf-site --input=.pdf<CR>
	elseif has('win32')
		nnoremap <buffer> <LocalLeader>l2 :<C-u>Leaderf file C:/Program files/texlive/texmf-site --input=.pdf<CR>
	endif
	if exists('$TEXMFLOCAL')
		execute 'nnoremap <buffer> <LocalLeader>l3 :<C-u>Leaderf file '.$TEXMFLOCAL.' --input=.pdf<CR>'
	elseif has('unix')
		execute 'nnoremap <buffer> <LocalLeader>l3 :<C-u>Leaderf file '.$HOME.'/.texlive --input=.pdf<CR>'
	elseif has('win32')
		nnoremap <buffer> <LocalLeader>l3 :<C-u>Leaderf file C:/Program files/texlive/texmf-local --input=.pdf<CR>
	endif
endfunction "}}}
