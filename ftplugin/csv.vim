if expand('%') =~ 'tab/.*/'
	let b:longpath = split(expand('%'), 'tab'.expand('/'))[-1]
	let b:list = split(b:longpath, expand('/'))
	if len(b:list) == 2
		let b:path = 'fig/'.b:list[0].'/'.'tab'.b:list[1].'plot.m'
	elseif len(b:list) == 1
		let b:path = 'fig/'.'tab'.b:list[1].'plot.m'
	endif
	nnoremap <buffer><silent> <LocalLeader>b :Rooter<CR>:execute('split '.b:path)<CR>
endif

call vimtex#init()

setlocal makeprg=scalc\ %:p
setlocal spell

nnoremap <buffer><silent> gs :CSVTabularize<CR>
nnoremap <buffer><silent> <LocalLeader>J gJi,<Esc>
nnoremap <buffer><silent> <LocalLeader>t :CSVDupColumn<CR>
nnoremap <buffer><silent> <LocalLeader>m :CSVMoveCol<Space>
nnoremap <buffer><silent> <LocalLeader>d :CSVDeleteColumn<CR>
nnoremap <buffer><silent> <LocalLeader>a :CSVAddColumn<CR>
nnoremap <buffer><silent> <LocalLeader>o :CSVNewRecord<CR>j^i<BS>
nnoremap <buffer><silent> <LocalLeader>/ :Substitute<Space>
nnoremap <buffer><silent> <LocalLeader>? :Sort<Space>
nnoremap <buffer><silent> <LocalLeader>, :NewDelimiter<Space>
nnoremap <buffer><silent> <LocalLeader><LocalLeader>a :AvgCol<CR>:let @" = b:csv_result<CR>
nnoremap <buffer><silent> <LocalLeader><LocalLeader>m :MinCol<CR>:let @" = b:csv_result<CR>
nnoremap <buffer><silent> <LocalLeader><LocalLeader>M :MaxCol<CR>:let @" = b:csv_result<CR>
nnoremap <buffer><silent> <LocalLeader><LocalLeader>s :SmplVarCol<CR>:let @" = b:csv_result<CR>
nnoremap <buffer><silent> <LocalLeader><LocalLeader>S :SmplStdCol<CR>:let @" = b:csv_result<CR>
nnoremap <buffer><silent> <LocalLeader><LocalLeader>p ""p
nnoremap <buffer><silent> <LocalLeader><LocalLeader><Tab> :<C-u>let b:delimiter = "\t"<CR>
nnoremap <buffer><silent> <LocalLeader><LocalLeader>, :<C-u>let b:delimiter = ','<CR>

