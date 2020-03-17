if (expand('%:p:h') =~# substitute($VIMRUNTIME, '\', '\\\\', 'g') || expand('%:p:h') =~# substitute($GITWORKSPACE, '\', '\\\\', 'g')) && expand('%:p:h') !~# $GITNAME
	setlocal nomodifiable
	setlocal readonly
	call init#map#main()
endif

setlocal indentexpr=pymode#indent#get_indent(v:lnum)

nnoremap <buffer> <C-w>d $:sfind %:p:h/<cword>.snippets<CR>
nnoremap <buffer> gd $:find %:p:h/<cword>.snippets<CR>

