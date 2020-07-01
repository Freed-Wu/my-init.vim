function! init#help#main(word) "{{{
	let s:temp = '/tmp/' . &filetype . '.log'
	call delete(s:temp)
	if &filetype ==# 'octave'
		call writefile(split(system('octave --eval "help '.a:word.'"'), "\n"), s:temp)
	elseif &filetype ==# 'gnuplot'
		call writefile(split(system('gnuplot -e "help '.a:word.'"'), "\n"), s:temp)
	elseif &filetype ==# 'python'
		call writefile(split(system('python -c "help('''.a:word.''')"'), "\n"), s:temp)
	elseif &filetype ==# 'c'
		call writefile(split(system('man 3 --pager=cat '.a:word), "\n"), s:temp)
	elseif &filetype =~# 'sh\|bash\|fish\|zsh\|ksh\|csh\|tcsh'
		call writefile(split(system('man 1 --pager=cat '.a:word), "\n"), s:temp)
	elseif &filetype =~# 'dosbatch\|ps1'
		call writefile(split(system('help '.a:word), "\n"), s:temp)
	elseif &filetype ==# 'cpp'
		call writefile(split(system('cppman "'.a:word.'"'), "\n"), s:temp)
	elseif &filetype ==# 'masm'
		call writefile(split(system('cgasm "'.a:word.'"'), "\n"), s:temp)
	elseif &filetype ==# 'mysql'
		call writefile(split(system('mysql -e "help '.a:word.'"'), "\n"), s:temp)
	elseif &filetype ==# 'sql'
		call writefile(split(system('mysql -e "help '.a:word.'"'), "\n"), s:temp)
	elseif &filetype ==# 'julia'
		call writefile(split(system('julia -E "? '.a:word.'"'), "\n"), s:temp)
	else
		call writefile(split('No found!'), s:temp, "\n")
	endif
	call quickui#preview#open(s:temp, {'title': a:word})
endfunction "}}}

