function! init#help#main(word) "{{{
	let s:temp = '/tmp/' . &filetype
	call delete(s:temp)
	if &filetype ==# 'octave'
		call writefile(split(system('octave --eval "help '.a:word.'"')), s:temp)
	elseif &filetype ==# 'gnuplot'
		call writefile(split(system('gnuplot -e "help '.a:word.'"')), s:temp)
	elseif &filetype ==# 'python'
		call writefile(split(system('python -c "help('''.a:word.''')"')), s:temp)
	elseif &filetype =~# 'c\|sh\|bash\|zsh\|fish\|csh\|ksh\|wsh\|tcsh\|mush\|gnash'
		call writefile(split(system('man --pager=cat '.a:word)), s:temp)
	elseif &filetype =~# 'dosbatch\|ps1'
		call writefile(split(system('help '.a:word)), s:temp)
	elseif &filetype ==# 'mysql'
		call writefile(split(system('mysql -e "help '.a:word.'"')), s:temp)
	elseif &filetype ==# 'sql'
		call writefile(split(system('mysql -e "help '.a:word.'"')), s:temp)
	elseif &filetype ==# 'julia'
		call writefile(split(system('julia -E "? '.a:word.'"')), s:temp)
	else
		call writefile(split('No found!'), s:temp)
	endif
	call quickui#preview#open(s:temp, {'title': a:word})
endfunction "}}}

