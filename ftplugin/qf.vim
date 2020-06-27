wincmd J

call init#map#main()

setlocal previewwindow
setlocal nomodifiable
setlocal conceallevel=2
setlocal concealcursor=nv
setlocal norelativenumber

nnoremap <buffer><silent> <CR> <CR>
nnoremap <buffer> o yiw<C-w>W:<C-r>0<CR>
nnoremap <buffer> p :<C-u>call quickui#tools#preview_quickfix()<CR>

