if expand('%:t') ==# '_config.yml'
	setlocal makeprg=jekyll\ server
endif

