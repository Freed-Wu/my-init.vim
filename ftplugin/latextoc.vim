nunmap <buffer> <Space>
nnoremap <buffer> h h
nnoremap <buffer> <Esc> <Esc>
nnoremap <buffer> q q
nmap <buffer> t <Plug>Sneak_t
nmap <buffer> f <Plug>Sneak_f
nmap <buffer> F <Plug>Sneak_F
nnoremap <buffer> <F1> :<C-u>call b:toc.toggle_help()<CR>
nnoremap <buffer> ZQ :<C-u>call b:toc.close()<CR>
nnoremap <buffer> p :<C-u>call b:toc.activate_current(0)<CR>
nnoremap <buffer> S :<C-u>call b:toc.toggle_sorted_todos()<CR>
nnoremap <buffer> <C-x> :<C-u>call b:toc.clear_filter()<CR>
nnoremap <buffer> <C-a> :<C-u>call b:toc.filter()<CR>
nnoremap <buffer> K :<C-u>call b:toc.increase_depth()<CR>
nnoremap <buffer> J :<C-u>call b:toc.decrease_depth()<CR>

