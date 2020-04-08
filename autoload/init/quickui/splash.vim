scriptencoding utf-8

function! init#quickui#splash#main() "{{{
	if !exists('s:splash_list') || !exists('s:splash_opt')
		let s:splash_list = []
		for s:splash_value in split(glob($VIMCONFIG.'/vim-splash/*.txt'))
			let s:splash_list += [['→'.s:splash_value, 'Splash '.s:splash_value]]
		endfor
		let s:splash_opt = {
					\ 'title': 'Splash',
					\ }
	endif
	call quickui#listbox#open(s:splash_list, s:splash_opt)
endfunction "}}}

