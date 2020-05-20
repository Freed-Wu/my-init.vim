function! c#map#main() "{{{
	source $GITHUBWORKSPACE/LucHermitte/VimFold4C/ftplugin/c/c-fold.vim

	let b:clean_temp = [
				\ 'stderr.txt', 'stdout.txt',
				\ '*.map', '*.obj', '*.lst', '*.crf', '*.bak',
				\ '.vs', '.vscode', 'Debug', 'Release',
				\ 'JLinkLog.txt',
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

	" vim-scripts/DoxygenToolkit.vim {{{3 "
	nnoremap <LocalLeader>xx :<C-u>Dox<CR>
	nnoremap <LocalLeader>xa :<C-u>DoxAuthor<CR>
	nnoremap <LocalLeader>xl :<C-u>DoxLic<CR>
	nnoremap <LocalLeader>xu :<C-u>DoxUndoc<CR>
	" 3}}} vim-scripts/DoxygenToolkit.vim "
	" vim-scripts/doxygen-support.vim {{{3 "
	let g:Doxy_GlobalTemplateFile = $VIMCONFIG.'/.doxygen-support.vim/doxygen.templates'
	let g:Doxy_DoxygenExecutable = 'doxygen'
	nnoremap <LocalLeader>xm :<C-u>DxRun<CR>
	nnoremap <LocalLeader>xw :<C-u>DxSelectWorkingDir<CR>
	nnoremap <LocalLeader>xc :<C-u>DxSelectConfigFile<CR>
	nnoremap <LocalLeader>xe :<C-u>DxEditConfigFile<CR>
	nnoremap <LocalLeader>xg :<C-u>DxGenerateConfigFile<CR>
	nnoremap <LocalLeader>xt :<C-u>DxEditLocalTemplates<CR>
	nnoremap <LocalLeader>xT :<C-u>DxEditGlobalTemplates<CR>
	nnoremap <LocalLeader>xr :<C-u>DxReread<CR>
	nnoremap <LocalLeader>xs :<C-u>DxSettings<CR>
	" 3}}} vim-scripts/doxygen-support.vim "
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
endfunction "}}}

