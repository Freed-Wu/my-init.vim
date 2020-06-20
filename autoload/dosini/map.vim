function! dosini#map#main() "{{{
	nnoremap <buffer> [[ ?^[<CR>:let @/=''<CR>
	nnoremap <buffer> ]] /^[<CR>:let @/=''<CR>
	nnoremap <buffer> [] ?^[<CR>}:let @/=''<CR>
	nnoremap <buffer> ][ /^[<CR>{:let @/=''<CR>
endfunction "}}}
