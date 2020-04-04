function! s:compare(i1, i2) "{{{
	return a:i1 - a:i2
endfunction "}}}
function! init#quickui#sokoban#main() "{{{
	if !exists('s:sokoban_list') || !exists('s:sokoban_opt') || !exists('s:sokobanh_list') || !exists('s:sokobanh_opt')
		let s:sokobans_path = split(glob('$GITHUBWORKSPACE/jmanoel7/vim-games/plugin/VimSokoban/level*.sok'))
		let s:sokoban_list = []
		let s:sokobanh_list = []
		let s:sokoban_values = []
		for s:sokoban_path in s:sokobans_path
			let s:sokoban_value = split(split(split(s:sokoban_path, expand('/'))[-1], '.sok')[0], 'level')[-1]
			let s:sokoban_values += [s:sokoban_value]
		endfor
		for s:sokoban_value in sort(s:sokoban_values, 's:compare')
			let s:sokoban_list += [['→level'.s:sokoban_value, 'Sokoban '.s:sokoban_value]]
			let s:sokobanh_list += [['→level'.s:sokoban_value, 'SokobanH '.s:sokoban_value]]
		endfor
		let s:sokoban_opt = {
					\ 'title': 'Sokoban',
					\ }
		let s:sokobanh_opt = {
					\ 'title': 'SokobanH',
					\ }
	endif
	if &filetype ==# 'startify'
		call quickui#listbox#open(s:sokoban_list, s:sokoban_opt)
	else
		call quickui#listbox#open(s:sokobanh_list, s:sokobanh_opt)
	endif
endfunction "}}}

