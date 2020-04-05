let b:clean_temp = [
			\ 'stderr.txt', 'stdout.txt',
			\ '*.map', '*.obj', '*.lst', '*.crf', '*.bak',
			\ '.vs', '.vscode', 'Debug', 'Release',
			\ ]

autocmd! BufWinLeave *.java,*.hpp,*.h call init#clean#main(b:clean_temp)

call c#map#main()

setlocal makeprg=java\ %:p

