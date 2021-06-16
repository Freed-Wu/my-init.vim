setlocal previewwindow
setlocal norelativenumber
setlocal textwidth=0

nnoremap <buffer><silent> <CR> <CR>
nnoremap <buffer> o yiw<C-w>W:<C-r>0<CR>
nnoremap <buffer> <LocalLeader>i :<C-u>packadd cfilter<CR>
nnoremap <buffer> <LocalLeader>ll :<C-u>Cfilter //<Left>
nnoremap <buffer> <LocalLeader>lL :<C-u>Lfilter //<Left>
nnoremap <buffer> [[ ?\<error\><CR>:let @/ = ''<CR>
nnoremap <buffer> ]] /\<error\><CR>:let @/ = ''<CR>
nnoremap <buffer> [] ?\<error\><CR>k:let @/ = ''<CR>
nnoremap <buffer> [] /\<error\><CR>j:let @/ = ''<CR>
