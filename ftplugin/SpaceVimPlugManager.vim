let b:browser_search_default_engine = 'github'

call init#dein#main()
call init#map#main()

setlocal nofoldenable
setlocal norelativenumber

nnoremap <buffer> [[ ?^x<CR>
nnoremap <buffer> ]] /^x<CR>
