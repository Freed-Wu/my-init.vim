function! init#substitute#main(range, dicts, cmd) "{{{
	for l:dict in a:dicts
		for [l:old, l:new] in items(l:dict)
			execute(a:range.'substitute/'.l:old.'/'.l:new.'/g'.a:cmd)
		endfor
	endfor
endfunction "}}}

