if !exists('g:Lf_Extensions')
	let g:Lf_Extensions = {}
endif

let g:Lf_Extensions.fencview = {
			\ 'source': 'leaderf#fencview#source',
			\ 'accept': 'leaderf#fencview#accept',
			\ 'highlights_def': {
			\ 'Lf_hl_fencviewTitle': '^[^\t]\+',
			\ 'Lf_hl_fencviewDescription': '^[^\t]\+\t\zs.*',
			\ },
			\ 'highlights_cmd': [
			\ 'hi link Lf_hl_fencviewTitle Title',
			\ 'hi link Lf_hl_fencviewDescription String',
			\ ],
			\ }

