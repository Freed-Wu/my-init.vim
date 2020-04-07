let g:neoformat_enabled_cpp = ['astyle']
let b:clean = ['%<.exe']

setlocal makeprg=Ahk2Exe\ \/in\ %:p

nnoremap <buffer><silent> <LocalLeader>C :call init#clean#main(b:clean)<CR>

