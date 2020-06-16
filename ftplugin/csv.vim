call vimtex#init()

setlocal makeprg=scalc\ %:p
setlocal spell

nnoremap <buffer><silent> <LocalLeader>ll :CSVTabularize<CR>
nnoremap <buffer><silent> <LocalLeader>J A,<Esc>J
nnoremap <buffer><silent> yip :CSVDupColumn<CR>
nnoremap <buffer><silent> cip :CSVMoveCol<Space>
nnoremap <buffer><silent> dip :CSVDeleteColumn<CR>
nnoremap <buffer><silent> <LocalLeader>a :CSVAddColumn<CR>
nnoremap <buffer><silent> <LocalLeader>o :CSVNewRecord<CR>
nnoremap <buffer><silent> <LocalLeader>/ :Substitute<Space>
nnoremap <buffer><silent> <LocalLeader>? :Sort<Space>
nnoremap <buffer><silent> <LocalLeader>, :NewDelimiter<Space>
nnoremap <buffer><silent> <LocalLeader>p a<C-r>=b:csv_result<CR><Esc>
nnoremap <buffer><silent> <LocalLeader>P i<C-r>=b:csv_result<CR><Esc>
