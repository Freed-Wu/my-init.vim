scriptencoding utf-8

function! init#quickui#thematic#main() "{{{
	if !exists('s:thematic_list') || !exists('s:thematic_opt')
		let s:thematic_list = []
		for s:thematic_value in keys(g:thematic#themes)
			let s:thematic_list += [['→'.s:thematic_value, 'Thematic '.s:thematic_value]]
		endfor
		let s:thematic_opt = {
					\ 'title': 'Thematic',
					\ }
	endif
	call quickui#listbox#open(s:thematic_list, s:thematic_opt)
endfunction "}}}

