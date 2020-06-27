call init#map#main()

setlocal nowrap

nnoremap <buffer> [[ ?^\u\+<CR>:let @/ = ''<CR>
nnoremap <buffer> ]] /^\u\+<CR>:let @/ = ''<CR>
nnoremap <buffer> [] ?^\u\+<CR>}:let @/ = ''<CR>
nnoremap <buffer> [] /^\u\+<CR>{:let @/ = ''<CR>
