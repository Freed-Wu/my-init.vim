let b:clean_temp = [
			\ 'stderr.txt', 'stdout.txt',
			\ '*.map', '*.obj', '*.lst', '*.crf', '*.bak',
			\ '.vs', '.vscode', 'Debug', 'Release',
			\ ]
let b:clean = b:clean_temp + ['*.exe', '*.out', '*.dll']

autocmd! BufWinLeave *.cx,*.h call init#clean#main(b:clean_temp)

call c#map#main()

setlocal makeprg=clang\ %\ -o\ %<.exe

