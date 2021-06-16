call vimtex#init()

setlocal spell
setlocal makeprg=ssconvert\ %\ %:r.xlsx
if expand('%:e') ==# 'tsv'
	setlocal conceallevel=0
endif

nnoremap <buffer> <LocalLeader>lv :CSVTabularize<CR>
nnoremap <buffer> <LocalLeader>ll :let b:csv_headerline = !get(b:, 'csv_headerline', 1)<CR>
nnoremap <buffer> yap :CSVDupColumn<CR>
nnoremap <buffer> cap :CSVMoveCol<Space>
nnoremap <buffer> dap :CSVDeleteColumn<CR>
nnoremap <buffer> =p a<C-r>=b:csv_result<CR><Esc>
nnoremap <buffer> =P i<C-r>=b:csv_result<CR><Esc>
nnoremap <buffer> gA :CSVAddColumn<CR>
nnoremap <buffer> go :CSVNewRecord<CR>
nnoremap <buffer> <LocalLeader>/ :Substitute<Space>
nnoremap <buffer> <LocalLeader>? :Sort<CR>
nnoremap <buffer> <LocalLeader>, :NewDelimiter<Space>
