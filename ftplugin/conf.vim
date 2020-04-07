if expand('%:t') ==# 'Doxyfile'
	setlocal makeprg=doxygen\ %:p
	nnoremap <buffer><silent> <LocalLeader>g :find doc<CR>
	nnoremap <buffer><silent> <LocalLeader>c :call init#clean#main(b:clean_file, b:clean_dir)<CR>
	nnoremap <buffer><silent> <LocalLeader>C :call init#clean#main(b:clean_file_all, b:clean_dir_all)<CR>
	nnoremap <buffer><silent> <LocalLeader>h :terminal<CR>doxygen -g -<CR><C-w>N/
	let b:clean = ['.doxygen.log', '.doxygen.errors']
endif

