function! init#clean#main(list) "{{{
	Rooter
	let l:list = []
	for l:index in a:list
		let l:list += split(glob(l:index), "\n")
	endfor
	for l:index in l:list
		call delete(l:index, 'rf')
	endfor
endfunction "}}}

