if expand('%:t') ==# 'Doxyfile'
	setlocal makeprg=doxygen\ %
	nnoremap <LocalLeader>ll :<C-u>%!doxygen -g -<CR>
endif

