nnoremap <buffer><silent> <LocalLeader>c :make clean<CR>
nnoremap <buffer><silent> <LocalLeader>C :make cleanall<CR>
nnoremap <buffer><silent> <LocalLeader>M :make<Space>
nnoremap <buffer><silent> <LocalLeader>ra :call C_MakeArguments()<CR>
nnoremap <buffer><silent> <LocalLeader>rc :call C_ChooseMakefile()<CR>
nnoremap <buffer> <silent> <LocalLeader>j i<C-R>=C_JumpCtrlJ()<CR>
inoremap <buffer> <silent> <LocalLeader>j <C-R>=C_JumpCtrlJ()<CR>

