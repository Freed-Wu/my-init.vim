if (expand('%:p:h') =~ substitute($VIMRUNTIME, '\', '\\\\', 'g') || expand('%:p:h') =~ substitute($GITWORKSPACE, '\', '\\\\', 'g')) && expand('%:p:h') !~ $USER
	setlocal nomodifiable
	setlocal readonly
	call init#map#main()
endif

setlocal indentexpr =pymode#indent#get_indent(v:lnum)

nnoremap <buffer> <C-w>d $:execute 'split '.expand('%:p:h').'/'.expand('<cword>').'.snippets'<CR>
nnoremap <buffer> gd $:execute 'split '.expand('%:p:h').'/'.expand('<cword>').'.snippets'<CR>

