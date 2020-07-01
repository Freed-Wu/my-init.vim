if !exists('g:Lf_Extensions')
	let g:Lf_Extensions = {}
endif

let g:Lf_Extensions.license = {
			\ 'source': 'leaderf#license#source',
			\ 'accept': 'leaderf#license#accept',
			\ 'highlights_def': {
			\ 'Lf_hl_licenseHead': 'head',
			\ 'Lf_hl_licenseTitle': '_\?\zs[a-z0-9]\+',
			\ 'Lf_hl_licenseVersion': '-\zs.*',
			\ },
			\ 'highlights_cmd': [
			\ 'hi link Lf_hl_licenseHead Constant',
			\ 'hi link Lf_hl_licenseTitle Title',
			\ 'hi link Lf_hl_licenseVersion Number',
			\ ],
			\ }

