if &filetype ==# 'html'
	EmmetInstall
endif

if expand('%:p:h:t') ==# '_layouts'
	set filetype=liquid
endif

