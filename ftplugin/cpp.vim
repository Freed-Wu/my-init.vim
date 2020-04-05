let b:clean_temp = [
			\ 'stderr.txt', 'stdout.txt',
			\ '*.map', '*.obj', '*.lst', '*.crf', '*.bak',
			\ '.vs', '.vscode', 'Debug', 'Release',
			\ ]
let b:clean = b:clean_temp + ['*.exe', '*.out', '*.dll']

autocmd! BufWinLeave *.cpp,*.hpp,*.h call init#clean#main(b:clean_temp)

call c#map#main()

setlocal makeprg=clang\ %\ -o\ %<.exe

nnoremap <buffer><silent> <LocalLeader>ra :call C_MakeArguments()<CR>
nnoremap <buffer><silent> <LocalLeader>rc :call C_ChooseMakefile()<CR>
nnoremap <buffer> <silent> <LocalLeader>j i<C-R>=C_JumpCtrlJ()<CR>
inoremap <buffer> <silent> <LocalLeader>j <C-R>=C_JumpCtrlJ()<CR>

