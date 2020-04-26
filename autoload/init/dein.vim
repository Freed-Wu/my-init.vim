function! init#dein#main() "{{{
	setlocal path+=$GITHUBWORKSPACE
	if expand('%:p') ==# $MYVIMRC
		nnoremap <buffer><silent> gd :<C-u>execute 'sfind $GITHUBWORKSPACE/' . split(split(expand('<cWORD>'), 'dein#add(')[-1], '''')[0] . '/doc/*.txt'<CR>
		nnoremap <buffer><silent> gD :<C-u>execute 'sfind $GITHUBWORKSPACE/' . split(split(expand('<cWORD>'), 'dein#add(')[-1], '''')[0] . '/README*'<CR>
		nnoremap <buffer><silent> <C-w>d :<C-u>execute 'sfind $GITHUBWORKSPACE/' . split(split(expand('<cWORD>'), 'dein#add(')[-1], '''')[0] . '/doc/*.txt'<CR>
		nnoremap <buffer><silent> <C-w>D :<C-u>execute 'sfind $GITHUBWORKSPACE/' . split(split(expand('<cWORD>'), 'dein#add(')[-1], '''')[0] . '/README*'<CR>
		nnoremap <buffer><silent> <C-w>I :<C-u>execute 'Defx ' . $GITHUBWORKSPACE . '/' . split(split(expand('<cWORD>'), 'dein#add(')[-1], '''')[0]<CR>
	endif
	if &filetype ==# 'SpaceVimPlugManager'
		nnoremap <buffer><silent> gd :<C-u>execute 'sfind $GITHUBWORKSPACE/*/' . split(split(expand('<cWORD>'), 'dein#add(')[-1], '''')[0] . '/doc/*.txt'<CR>
		nnoremap <buffer><silent> gD :<C-u>execute 'sfind $GITHUBWORKSPACE/*/' . split(split(expand('<cWORD>'), 'dein#add(')[-1], '''')[0] . '/README*'<CR>
		nnoremap <buffer><silent> <C-w>d :<C-u>execute 'sfind $GITHUBWORKSPACE/*/' . split(split(expand('<cWORD>'), 'dein#add(')[-1], '''')[0] . '/doc/*.txt'<CR>
		nnoremap <buffer><silent> <C-w>D :<C-u>execute 'sfind $GITHUBWORKSPACE/*/' . split(split(expand('<cWORD>'), 'dein#add(')[-1], '''')[0] . '/README*'<CR>
		nnoremap <buffer><silent> <C-w>I :<C-u>execute 'Defx ' . glob($GITHUBWORKSPACE . '/*/' . split(split(expand('<cWORD>'), 'dein#add(')[-1], '''')[0])<CR>
	endif
endfunction "}}}

