function! c#map#main() "{{{
	source $GITHUBWORKSPACE/LucHermitte/VimFold4C/ftplugin/c/c-fold.vim

	setlocal path+=~/.local/include

	nnoremap <buffer> <LocalLeader>o :set paste<CR>i<C-r>=protodef#ReturnSkeletonsFromPrototypesForCurrentBuffer({})<CR><Esc>='[:set nopaste<CR>
	nnoremap <buffer> <LocalLeader>O :set paste<CR>i<C-r>=protodef#ReturnSkeletonsFromPrototypesForCurrentBuffer({'includeNS': 0})<CR><Esc>='[:set nopaste<CR>
	omap <buffer> aL <Plug>(textobj-continuous-cpp-a)
	xmap <buffer> aL <Plug>(textobj-continuous-cpp-a)
	omap <buffer> iL <Plug>(textobj-continuous-cpp-i)
	xmap <buffer> iL <Plug>(textobj-continuous-cpp-i)
	xmap <buffer> af <Plug>(textobj-function-a)
	xmap <buffer> if <Plug>(textobj-function-i)
	xmap <buffer> aF <Plug>(textobj-function-A)
	xmap <buffer> iF <Plug>(textobj-function-I)
	omap <buffer> af <Plug>(textobj-function-a)
	omap <buffer> if <Plug>(textobj-function-i)
	omap <buffer> aF <Plug>(textobj-function-A)
	omap <buffer> iF <Plug>(textobj-function-I)
	nnoremap <buffer> [[ ?{<CR>:let @/ = ''<CR>w99[{
	nnoremap <buffer> ]] /}<CR>:let @/ = ''<CR>b99]}
	nnoremap <buffer> ][ j0[[%/{<CR>:let @/ = ''<CR>
	nnoremap <buffer> [] k$][%?}<CR>:let @/ = ''<CR>
	xnoremap <buffer> [[ ?{<CR>:let @/ = ''<CR>w99[{
	xnoremap <buffer> ]] /}<CR>:let @/ = ''<CR>b99]}
	xnoremap <buffer> ][ j0[[%/{<CR>:let @/ = ''<CR>
	xnoremap <buffer> [] k$][%?}<CR>:let @/ = ''<CR>
	onoremap <buffer> [[ ?{<CR>:let @/ = ''<CR>w99[{
	onoremap <buffer> ]] /}<CR>:let @/ = ''<CR>b99]}
	onoremap <buffer> ][ j0[[%/{<CR>:let @/ = ''<CR>
	onoremap <buffer> [] k$][%?}<CR>:let @/ = ''<CR>
endfunction "}}}

