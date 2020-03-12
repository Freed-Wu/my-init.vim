function! init#redir#main() "{{{
	if !exists('s:char')
		let s:char = nr2char(getchar())
		call redir#push(s:char)
		return
	endif
	if s:char =~ '\w'
		execute 'let @'.s:char . '= redir#pop()'
	else
		echo redir#pop()
	endif
	unlet s:char
endfunction "}}}

