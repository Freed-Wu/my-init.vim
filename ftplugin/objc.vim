let b:clean_temp = [
			\ 'stderr.txt', 'stdout.txt',
			\ '*.map', '*.obj', '*.lst', '*.crf', '*.bak',
			\ '.vs', '.vscode', 'Debug', 'Release',
			\ ]
let b:clean = b:clean_temp + ['*.exe', '*.out', '*.dll']

autocmd! BufWinLeave *.cc,*.h call init#clean#main(b:clean_temp)

source $GITHUBWORKSPACE/LucHermitte/VimFold4C/ftplugin/c/c-fold.vim

setlocal makeprg=clang\ %\ -o\ %<.exe

nnoremap <buffer> <silent> <LocalLeader>gg :FSHere<CR>
nnoremap <buffer> <silent> <LocalLeader>gH :FSLeft<CR>
nnoremap <buffer> <silent> <LocalLeader>gh :FSSplitLeft<CR>
nnoremap <buffer> <silent> <LocalLeader>gL :FSRight<CR>
nnoremap <buffer> <silent> <LocalLeader>gl :FSSplitRight<CR>
nnoremap <buffer> <silent> <LocalLeader>gJ :FSBelow<CR>
nnoremap <buffer> <silent> <LocalLeader>gj :FSSplitBelow<CR>
nnoremap <buffer> <silent> <LocalLeader>gK :FSAbove<CR>
nnoremap <buffer> <silent> <LocalLeader>gk :FSSplitAbove<CR>

