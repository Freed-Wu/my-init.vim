function! cn#map#main() "{{{
	nnoremap <buffer> <LocalLeader>lL :<C-u>ViMiM<CR>
	nnoremap <buffer> <LocalLeader>/ :<C-u>call g:Vimim_search()<CR>
	nnoremap <buffer> <LocalLeader>lv :<C-u>Pangu<CR>
	nnoremap <buffer> <LocalLeader>lV :<C-u>CheckChinese<CR>
	nmap <buffer> w <Plug>(coc-ci-w)
	nmap <buffer> b <Plug>(coc-ci-b)
	nnoremap <buffer> W w
	nnoremap <buffer> B b
endfunction "}}}

