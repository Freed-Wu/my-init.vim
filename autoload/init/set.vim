function! init#set#main() "{{{
	if (expand('%:p:h') =~# substitute($VIMRUNTIME, '\', '\\\\', 'g') || expand('%:p:h') =~# substitute(fnamemodify($GITHUBWORKSPACE, ':p:h:h:h'), '\', '\\\\', 'g')) && expand('%:p:h') !~# $GITNAME
		setlocal nomodifiable
		setlocal readonly
		call init#map#main()
	endif
endfunction "}}}
