call init#map#main()

setlocal expandtab
setlocal shiftwidth=3
setlocal tabstop=3
setlocal noautoindent

nnoremap <buffer> K :InfoPrev<CR>
nnoremap <buffer> <C-n> :InfoNext<CR>
nnoremap <buffer> <C-p> :InfoUp<CR>
nnoremap <buffer> <LocalLeader>lv :Menu<CR>
nnoremap <buffer> <LocalLeader>ll :Follow<CR>
nnoremap <buffer> [[ ?^\*\+<CR>:let @/ = ''<CR>
nnoremap <buffer> ]] /^\*\+<CR>:let @/ = ''<CR>
nnoremap <buffer> [] ?^\*\+<CR>}:let @/ = ''<CR>
nnoremap <buffer> [] /^\*\+<CR>{:let @/ = ''<CR>
