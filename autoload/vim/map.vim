function! vim#map#main() "{{{
	nnoremap <buffer> <LocalLeader>s :<C-u>set <C-r><C-w>!<CR>
	xnoremap <buffer> <LocalLeader>s y:set <C-r>0!<CR>
	nnoremap <buffer> <LocalLeader>h :<C-u>echo has(expand("<cWORD>"))<CR>
	xnoremap <buffer> <LocalLeader>h y:echo has('<C-r>0')<CR>
	nnoremap <buffer> <LocalLeader>m :<C-u>echo hasmapto(expand("<cWORD>"))<CR>
	xnoremap <buffer> <LocalLeader>m y:echo hasmapto('<C-r>0')<CR>
	nnoremap <buffer> <LocalLeader>f :<C-u>function <C-r><C-w><CR>
	xnoremap <buffer> <LocalLeader>f y:function <C-r>0<CR>
	nnoremap <buffer> q= :<C-u>execute 'echo ' . expand('<cWORD>')<CR>
	xnoremap <buffer> q= y:<C-u>echo <C-r>0<CR>
endfunction "}}}

