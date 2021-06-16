let g:textwidth = &textwidth

function! init#unimpaired#main() "{{{
	nnoremap <silent><nowait>yo :<C-u>WhichKey 'yo'<CR>
	nnoremap <nowait> [ :<C-u>WhichKey '['<CR>
	xnoremap <nowait> [ :<C-u>WhichKeyVisual '['<CR>
	nnoremap <nowait> ] :<C-u>WhichKey ']'<CR>
	xnoremap <nowait> ] :<C-u>WhichKeyVisual ']'<CR>
	nnoremap yot :<C-u>let &l:textwidth = &textwidth ? 0 : g:textwidth<CR>\| :setlocal textwidth<CR>
	nnoremap [ot :<C-u>let &l:textwidth = g:textwidth<CR>
	nnoremap ]ot :<C-u>setlocal textwidth=0<CR>
	nnoremap yom :<C-u>setlocal modifiable! modifiable?<CR>
	nnoremap [om :<C-u>setlocal modifiable<CR>
	nnoremap ]oM :<C-u>setlocal nomodifiable<CR>
	if has('gui_running')
		nmap [of <Plug>FontsizeBegin<Plug>FontsizeDec
		nmap ]of <Plug>FontsizeBegin<Plug>FontsizeInc
		nmap yof <Plug>FontsizeDefault
		nnoremap yog :<C-u>set guifont=*<CR>
		nnoremap yok :<C-u>execute 'set guioptions' (&guioptions !~# 'm' ? '+' : '-') . '=m'<CR>
		nnoremap [ok :<C-u>set guioptions+=m<CR>
		nnoremap ]ok :<C-u>set guioptions-=m<CR>
		nnoremap yoK :<C-u>execute 'set guioptions' (&guioptions !~# 'T' ? '+' : '-') . '=T'<CR>
		nnoremap [oK :<C-u>set guioptions+=T<CR>
		nnoremap ]oK :<C-u>set guioptions-=T<CR>
		nnoremap yoj :<C-u>execute 'set guioptions' (&guioptions !~# 'b' ? '+' : '-') . '=b'<CR>
		nnoremap [oj :<C-u>set guioptions+=b<CR>
		nnoremap ]oj :<C-u>set guioptions-=b<CR>
		nnoremap yo[ :<C-u>execute 'set guioptions' (&guioptions !~# 'l' ? '+' : '-') . '=l'<CR>
		nnoremap [o[ :<C-u>set guioptions+=l<CR>
		nnoremap ]o[ :<C-u>set guioptions-=l<CR>
		nnoremap yo] :<C-u>execute 'set guioptions' (&guioptions !~# 'r' ? '+' : '-') . '=r'<CR>
		nnoremap [o] :<C-u>set guioptions+=r<CR>
		nnoremap ]o] :<C-u>set guioptions-=r<CR>
		nnoremap yo{ :<C-u>execute 'set guioptions' (&guioptions !~# 'L' ? '+' : '-') . '=L'<CR>
		nnoremap [o{ :<C-u>set guioptions+=L<CR>
		nnoremap ]o{ :<C-u>set guioptions-=L<CR>
		nnoremap yo} :<C-u>execute 'set guioptions' (&guioptions !~# 'R' ? '+' : '-') . '=R'<CR>
		nnoremap [o} :<C-u>set guioptions+=R<CR>
		nnoremap ]o} :<C-u>set guioptions-=R<CR>
	endif
endfunction "}}}

