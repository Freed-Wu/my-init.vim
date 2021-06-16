call vimtex#init()

setlocal foldexpr=MatlabFoldExpr()
setlocal foldtext=MatlabFoldText()
setlocal makeprg=octave\ %
setlocal keywordprg=:Help
setlocal iskeyword-=:
execute 'setlocal path+=' . trim(system('octave-config -p DATAROOTDIR')) . '/octave/' . trim(system('octave-config -p VERSION')) . '/m/**2'
execute 'setlocal path+=' . trim(system('octave-config --m-site-dir')) . '/**2'
if filereadable('.octave_packages')
	let s:list = readfile('.octave_packages')
	let s:i = 0
	let s:ans = match(s:list, '# name: dir', 0, s:i)
	while s:ans != -1
		execute 'setlocal path+=' . s:list[s:ans + 4] . '/**1'
		let s:i += 1
		let s:ans = match(s:list, '# name: dir', 0, s:i)
	endwhile
endif

