function! vim#source#main(...) "{{{
	execute substitute(join(getline(line("'["),line("']")), "\n"), ' "[{}]\{3}', '', 'g')
endfunction "}}}

