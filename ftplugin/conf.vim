if expand('%:t') == 'Doxyfile'
	setlocal makeprg=doxygen\ %:p
	nnoremap <buffer><silent> <LocalLeader>g :find doc<CR>
	nnoremap <buffer><silent> <LocalLeader>c :call init#clean#main(b:clean_file, b:clean_dir)<CR>
	nnoremap <buffer><silent> <LocalLeader>C :call init#clean#main(b:clean_file_all, b:clean_dir_all)<CR>
	nnoremap <buffer><silent> <LocalLeader>h :terminal<CR>doxygen -g -<CR><C-w>N/
	let b:clean_file = ['.doxygen.log', '.doxygen.errors']
	let b:clean_dir = []
	let b:clean_file_all = b:clean_file
	let b:clean_dir_all = b:clean_dir + ['doc']
endif

if expand('%:t') == '.gitignore'
	nnoremap <buffer> <LocalLeader>g :Defx `$HOME.'/.gitconfig'`
	inoremap <nowait><buffer> ! !<C-g>u
	inoremap <nowait><buffer> * *
endif

