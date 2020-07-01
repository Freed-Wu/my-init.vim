function! leaderf#sokoban#sort(a, b) abort "{{{
	return str2nr(a:a) - str2nr(a:b)
endfunction "}}}

function! leaderf#sokoban#source(args) abort "{{{
	let l:sources = []
	let l:sokobans = split(glob($GITHUBWORKSPACE . '/jmanoel7/vim-games/plugin/VimSokoban/level*.sok'))
	for l:sokoban in l:sokobans
		let l:sources += [matchstr(l:sokoban, 'level\zs.*\ze\.')]
	endfor
	return sort(l:sources, 'leaderf#sokoban#sort')
endfunction "}}}

function! leaderf#sokoban#accept(line, args) abort "{{{
	execute 'Sokoban ' . a:line
endfunction "}}}
