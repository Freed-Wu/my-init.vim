if expand('%:e') == 'vt'
	nnoremap <buffer><silent> <LocalLeader>g :split %<.v<CR>
else
	nnoremap <buffer><silent> <LocalLeader>g :split %<.vt<CR>
endif

let b:clean = ['*.vvp']

setlocal makeprg=iverilog\ -o\ %<.vo\ %<.vt\|\ vvp\ %<.vo

