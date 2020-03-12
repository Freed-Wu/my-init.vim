function! init#startify#main() "{{{
	let g:startify_lists = [
				\ { 'type': 'sessions', 'header': ['    Sessions']},
				\ { 'type': 'files', 'header': ['    Most Recently Used']},
				\ { 'type': 'dir', 'header': ['    Most Recently Used @ ' . getcwd()] },
				\ { 'type': 'commands', 'header': ['    Commands']},
				\ { 'type': 'bookmarks', 'header': ['    Bookmarks']},
				\ ]
	for s:item in g:startify_lists
		let s:item['header'][0] = s:item['header'][0] . ' (press ''<F1>'' to get help)'
	endfor
endfunction "}}}

