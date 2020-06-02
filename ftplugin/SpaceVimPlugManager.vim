let b:browser_search_default_engine = 'github'

call init#dein#main()
call init#map#main()

setlocal nofoldenable

nnoremap <buffer> [[ ?^x<CR>
nnoremap <buffer> ]] /^x<CR>
