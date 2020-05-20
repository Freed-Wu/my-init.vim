nnoremap <buffer> gS :sfind $HOME/.dosbox/*.conf<CR>
if exists('$DOSBOXWORKSPACE')
	nnoremap <buffer> gs :Defx `$DOSBOXWORKSPACE`<CR>
else
	nnoremap <buffer> gs :Defx `$HOME`/.dosbox<CR>
endif

