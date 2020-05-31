function! init#dein#main() "{{{
	if &filetype ==# 'vim'
		setlocal path+=$GITHUBWORKSPACE
	else
		setlocal path+=$GITHUBWORKSPACE/*
	endif
	if expand('%:p') ==# $MYVIMRC
		nnoremap <buffer><silent> gd :<C-u>execute 'sfind $GITHUBWORKSPACE/' . split(split(expand('<cWORD>'), 'dein#add(')[-1], '''')[0] . '/doc/*.txt'<CR>
		nnoremap <buffer><silent> gD :<C-u>execute 'sfind $GITHUBWORKSPACE/' . split(split(expand('<cWORD>'), 'dein#add(')[-1], '''')[0] . '/README*'<CR>
		nnoremap <buffer><silent> <C-w>d :<C-u>execute 'sfind $GITHUBWORKSPACE/' . split(split(expand('<cWORD>'), 'dein#add(')[-1], '''')[0] . '/doc/*.txt'<CR>
		nnoremap <buffer><silent> <C-w>D :<C-u>execute 'sfind $GITHUBWORKSPACE/' . split(split(expand('<cWORD>'), 'dein#add(')[-1], '''')[0] . '/README*'<CR>
	endif
	if &filetype ==# 'SpaceVimPlugManager'
		nnoremap <buffer><silent> gd :<C-u>execute 'sfind $GITHUBWORKSPACE/*/' . split(split(expand('<cWORD>'), 'dein#add(')[-1], '''')[0] . '/doc/*.txt'<CR>
		nnoremap <buffer><silent> gD :<C-u>execute 'sfind $GITHUBWORKSPACE/*/' . split(split(expand('<cWORD>'), 'dein#add(')[-1], '''')[0] . '/README*'<CR>
		nnoremap <buffer><silent> <C-w>d :<C-u>execute 'sfind $GITHUBWORKSPACE/*/' . split(split(expand('<cWORD>'), 'dein#add(')[-1], '''')[0] . '/doc/*.txt'<CR>
		nnoremap <buffer><silent> <C-w>D :<C-u>execute 'sfind $GITHUBWORKSPACE/*/' . split(split(expand('<cWORD>'), 'dein#add(')[-1], '''')[0] . '/README*'<CR>
	endif
endfunction "}}}

