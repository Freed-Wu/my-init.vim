function! tex#view#main() "{{{
	if (stridx(expand('%:p'), '.tex') == strlen(expand('%:p')) - strlen('.tex')
				\ || stridx(expand('%:p'), '.tikz') == strlen(expand('%:p')) - strlen('.tikz'))
				\ && stridx(expand('%:p:h'), 'myTemplates') != strlen(expand('%:p:h')) - strlen('myTemplates')
				\ && stridx(expand('%:p:h'), 'templates') != strlen(expand('%:p:h')) - strlen('templates')
		call b:vimtex.viewer.view('')
	endif
endfunction "}}}

