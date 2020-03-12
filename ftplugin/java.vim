let b:clean_temp = [
			\ 'stderr.txt', 'stdout.txt',
			\ '*.map', '*.obj', '*.lst', '*.crf', '*.bak',
			\ '.vs', '.vscode', 'Debug', 'Release',
			\ ]

source $GITHUBWORKSPACE/LucHermitte/VimFold4C/ftplugin/c/c-fold.vim

autocmd! BufWinLeave *.java,*.hpp,*.h call init#clean#main(b:clean_temp)

setlocal makeprg=java\ %:p

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

