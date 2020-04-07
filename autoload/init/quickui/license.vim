function! init#quickui#license#main() "{{{
	if !exists('s:license_list') || !exists('s:license_opt')
		let s:license_list = []
		for s:license_value in LicenseComplete('', '', '')
			let s:license_list += [['→'.s:license_value, 'License '.s:license_value]]
		endfor
		let s:license_opt = {
					\ 'title': 'License',
					\ }
	endif
	call quickui#listbox#open(s:license_list, s:license_opt)
endfunction "}}}

