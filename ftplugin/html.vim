EmmetInstall

nnoremap <buffer> gS :silent !chrome %<CR>

if expand('%:p:h:t') == '_layouts'
	set filetype=liquid
endif

