scriptencoding utf-8

function! init#quickui#keymap#main() "{{{
	if !exists('s:keymap_list') || !exists('s:keymap_opt')
		let s:keymap_list = []
		for s:keymap_path in split(glob($VIMRUNTIME.'/keymap/*.vim'))
			let s:keymap_value = split(s:keymap_path, '/')[-1]
			let s:keymap_value = split(s:keymap_value, '\.')[0]
			let s:keymap_list += [['→'.s:keymap_value, 'set keymap='.s:keymap_value]]
		endfor
		let s:keymap_opt = {
					\ 'title': 'set keymap=',
					\ }
	endif
	call quickui#listbox#open(s:keymap_list, s:keymap_opt)
endfunction "}}}

