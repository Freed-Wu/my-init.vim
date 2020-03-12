let b:clean_temp = [
			\ 'stderr.txt', 'stdout.txt',
			\ '*.map', '*.obj', '*.lst', '*.crf', '*.bak',
			\ '.vs', '.vscode', 'Debug', 'Release',
			\ ]
let b:clean = b:clean_temp + ['*.exe', '*.out', '*.dll']

autocmd! BufWinLeave *.cpp,*.hpp,*.h call init#clean#main(b:clean_temp)

omap <buffer> aL <Plug>(textobj-continuous-cpp-a)
xmap <buffer> aL <Plug>(textobj-continuous-cpp-a)
omap <buffer> iL <Plug>(textobj-continuous-cpp-i)
xmap <buffer> iL <Plug>(textobj-continuous-cpp-i)
nnoremap <buffer> [[ ?{<CR>w99[{
nnoremap <buffer> ][ /}<CR>b99]}
nnoremap <buffer> ]] j0[[%/{<CR>
nnoremap <buffer> [] k$][%?}<CR>
xnoremap <buffer> [[ ?{<CR>w99[{
xnoremap <buffer> ][ /}<CR>b99]}
xnoremap <buffer> ]] j0[[%/{<CR>
onoremap <buffer> [] k$][%?}<CR>
onoremap <buffer> [[ ?{<CR>w99[{
onoremap <buffer> ][ /}<CR>b99]}
onoremap <buffer> ]] j0[[%/{<CR>
onoremap <buffer> [] k$][%?}<CR>
xmap <buffer> af <Plug>(textobj-function-a)
xmap <buffer> if <Plug>(textobj-function-i)
xmap <buffer> aF <Plug>(textobj-function-A)
xmap <buffer> iF <Plug>(textobj-function-I)
omap <buffer> af <Plug>(textobj-function-a)
omap <buffer> if <Plug>(textobj-function-i)
omap <buffer> aF <Plug>(textobj-function-A)
omap <buffer> iF <Plug>(textobj-function-I)
nnoremap <buffer><silent> <LocalLeader>hh :execute('Utl openlink '.expand(g:repos_path).expand('/WolfgangMehner/c-support/c-support/doc/c-hotkeys.pdf')))<CR>
nnoremap <buffer><silent> <LocalLeader>ra :call C_MakeArguments()<CR>
nnoremap <buffer><silent> <LocalLeader>rc :call C_ChooseMakefile()<CR>
nnoremap <buffer> <silent> <LocalLeader>j i<C-R>=C_JumpCtrlJ()<CR>
inoremap <buffer> <silent> <LocalLeader>j <C-R>=C_JumpCtrlJ()<CR>
nnoremap <buffer> <LocalLeader>m :silent !clang % -o %<.exe<CR>
nnoremap <buffer> <LocalLeader>o :set paste<CR>i<C-r>=protodef#ReturnSkeletonsFromPrototypesForCurrentBuffer({})<CR><Esc>='[:set Nopaste<CR>
nnoremap <buffer> <LocalLeader>O :set paste<CR>i<C-r>=protodef#ReturnSkeletonsFromPrototypesForCurrentBuffer({'includeNS': 0})<CR><Esc>='[:set Nopaste<CR>
nnoremap <buffer> <silent> <LocalLeader>gg :FSHere<CR>
nnoremap <buffer> <silent> <LocalLeader>gH :FSLeft<CR>
nnoremap <buffer> <silent> <LocalLeader>gh :FSSplitLeft<CR>
nnoremap <buffer> <silent> <LocalLeader>gL :FSRight<CR>
nnoremap <buffer> <silent> <LocalLeader>gl :FSSplitRight<CR>
nnoremap <buffer> <silent> <LocalLeader>gJ :FSBelow<CR>
nnoremap <buffer> <silent> <LocalLeader>gj :FSSplitBelow<CR>
nnoremap <buffer> <silent> <LocalLeader>gK :FSAbove<CR>
nnoremap <buffer> <silent> <LocalLeader>gk :FSSplitAbove<CR>

