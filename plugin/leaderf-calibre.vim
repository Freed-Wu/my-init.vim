if !executable('sqlite3')
	echohl WarningMsg
	echo 'Please install sqlite3 firstly!'
	echohl None
	finish
endif

if !exists('g:Lf_Extensions')
	let g:Lf_Extensions = {}
endif

let g:Lf_Extensions.calibre = {
			\ 'source': 'leaderf#calibre#source',
			\ 'accept': 'leaderf#calibre#accept',
			\ 'highlights_def': {
			\ 'Lf_hl_calibreId': '^\d\+',
			\ 'Lf_hl_calibreTitle': '^\d\+\t\zs[^\t]\+\ze\t',
			\ },
			\ 'highlights_cmd': [
			\ 'hi link Lf_hl_calibreId Number',
			\ 'hi link Lf_hl_calibreTitle Title',
			\ ],
			\ }

