setlocal nowrap
setlocal colorcolumn=
if empty(matchstr(getline(1), 'Gentoo System Manager''s Manual'))
	setlocal shiftwidth=7
	setlocal tabstop=7
else
	setlocal shiftwidth=5
	setlocal tabstop=5
endif
setlocal expandtab
AnyFoldActivate

nnoremap <buffer> [[ ?^\u\+<CR>:let @/ = ''<CR>
nnoremap <buffer> ]] /^\u\+<CR>:let @/ = ''<CR>
nnoremap <buffer> [] ?^\u\+<CR>}:let @/ = ''<CR>
nnoremap <buffer> [] /^\u\+<CR>{:let @/ = ''<CR>
