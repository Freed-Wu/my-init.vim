let s:file = $GITHUBWORKSPACE . '/Freed-Wu/asciiart/txt/mythology/103'
function! init#startify#main() "{{{
	let l:header = []
	if filereadable(s:file)
		let l:header = split(fortune_vimtips#tooltipviewtips(), '\n') + readfile(s:file)
	elseif has('unix') && filereadable($PREFIX . '/etc/issue')
		let l:lines = []
		for l:line in readfile($PREFIX . '/etc/issue')
			let l:lines += [substitute(l:line, "\x1b\S*", '', 'g')]
		endfor
		let l:header = l:lines
	elseif executable('fortune') && executable('cowthink')
		let l:header = split(system('fortune | cowthink -f dragon-and-cow'), '\n')
	else
		let l:header = cowsay#cowsay(fortune#fortune(), 'dragon-and-cow')
	endif
	let g:startify_custom_header = []
	for l:line in l:header
		let g:startify_custom_header += ['|' . l:line]
	endfor
endfunction "}}}

