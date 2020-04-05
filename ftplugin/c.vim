let b:clean_temp = [
			\ 'stderr.txt', 'stdout.txt',
			\ '*.map', '*.obj', '*.lst', '*.crf', '*.bak',
			\ '.vs', '.vscode', 'Debug', 'Release',
			\ 'JLinkLog.txt',
			\ '*.bak', '*.ddk', '*.edk', '*.lst', '*.lnp', '*.mpf',
			\ '*.mpj', '*.obj', '*.omf', '*.plg', '*.rpt', '*.tmp',
			\ '*.__i', '*.crf', '*.o', '*.d', '*.axf', '*.tra',
			\ '*.dep', '*.iex', '*.htm', '*.sct', '*.map',
			\ 'settings', '*.pbi', '*.xcl', '*.pbd', '*.browse',
			\ '*.linf', '*.out', '*.sim', '*.wsdt', '*.wspos',
			\ '*.ewt', '*.ewd', '*.dep',
			\ '*.prefs', '*.launch', '*.ccxml', '.ccsproject',
			\ 'targetConfigs', '.launches', '.settings',
			\ ]
let b:clean = b:clean_temp + ['*.exe', '*.out', '*.dll']

autocmd! BufWinLeave *.c,*.h call init#clean#main(b:clean_temp)

source $GITHUBWORKSPACE/LucHermitte/VimFold4C/ftplugin/c/c-fold.vim

call c#map#main()

setlocal makeprg=clang\ %\ -o\ %<.exe
setlocal keywordprg=:Help

nnoremap <buffer><silent> <LocalLeader>ra :call C_MakeArguments()<CR>
nnoremap <buffer><silent> <LocalLeader>rc :call C_ChooseMakefile()<CR>
nnoremap <buffer> <silent> <LocalLeader>j i<C-R>=C_JumpCtrlJ()<CR>
inoremap <buffer> <silent> <LocalLeader>j <C-R>=C_JumpCtrlJ()<CR>

