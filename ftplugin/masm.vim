let b:clean_temp = [
			\ 'stderr.txt', 'stdout.txt',
			\ '*.map', '*.obj', '*.lst', '*.crf', '*.bak', '.vs', '.vscode', 'Debug', 'Release'
			\ ]
let b:clean = b:clean_temp + ['*.exe', '*.out', '*.dll']

autocmd! BufWinLeave *.asm call init#clean#main(b:clean)

nnoremap <buffer> gS :split $HOME/.dosbox/*.conf<CR>
if exists('$DOSBOXWORKSPACE')
	nnoremap <buffer> gs :Defx -new -auto-cd $DOSBOXWORKSPACE<CR>
else
	nnoremap <buffer> gs :Defx -new -auto-cd $HOME/.dosbox<CR>
endif

