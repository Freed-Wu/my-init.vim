if !exists('g:Lf_Extensions')
	let g:Lf_Extensions = {}
endif

let g:Lf_Extensions.sokoban = {
			\ 'source': 'leaderf#sokoban#source',
			\ 'accept': 'leaderf#sokoban#accept',
			\ 'highlights_def': {
			\ 'Lf_hl_sokobanTitle': '.*',
			\ },
			\ 'highlights_cmd': [
			\ 'hi link Lf_hl_sokobanTitle Title',
			\ ],
			\ }

