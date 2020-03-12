let b:clean_temp = [
			\ 'stderr.txt', 'stdout.txt',
			\ '*.map', '*.obj', '*.lst', '*.crf', '*.bak', '.vs', '.vscode', 'Debug', 'Release'
			\ ]
let b:clean = b:clean_temp + ['*.exe', '*.out', '*.dll']

autocmd! BufWinLeave *.asm call init#clean#main(b:clean)

nnoremap <buffer> <LocalLeader>S :split $MYDOSBOXRC<CR>
nnoremap <buffer> <LocalLeader>s :split $DOSBOXWORKSPACE<CR>
nnoremap <buffer> <LocalLeader>m :silent !dosbox -noconsole -c "..\masm\masm %:r.asm"<CR>
nnoremap <buffer> <LocalLeader>M :silent !dosbox -noconsole -c "..\masm\link %:r.obj"<CR><CR>
nnoremap <buffer> <LocalLeader>r :silent !dosbox -noconsole -c "%:r.exe"<CR><CR>
nnoremap <buffer> <LocalLeader>d :silent !dosbox -noconsole -c "..\TC\Tdebug %:r.exe"<CR><CR>
nnoremap <buffer> <LocalLeader>D :silent !dosbox -noconsole -c "..\masm\debug %:r.exe"<CR><CR>
nnoremap <buffer> <LocalLeader>3 :silent !dosbox -noconsole -c "..\masm\debug32 %:r.exe"<CR><CR>

