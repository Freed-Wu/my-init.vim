function! init#quickui#duzzle#main() "{{{
	if !exists('s:duzzle_list') || !exists('s:duzzle_opt')
		let s:duzzles = []
		for s:duzzle_puzzle in duzzle#puzzle_list('_')
			let s:duzzles += [s:duzzle_puzzle['name']]
		endfor
		let s:duzzle_list = []
		for s:duzzle_value in s:duzzles
			let s:duzzle_list += [['→'.s:duzzle_value, 'DuzzleStart '.(index(s:duzzles, s:duzzle_value) + 1)]]
		endfor
		let s:duzzle_opt = {
					\ 'title': 'DuzzleStart',
					\ }
	endif
	call quickui#listbox#open(s:duzzle_list, s:duzzle_opt)
endfunction "}}}

