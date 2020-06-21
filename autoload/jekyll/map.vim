function! jekyll#map#main() "{{{
	nnoremap <buffer> <LocalLeader>ll :<C-u>Jbuild<CR>
	nnoremap <buffer> <LocalLeader>lL :<C-u>Jserve<CR>
endfunction "}}}
