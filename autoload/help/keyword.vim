function! help#keyword#set() abort "{{{
	let b:iskeyword = &iskeyword
	setlocal iskeyword&
endfunction "}}}

function! help#keyword#unset() abort "{{{
	try
		let &iskeyword = b:iskeyword
		unlet b:iskeyword
	catch /^Vim\%((\a\+)\)\=:E121:/
	endtry
endfunction "}}}
