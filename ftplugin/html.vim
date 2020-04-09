if expand('%:p:h') ==# expand('$GRAPHVIZHELP') || expand('%:p:h') ==# '/usr/share/doc/graphviz-2.42.3/html/info' || expand('%:p:h') ==# 'C:/Program files/graphviz-2.42.3/html/info'
	nnoremap <buffer> gs :<C-u>call pandoc#hypertext#OpenSystem('https://graphviz.gitlab.io/_pages/doc/info/'.expand('%:t'))<CR>
endif

EmmetInstall

if expand('%:p:h:t') ==# '_layouts'
	set filetype=liquid
endif

inoremap <nowait><buffer> <
inoremap <nowait><buffer> >

