function! init#set#main() "{{{
	if (expand('%:p:h') =~# substitute($VIMRUNTIME, '\', '\\\\', 'g') || expand('%:p:h') =~# substitute(fnamemodify($GITHUBWORKSPACE, ':p:h:h:h'), '\', '\\\\', 'g')) && expand('%:p:h') !~# split(system('git config --global user.name'))[0]
		setlocal nomodifiable
		setlocal readonly
		call init#map#main()
	elseif &filetype ==# 'pandoc'
		nnoremap <Buffer> dsc <Plug>(vimtex-cmd-delete)
		nnoremap <Buffer> dsd <Plug>(vimtex-delim-delete)
		nnoremap <Buffer> dse <Plug>(vimtex-env-delete)
	endif
endfunction "}}}
