let b:clean_temp = [
			\ 'stderr.txt', 'stdout.txt',
			\ '*.map', '*.obj', '*.lst', '*.crf', '*.bak', '.vs', '.vscode', 'Debug', 'Release'
			\ ]
let b:clean = b:clean_temp + ['*.exe', '*.out', '*.dll']

nnoremap <buffer> gS :sfind $HOME/.dosbox/*.conf<CR>
if exists('$DOSBOXWORKSPACE')
	nnoremap <buffer> gs :Defx $DOSBOXWORKSPACE<CR>
else
	nnoremap <buffer> gs :Defx $HOME/.dosbox<CR>
endif

