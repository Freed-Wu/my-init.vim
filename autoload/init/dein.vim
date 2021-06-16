function! init#dein#main() "{{{
	if &filetype ==# 'vim'
		setlocal path=$VIMRUNTIME/pack/dist/opt,$VIMRUNTIME/plugin
		setlocal path+=$GITHUBWORKSPACE
	else
		setlocal path=$GITHUBWORKSPACE/*
	endif
	nnoremap <buffer> gd :<C-u>execute 'edit' glob($GITHUBWORKSPACE . '/' . (&filetype ==# 'vim' ? '' : '*/') . expand('<cfile>') . '/doc/*.txt', 0, 1)[0]<CR>
	nnoremap <buffer> gD :<C-u>execute 'edit' glob($GITHUBWORKSPACE . '/' . (&filetype ==# 'vim' ? '' : '*/') . expand('<cfile>') . '/README*', 0, 1)[0]<CR>
	nnoremap <buffer> <C-w>d :<C-u>execute 'split' glob($GITHUBWORKSPACE . '/' . (&filetype ==# 'vim' ? '' : '*/') . expand('<cfile>') . '/doc/*.txt', 0, 1)[0]<CR>
	nnoremap <buffer> <C-w>D :<C-u>execute 'split' glob($GITHUBWORKSPACE . '/' . (&filetype ==# 'vim' ? '' : '*/') . expand('<cfile>') . '/README*', 0, 1)[0]<CR>
endfunction "}}}
