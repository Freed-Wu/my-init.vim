let g:neoformat_enabled_cpp = ['astyle']
let b:clean_file = ['%<.exe']
let b:clean_dir = []

autocmd! BufWinLeave *.ahk call init#clean#main(b:clean_file, b:clean_dir)

setlocal makeprg=Ahk2Exe\ \/in\ %:p

nnoremap <buffer><silent> <LocalLeader>C :call init#clean#main(b:clean_file, b:clean_dir)<CR>

