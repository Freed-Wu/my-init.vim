wincmd J

call init#map#main()

"autocmd! BufEnter * call s:autoquit()
"function! s:autoquit() "{{{
	"if len(filter(range(1, winnr('$')), 'empty(getbufvar(winbufnr(v:val), "&buftype"))')) == 0 && &buftype == 'quickfix'
		"qall!
	"endif
"endfunction "}}}

setlocal previewwindow
setlocal nomodifiable

nnoremap <buffer> <CR> <CR>
xnoremap <buffer> <CR> <CR>
nnoremap <buffer><silent> <LocalLeader>i yiw:highlight <C-r>0<CR>
xnoremap <buffer><silent> <LocalLeader>i y:highlight <C-r>0<CR>
nnoremap <buffer><silent> <LocalLeader>e yiW:echo <C-r>0<CR>
xnoremap <buffer><silent> <LocalLeader>e y:echo <C-r>0<CR>
nnoremap <buffer><silent> <LocalLeader>E yiW:echom <C-r>0<CR>
xnoremap <buffer><silent> <LocalLeader>E y:echom <C-r>0<CR>
nnoremap <buffer><silent> <LocalLeader>s yi':set <C-r>0<CR>
xnoremap <buffer><silent> <LocalLeader>s y:set <C-r>0<CR>
nnoremap <buffer> <Leader>lq <C-w>W:cclose<CR>
nnoremap <buffer> <Leader>ll <C-w>W:lclose<CR>
nnoremap <buffer> <Leader>lm <C-w>W:cclose<CR>
nnoremap <buffer> <Leader>lp <C-w>W:cclose<CR>
nnoremap <buffer> <Leader>lo <C-w>W:lclose<CR>
nnoremap <buffer> o yiw<C-w>W:<C-r>0<CR>

