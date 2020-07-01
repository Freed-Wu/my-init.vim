setlocal indentexpr=GetGitconfigIndent()

call dosini#map#main()

if expand('%:t') ==# '.editorconfig'
	nnoremap <LocalLeader>ll :<C-u>EditorConfigReload<CR>
endif
