wincmd J

call init#map#main()

setlocal previewwindow
setlocal nomodifiable

nnoremap <buffer><silent> <LocalLeader>e :<C-u>execute 'echo '.expand('<cWORD>')<CR>
xnoremap <buffer><silent> <LocalLeader>e y:echo <C-r>0<CR>
nnoremap <buffer><silent> <LocalLeader>E :<C-u>execute 'echomsg '.expand('<cWORD>')<CR>
xnoremap <buffer><silent> <LocalLeader>E y:echomsg <C-r>0<CR>
nnoremap <buffer><silent> <LocalLeader>t :<C-u>set <C-r><C-w><CR>
xnoremap <buffer><silent> <LocalLeader>t y:set <C-r>0<CR>
nnoremap <buffer><silent> <LocalLeader>i :<C-u>highlight <C-r><C-w><CR>
xnoremap <buffer><silent> <LocalLeader>i y:highlight <C-r>0<CR>
nnoremap <buffer> o yiw<C-w>W:<C-r>0<CR>
nnoremap <buffer> p :<C-u>call quickui#tools#preview_quickfix()<CR>

