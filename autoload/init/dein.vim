function! init#dein#main() "{{{
	if &filetype ==# 'vim'
		setlocal path+=$GITHUBWORKSPACE
	else
		setlocal path+=$GITHUBWORKSPACE/*
	endif
	nnoremap <buffer><silent> gd :<C-u>execute 'edit  ' . split(glob($GITHUBWORKSPACE . '/' . (&filetype ==# 'vim' ? '' : '*/') . expand('<cfile>') . '/doc/*.txt'))[0]<CR>
	nnoremap <buffer><silent> gD :<C-u>execute 'edit  ' . split(glob($GITHUBWORKSPACE . '/' . (&filetype ==# 'vim' ? '' : '*/') . expand('<cfile>') . '/README*'))[0]<CR>
	nnoremap <buffer><silent> <C-w>d :<C-u>execute 'split  ' . split(glob($GITHUBWORKSPACE . '/' . (&filetype ==# 'vim' ? '' : '*/') . expand('<cfile>') . '/doc/*.txt'))[0]<CR>
	nnoremap <buffer><silent> <C-w>D :<C-u>execute 'split  ' . split(glob($GITHUBWORKSPACE . '/' . (&filetype ==# 'vim' ? '' : '*/') . expand('<cfile>') . '/README*'))[0]<CR>
endfunction "}}}

