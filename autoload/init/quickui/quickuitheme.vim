scriptencoding utf-8

function! init#quickui#quickuitheme#main() "{{{
	let s:quickui_color_schemes = []
	for s:quickui_color_scheme_path in split(glob($GITHUBWORKSPACE.'/skywind3000/vim-quickui/colors/quickui/*.vim'))
		let s:quickui_color_scheme = split(split(s:quickui_color_scheme_path, expand('/'))[-1], '\.')[0]
		let s:quickui_color_schemes += [s:quickui_color_scheme]
	endfor
	if !exists('s:quickuitheme_list') || !exists('s:quickuitheme_opt')
		let s:quickuitheme_list = []
		for s:quickuitheme_value in s:quickui_color_schemes
			let s:quickuitheme_list += [['→'.s:quickuitheme_value, 'call QuickThemeChange("'.s:quickuitheme_value.'")']]
		endfor
		let s:quickuitheme_opt = {
					\ 'title': 'call QuickThemeChange(*)',
					\ }
	endif
	call quickui#listbox#open(s:quickuitheme_list, s:quickuitheme_opt)
endfunction "}}}

