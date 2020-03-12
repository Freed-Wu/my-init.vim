call init#map#main()

command! -buffer -nargs=? Deol terminal

setlocal nowrap

if has('unix')
	nnoremap <buffer> <C-q> i<C-c><C-u><C-d>
else
	nnoremap <buffer> <C-q> :<C-u>quit!<CR>
endif
nnoremap <buffer> o yiw<C-w>W:<C-r>0<CR>
nnoremap <buffer> c yiW:cd <C-r>0<CR>
xnoremap <buffer> c <Esc>:cd <C-r>0<CR>
nnoremap <buffer> p i<C-w>"+
nnoremap <buffer> P i<C-w>"
nnoremap <buffer> <Leader>jj :Rooter<CR>:Defx -new `getcwd()`<CR><C-w>=

