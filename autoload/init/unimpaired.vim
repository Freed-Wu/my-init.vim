function! init#unimpaired#main() "{{{
	nnoremap <silent><nowait>yo :<C-u>WhichKey 'yo'<CR>
	nnoremap <nowait> [ :<C-u>WhichKey '['<CR>
	xnoremap <nowait> [ :<C-u>WhichKeyVisual '['<CR>
	nnoremap <nowait> ] :<C-u>WhichKey ']'<CR>
	xnoremap <nowait> ] :<C-u>WhichKeyVisual ']'<CR>
	nnoremap yoP :setlocal paste! paste?<CR>
	nnoremap [oP :setlocal paste<CR>
	nnoremap ]oP :setlocal nopaste<CR>
	nnoremap yoW :setlocal previewwindow! previewwindow?<CR>
	nnoremap [oW :setlocal previewwindow<CR>
	nnoremap ]oW :setlocal nopreviewwindow<CR>
	nnoremap yoS :setlocal splitbelow! splitbelow?<CR>
	nnoremap [oS :setlocal splitbelow<CR>
	nnoremap ]oS :setlocal nosplitbelow<CR>
	nnoremap yoV :setlocal splitright! splitright?<CR>
	nnoremap [oV :setlocal splitright<CR>
	nnoremap ]oV :setlocal nosplitright<CR>
	nnoremap yoR :setlocal readonly! readonly?<CR>
	nnoremap [oR :setlocal readonly<CR>
	nnoremap ]oR :setlocal noreadonly<CR>
	nnoremap yoM :setlocal modifiable! modifiable?<CR>
	nnoremap [oM :setlocal modifiable<CR>
	nnoremap ]oM :setlocal nomodifiable<CR>
	nnoremap yoz :setlocal foldenable! foldenable?<CR>
	nnoremap [oz :setlocal foldenable<CR>
	nnoremap ]oz :setlocal nofoldenable<CR>
	nnoremap yo<Tab> :setlocal expandtab! expandtab?<CR>
	nnoremap [o<Tab> :setlocal expandtab<CR>
	nnoremap ]o<Tab> :setlocal noexpandtab<CR>
	nnoremap yoL :setlocal linebreak! linebreak?<CR>
	nnoremap [oL :setlocal linebreak<CR>
	nnoremap ]oL :setlocal nolinebreak<CR>
	nnoremap yot :<C-u>let &l:textwidth = &textwidth ? 0 : (g:textwidth)<CR>\| :setlocal textwidth<CR>
	nnoremap [ot :<C-u>let &l:textwidth = g:textwidth<CR>
	nnoremap ]ot :<C-u>setlocal textwidth=0<CR>
	nnoremap yo` :<C-u>set fileformat=unix<CR>
	nnoremap yo1 :<C-u>set fileformat=dos<CR>
	nnoremap yo2 :<C-u>set fileformat=mac<CR>
	nnoremap yo7 :<C-u>set fileencoding=latin1<CR>
	nnoremap yo8 :<C-u>set fileencoding=utf-8<CR>
	nnoremap yo9 :<C-u>set fileencoding=cp936<CR>
	nnoremap yom :execute exists('b:nomap')?'unlet b:nomap':'let b:nomap = 1'\| call init#map#main()<CR>
	nnoremap [om :let b:nomap = 1\| call init#map#main()<CR>
	nnoremap ]om :let b:nomap = 1\| unlet b:nomap\| call init#map#main()<CR>
	if has('gui_running')
		" drmikehenry/vim-fontsize {{{3 "
		nmap [of  <Plug>FontsizeBegin<Plug>FontsizeDec
		nmap ]of  <Plug>FontsizeBegin<Plug>FontsizeInc
		nmap yof  <Plug>FontsizeDefault
		" 3}}} drmikehenry/vim-fontsize "
		nnoremap yok :execute 'set guioptions'.(&guioptions !~# 'm'?'+':'-').'=m'<CR>
		nnoremap [ok :set guioptions+=m<CR>
		nnoremap ]ok :set guioptions-=m<CR>
		nnoremap yoK :execute 'set guioptions'.(&guioptions !~# 'T'?'+':'-').'=T'<CR>
		nnoremap [oK :set guioptions+=T<CR>
		nnoremap ]oK :set guioptions-=T<CR>
		nnoremap yoj :execute 'set guioptions'.(&guioptions !~# 'b'?'+':'-').'=b'<CR>
		nnoremap [oj :set guioptions+=b<CR>
		nnoremap ]oj :set guioptions-=b<CR>
		nnoremap yo[ :execute 'set guioptions'.(&guioptions !~# 'l'?'+':'-').'=l'<CR>
		nnoremap [o[ :set guioptions+=l<CR>
		nnoremap ]o[ :set guioptions-=l<CR>
		nnoremap yo] :execute 'set guioptions'.(&guioptions !~# 'r'?'+':'-').'=r'<CR>
		nnoremap [o] :set guioptions+=r<CR>
		nnoremap ]o] :set guioptions-=r<CR>
		nnoremap yo{ :execute 'set guioptions'.(&guioptions !~# 'L'?'+':'-').'=L'<CR>
		nnoremap [o{ :set guioptions+=L<CR>
		nnoremap ]o{ :set guioptions-=L<CR>
		nnoremap yo} :execute 'set guioptions'.(&guioptions !~# 'R'?'+':'-').'=R'<CR>
		nnoremap [o} :set guioptions+=R<CR>
		nnoremap ]o} :set guioptions-=R<CR>
	endif
endfunction "}}}

