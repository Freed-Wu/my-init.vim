function! vim#map#main() "{{{
	nnoremap <buffer><silent> <LocalLeader>t :<C-u>set <C-r><C-w><CR>
	xnoremap <buffer><silent> <LocalLeader>t y:set <C-r>0<CR>
	nnoremap <buffer><silent> <LocalLeader>i :<C-u>highlight <C-r><C-w><CR>
	xnoremap <buffer><silent> <LocalLeader>i y:highlight <C-r>0<CR>
	nnoremap <buffer><silent> <LocalLeader>s :<C-u>echo has(expand("<cWORD>"))<CR>
	xnoremap <buffer><silent> <LocalLeader>s y:echo has('<C-r>0')<CR>
	nnoremap <buffer><silent> <LocalLeader>p :<C-u>echo hasmapto(expand("<cWORD>"))<CR>
	xnoremap <buffer><silent> <LocalLeader>p y:echo hasmapto('<C-r>0')<CR>
	nnoremap <buffer><silent> <LocalLeader>P :<C-u>echo mapcheck(expand("<cWORD>"))<CR>
	xnoremap <buffer><silent> <LocalLeader>P y:echo mapcheck('<C-r>0')<CR>
	nnoremap <buffer> q= :<C-u>execute 'echo ' . expand('<cWORD>')<CR>
	xnoremap <buffer> q= y:<C-u>echo <C-r>0<CR>
endfunction "}}}

