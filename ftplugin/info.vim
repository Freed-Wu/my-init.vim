call init#map#main()

nnoremap <buffer> K :InfoPrev<CR>
nnoremap <buffer> <C-n> :InfoNext<CR>
nnoremap <buffer> <C-p> :InfoUp<CR>
nnoremap <buffer> <LocalLeader>lv :Menu<CR>
nnoremap <buffer> <LocalLeader>ll :Follow<CR>
nnoremap <buffer> [[ ?^\*\+<CR>:let @/ = ''<CR>
nnoremap <buffer> ]] /^\*\+<CR>:let @/ = ''<CR>
nnoremap <buffer> [] ?^\*\+<CR>}:let @/ = ''<CR>
nnoremap <buffer> [] /^\*\+<CR>{:let @/ = ''<CR>
