function! init#help#main(word) "{{{
	call delete('/tmp/'.&filetype)
	if &filetype ==# 'octave'
		call vimproc#write('/tmp/'.&filetype, system('octave --eval "help '.a:word.'"'))
	elseif &filetype ==# 'gnuplot'
		call vimproc#write('/tmp/'.&filetype, system('gnuplot -e "help '.a:word.'"'))
	elseif &filetype ==# 'python'
		call vimproc#write('/tmp/'.&filetype, system('python -c "help('''.a:word.''')"'))
	elseif &filetype =~# 'c\|sh\|bash\|zsh\|fish\|csh\|ksh\|wsh\|tcsh\|mush\|gnash'
		call vimproc#write('/tmp/'.&filetype, system('man --pager=cat '.a:word))
	elseif &filetype =~# 'dosbatch\|ps1'
		call vimproc#write('/tmp/'.&filetype, system('help '.a:word))
	elseif &filetype =~# 'sql'
		call vimproc#write('/tmp/'.&filetype, system('mysql -e "help '.a:word.'"'))
	else
		call vimproc#write('/tmp/'.&filetype, 'No found!')
	endif
	call quickui#preview#open('/tmp/'.&filetype, {'title': a:word})
endfunction "}}}

