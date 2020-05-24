scriptencoding utf-8

if (expand('%:p:h') =~# substitute($VIMRUNTIME, '\', '\\\\', 'g') || expand('%:p:h') =~# substitute($GITWORKSPACE, '\', '\\\\', 'g')) && expand('%:p:h') !~# $USER
	setlocal nomodifiable
	setlocal readonly
	call init#map#main()
endif

if expand('%:t') ==# 'requirements.txt'
	setlocal makeprg=pip\ install\ -r\ %
endif

if expand('%:p:h')[1:3] ==# 'tmp'
	set filetype=log
endif

setlocal colorcolumn=+1
setlocal formatexpr=bucky#md#format()

nnoremap <buffer> J :<C-u>execute('silent! .+1,.+'.v:count1.'substitute/\v^　*//g\|.-'.v:count1.',.join\| normal! ``')<CR>:let @/= ''<CR>
xnoremap <buffer> J :<C-u>execute('silent! ''<+1,''>substitute/\v^　*//g\|''<,''>join\| normal! ``')<CR>:let @/= ''<CR>
nnoremap <buffer> <Localleader>d :!aria2c -i %<CR>

