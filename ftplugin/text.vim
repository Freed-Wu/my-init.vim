let b:trailguide = 1
if expand('%:e') ==# 'gitmodules'
	let b:fswitchdst = 'gitignore'
endif

setlocal colorcolumn=
setlocal nofoldenable

if expand('%:t')[0:8] ==# 'FencView_'
	call init#map#main()
	finish
endif

if expand('%:t') ==# 'LICENSE'
	command! -buffer -nargs=? Template call init#quickui#license#main(1)
endif

if expand('%') ==# '[duzzle]'
	setlocal nonumber
	setlocal norelativenumber
	finish
endif

if expand('%') ==# 'highlight test'
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

