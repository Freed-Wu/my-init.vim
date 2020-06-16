function! init#map#main() "{{{
	if exists('b:nomap')
		setlocal modifiable
		setlocal noreadonly
		silent! call s:unmap()
	else
		nnoremap <nowait><buffer> <C-r> :<C-u>execute 'vertical resize '.(winwidth(0) == &columns / 2? &columns / 4: &columns / 2)<CR>
		nnoremap <nowait><buffer> u :<C-U>call smoothie#upwards()<CR>
		nnoremap <nowait><buffer> d :<C-U>call smoothie#downwards()<CR>
		nnoremap <nowait><buffer> U :<C-U>call smoothie#backwards()<CR>
		nnoremap <nowait><buffer> D :<C-U>call smoothie#forwards()<CR>
		nnoremap <nowait><buffer> gp :print<CR>
		xnoremap <nowait><buffer> gp :print<CR>
		nnoremap <nowait><buffer> gP :list<CR>
		xnoremap <nowait><buffer> gP :list<CR>
	endif
endfunction "}}}

function! s:unmap() "{{{
	nunmap <buffer> <C-r>
	nunmap <buffer> u
	nunmap <buffer> d
	nunmap <buffer> U
	nunmap <buffer> D
	nunmap <buffer> gp
	xunmap <buffer> gp
	nunmap <buffer> gP
	xunmap <buffer> gP
endfunction "}}}

