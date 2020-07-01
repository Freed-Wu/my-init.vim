if expand('%:e') ==# 'gitmodules'
	let b:fswitchdst = 'gitignore'
endif

if expand('%:t') ==# 'aria2.session'
	setlocal makeprg=aria2c\ -i\ %
elseif expand('%:t')[-4:-1] ==# '.txt'
	setlocal makeprg=pandoc\ -o\ %:r.pdf\ --latex-engine=lualatex\ %
endif
setlocal colorcolumn=
setlocal nofoldenable
setlocal formatexpr=bucky#md#format()
setlocal expandtab
setlocal textwidth=0
setlocal noautoindent

if expand('%:t')[0:8] ==# 'FencView_'
	call init#map#main()
	finish
endif

if expand('%') ==# '[duzzle]'
	setlocal nonumber
	setlocal norelativenumber
	finish
endif

if expand('%') ==# 'Highlight test'
	call init#map#main()
	finish
endif

if expand('%') ==# '__.#$VimSokoban$#.__'
	setlocal nonumber
	setlocal norelativenumber
	finish
endif

if expand('%:p') =~# 'gissues'
	call init#map#main()
	finish
endif

if expand('%:p') =~# 'pandoc output'
	call init#map#main()
	setlocal preivewwindow
	finish
endif

if &buftype ==# 'nofile'
	nnoremap <buffer><silent> <CR> <CR>
	nnoremap <buffer><silent> ZZ <C-c>
	nnoremap <buffer><silent> ZQ :<C-u>quit<CR>
endif

