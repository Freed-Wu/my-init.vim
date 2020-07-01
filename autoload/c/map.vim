function! c#map#main() "{{{
	source $GITHUBWORKSPACE/LucHermitte/VimFold4C/ftplugin/c/c-fold.vim

	let b:clean_temp = [
				\ 'stderr.txt', 'stdout.txt',
				\ '*.map', '*.obj', '*.lst', '*.crf', '*.bak',
				\ '.vs', '.vscode', 'Debug', 'Release',
				\ 'JLinkLog.txt', '.ccls-cache',
				\ '*.bak', '*.ddk', '*.edk', '*.lst', '*.lnp', '*.mpf',
				\ '*.mpj', '*.obj', '*.omf', '*.plg', '*.rpt', '*.tmp',
				\ '*.__i', '*.crf', '*.o', '*.d', '*.axf', '*.tra',
				\ '*.dep', '*.iex', '*.htm', '*.sct', '*.map',
				\ 'settings', '*.pbi', '*.xcl', '*.pbd', '*.browse',
				\ '*.linf', '*.out', '*.sim', '*.wsdt', '*.wspos',
				\ '*.ewt', '*.ewd', '*.dep',
				\ '*.prefs', '*.launch', '*.ccxml', '.ccsproject',
				\ 'targetConfigs', '.launches', '.settings',
				\ ]
	let b:clean = b:clean_temp + ['*.exe', '*.out', '*.dll']

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

