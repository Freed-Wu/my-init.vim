call vimtex#init()

setlocal spell
setlocal makeprg=soffice\ %

nnoremap <buffer> <LocalLeader>lv :CSVTabularize<CR>
nnoremap <buffer> <LocalLeader>ll :let b:csv_headerline = !get(b:, 'csv_headerline', 1)<CR>
nnoremap <buffer> <LocalLeader>J A,<Esc>J
nnoremap <buffer> yip :CSVDupColumn<CR>
nnoremap <buffer> cip :CSVMoveCol<Space>
nnoremap <buffer> dip :CSVDeleteColumn<CR>
nnoremap <buffer> <LocalLeader>a :CSVAddColumn<CR>
nnoremap <buffer> <LocalLeader>o :CSVNewRecord<CR>
nnoremap <buffer> <LocalLeader>/ :Substitute<Space>
nnoremap <buffer> <LocalLeader>? :Sort<CR>
nnoremap <buffer> <LocalLeader>, :NewDelimiter<Space>
nnoremap <buffer> <LocalLeader>p a<C-r>=b:csv_result<CR><Esc>
nnoremap <buffer> <LocalLeader>P i<C-r>=b:csv_result<CR><Esc>
