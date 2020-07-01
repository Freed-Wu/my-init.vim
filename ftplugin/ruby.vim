if expand('%:t') ==# 'Gemfile'
	nnoremap <LocalLeader>ll :<C-u>%!bundle init<CR>
endif

omap <buffer> aF <Plug>(textobj-ruby-block-a)
omap <buffer> iF <Plug>(textobj-ruby-block-i)
xmap <buffer> aF <Plug>(textobj-ruby-block-a)
xmap <buffer> iF <Plug>(textobj-ruby-block-i)
omap <buffer> at <Plug>(textobj-ruby-name)
omap <buffer> it <Plug>(textobj-ruby-name)
xmap <buffer> at <Plug>(textobj-ruby-name)
xmap <buffer> it <Plug>(textobj-ruby-name)
omap <buffer> ae <Plug>(textobj-ruby-class-a)
omap <buffer> ie <Plug>(textobj-ruby-class-i)
xmap <buffer> ae <Plug>(textobj-ruby-class-a)
xmap <buffer> ie <Plug>(textobj-ruby-class-i)
omap <buffer> af <Plug>(textobj-ruby-function-a)
omap <buffer> if <Plug>(textobj-ruby-function-i)
xmap <buffer> af <Plug>(textobj-ruby-function-a)
xmap <buffer> if <Plug>(textobj-ruby-function-i)

