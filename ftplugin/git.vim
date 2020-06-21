if expand('%:t') !=# 'COMMIT_EDITMSG'
	call init#map#main()
endif
call diff#map#main()

