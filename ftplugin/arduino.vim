let b:clean = [
			\ '*.filters', '*.user', '.vs',
			\ 'Debug', 'Release', 'x86', 'x64', '__vm',
			\ ]

source $GITHUBWORKSPACE/LucHermitte/VimFold4C/ftplugin/c/c-fold.vim

setlocal makeprg=arduino_debug\ %:p

nnoremap <buffer> <LocalLeader>1 :make --verify<CR>
nnoremap <buffer> <LocalLeader>2 :make --upload<CR>
nnoremap <buffer> <LocalLeader>m :ArduinoVerify<CR>
nnoremap <buffer> <LocalLeader>M :ArduinoUpload<CR>
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
omap <buffer> aL <Plug>(textobj-continuous-cpp-a)
xmap <buffer> aL <Plug>(textobj-continuous-cpp-a)
omap <buffer> iL <Plug>(textobj-continuous-cpp-i)
xmap <buffer> iL <Plug>(textobj-continuous-cpp-i)

