scriptencoding utf-8

function! init#quickui#template#main(here) "{{{
	if !exists('s:template_list') || !exists('s:template_opt')
		let s:template_list = []
		let s:templatehere_list = []
		let s:template_paths = ''
		for s:templates_directory in g:templates_directory
			let s:template_paths .= glob(s:templates_directory.'/.*').glob(s:templates_directory.'/*')
		endfor
		let s:template_paths .= "\n"
		let s:template_paths .= glob($GITHUBWORKSPACE.'/aperezdc/vim-template/templates/=template=.*')
		for s:template_path in split(s:template_paths)
			let s:template_value = split(s:template_path, '/')[-1]
			if s:template_value !=# '.' && s:template_value !=# '..'
				let s:template_list += [['→'.s:template_value, 'Template '.s:template_value]]
				let s:templatehere_list += [['→'.s:template_value, 'TemplateHere '.s:template_value]]
			endif
		endfor
		let s:template_opt = {
					\ 'title': 'Template',
					\ }
		let s:templatehere_opt = {
					\ 'title': 'TemplateHere',
					\ }
	endif
	if a:here
		call quickui#listbox#open(s:templatehere_list, s:templatehere_opt)
	else
		call quickui#listbox#open(s:template_list, s:template_opt)
	endif
endfunction "}}}

