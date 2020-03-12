function! init#format#main(...) "{{{
	if get(g:, 'neoformat_enabled_'. &filetype, []) != [] || filereadable(g:repos_path . '/sbdchd/neoformat/autoload/neoformat/formatters/' . &filetype . '.vim')
		if a:0
			if a:1 == '.'
				execute '.,.-1+'.v:count1.'Neoformat'
			else
				execute a:1.'Neoformat'
			endif
		elseif v:count
			execute '.,.-1+'.v:count.'Neoformat'
		else
			'[, '] Neoformat
		endif
	else
		if a:0
			if a:1 == '.'
				execute 'normal! '.v:count1.'=='
				execute '.,.-1+'.v:count1.'TrailGuide fix'
			else
				normal! '<='>
				'<, '> TrailGuide fix
			endif
		elseif v:count
			execute 'normal! '.v:count.'=='
			execute '.,.-1+'.v:count.'TrailGuide fix'
		else
			normal! '[=']
			'[, '] TrailGuide fix
		endif
	endif
endfunction "}}}

