setlocal nomodifiable
setlocal readonly

nnoremap <buffer> [[ ?^\S<CR>:let @/=''<CR>
nnoremap <buffer> ]] /^\S<CR>:let @/=''<CR>
nnoremap <buffer> [] ?^\S<CR>):let @/=''<CR>
nnoremap <buffer> ][ /^\S<CR>(:let @/=''<CR>
