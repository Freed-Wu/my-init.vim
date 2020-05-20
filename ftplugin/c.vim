source $GITHUBWORKSPACE/LucHermitte/VimFold4C/ftplugin/c/c-fold.vim

call c#map#main()

setlocal makeprg=clang\ %\ -o\ %<.exe
setlocal keywordprg=:Help

nnoremap <buffer><silent> <LocalLeader>ra :call C_MakeArguments()<CR>
nnoremap <buffer><silent> <LocalLeader>rc :call C_ChooseMakefile()<CR>
nnoremap <buffer> <silent> <LocalLeader>j i<C-R>=C_JumpCtrlJ()<CR>
inoremap <buffer> <silent> <LocalLeader>j <C-R>=C_JumpCtrlJ()<CR>

