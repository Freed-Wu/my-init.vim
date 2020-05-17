scriptencoding utf-8

function! init#quickui#splash#main() "{{{
	if !exists('s:splash_list') || !exists('s:splash_opt')
		let s:splash_list = []
		for s:splash_file in split(glob($GITHUBWORKSPACE.'/Freed-Wu/asciiart/txt/*/*')) + split(glob($GITHUBWORKSPACE.'/thinca/vim-splash/sample/*.txt'))
			let s:splash_value = join(split(s:splash_file, '/', 'g')[-2:-1], '/')
			let s:splash_list += [['→'.s:splash_value, 'Splash '.s:splash_value]]
		endfor
		let s:splash_opt = {
					\ 'title': 'Splash',
					\ }
	endif
	call quickui#listbox#open(s:splash_list, s:splash_opt)
endfunction "}}}

