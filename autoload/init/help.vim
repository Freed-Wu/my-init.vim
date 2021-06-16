function! init#help#main(word) "{{{
	let l:word = shellescape(a:word)
	let s:temp = '/tmp/' . &filetype . '.log'
	call delete(s:temp)
	if &filetype ==# 'octave'
		let l:cmd = ['octave --eval', shellescape('help ' . l:word)]
	elseif &filetype ==# 'gnuplot'
		let l:cmd = ['gnuplot -e', shellescape('help ' . l:word)]
	elseif &filetype ==# 'python'
		let l:cmd = ['python -c', shellescape('help(' . l:word . ')')]
	elseif &filetype ==# 'c'
		let l:cmd = ['man 3 --pager=cat', l:word]
	elseif &filetype =~# 'sh\|bash\|fish\|zsh\|ksh\|csh\|tcsh'
		let l:cmd = ['man 1 --pager=cat', l:word]
	elseif &filetype =~# 'dosbatch\|ps1'
		let l:cmd = ['help', ]
	elseif &filetype ==# 'cpp'
		let l:cmd = ['cppman', l:word]
	elseif &filetype ==# 'masm'
		let l:cmd = ['cgasm', l:word]
	elseif &filetype ==# 'mysql'
		let l:cmd = ['mysql -e', shellescape('help ' . l:word)]
	elseif &filetype ==# 'sql'
		let l:cmd = ['sqlite3 -e', shellescape('help ' . l:word)]
	elseif &filetype ==# 'julia'
		let l:cmd = ['julia -E', shellescape('? ' . l:word)]
	endif
	call writefile(trim(system(l:cmd)), s:temp)
	call quickui#preview#open(s:temp, {'title': l:word})
endfunction "}}}

