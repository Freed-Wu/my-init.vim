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
	nnoremap yo0 :<C-u>set fileformat=unix<CR>
	nnoremap yo1 :<C-u>set fileformat=dos<CR>
	nnoremap yo2 :<C-u>set fileformat=mac<CR>
	nnoremap yo7 :<C-u>set fileencoding=latin1<CR>
	nnoremap yo8 :<C-u>set fileencoding=utf-8<CR>
	nnoremap yo9 :<C-u>set fileencoding=cp936<CR>
	nnoremap yom :<C-u>execute exists('b:nomap')?'unlet b:nomap':'let b:nomap = 1'\| call init#map#main()<CR>
	nnoremap [om :<C-u>let b:nomap = 1\| call init#map#main()<CR>
	nnoremap ]om :<C-u>let b:nomap = 1\| unlet b:nomap\| call init#map#main()<CR>
	nnoremap yoa :<C-u>ALEToggle<CR>
	nnoremap yoA :<C-u>AnsiEsc<CR>
	nnoremap yoI :<C-u>IndentLinesToggle<CR>
	nnoremap [oI :<C-u>IndentLinesEnable<CR>
	nnoremap ]oI :<C-u>IndentLinesDisable<CR>
	nnoremap yog :<C-u>IndentGuidesToggle<CR>
	nnoremap [og :<C-u>IndentGuidesEnable<CR>
	nnoremap ]og :<C-u>IndentGuidesDisable<CR>
	nnoremap yo<Space> :<C-u>LeadingSpaceToggle<CR>
	nnoremap [o<Space> :<C-u>LeadingSpaceEnable<CR>
	nnoremap ]o<Space> :<C-u>LeadingSpaceDisable<CR>
	nnoremap yoo :<C-u>LongLine<CR>
	nnoremap yoT :<C-u>TrailGuide toggle<CR>
	nnoremap [oT :<C-u>TrailGuide on<CR>
	nnoremap ]oT :<C-u>TrailGuide off<CR>
	nnoremap yoY :<C-u>Limelight!!<CR>
	nnoremap [oY :<C-u>Limelight<CR>
	nnoremap ]oY :<C-u>Limelight!<CR>
	nnoremap yoy :<C-u>Goyo<CR>
	nnoremap [oy :<C-u>execute 'Goyo ' . get(g:, 'goyo_width', 80) . 'x' . get(g:, 'goyo_height', '85%')<CR>
	nnoremap ]oy :<C-u>Goyo!<CR>
	nnoremap yo` :<C-u>TransparantToggle<CR>
	nnoremap [o` :<C-u>TransparantEnable<CR>
	nnoremap ]o` :<C-u>TransparantDisable<CR>
	nnoremap yoD :<C-u>ToggleDitto<CR>
	nnoremap [oD :<C-u>Ditto<CR>
	nnoremap ]oD :<C-u>NoDitto<CR>
	nnoremap yoO :<C-u>execute (&spell ? 'NoWordy' : 'WordyWordy')<Space>
	nnoremap [oO :<C-u>WordyWordy<CR>
	nnoremap ]oO :<C-u>NoWordy<CR>
	nnoremap [oC :<C-u>CocCommand clock.enable<CR>
	nnoremap ]oC :<C-u>CocCommand clock.disable<CR>
	if has('gui_running')
		nmap [of <Plug>FontsizeBegin<Plug>FontsizeDec
		nmap ]of <Plug>FontsizeBegin<Plug>FontsizeInc
		nmap yof <Plug>FontsizeDefault
		nnoremap yoG :<C-u>set guifont=*<CR>
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

