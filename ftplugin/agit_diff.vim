call init#map#main()
call diff#map#main()

nnoremap <buffer> x <Plug>(agit-diff)
nnoremap <buffer> X <Plug>(agit-diff-with-local)
nnoremap <nowait><buffer> ZZ <Plug>(agit-exit)
