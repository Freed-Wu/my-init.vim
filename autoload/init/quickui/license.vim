scriptencoding utf-8

function! init#quickui#license#main(license) "{{{
	if a:license == 1
		let l:command = 'License '
	else
		let l:command = 'Stub'
	endif
	if !exists('s:license_list') || !exists('s:license_opt')
		let s:license_list = []
		for s:license_value in LicenseComplete('', '', '')
			let s:license_list += [['→'.s:license_value, l:command . ' ' . s:license_value]]
		endfor
		let s:license_opt = {
					\ 'title': l:command,
					\ }
	endif
	call quickui#listbox#open(s:license_list, s:license_opt)
endfunction "}}}

