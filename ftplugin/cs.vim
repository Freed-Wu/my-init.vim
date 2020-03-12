let b:clean_temp = [
			\ 'stderr.txt', 'stdout.txt',
			\ '*.map', '*.obj', '*.lst', '*.crf', '*.bak',
			\ '.vs', '.vscode', 'Debug', 'Release',
			\ ]
let b:clean = b:clean_temp + ['*.exe', '*.out', '*.dll']
let g:OmniSharp_start_server = 1
let g:OmniSharp_server_path = 'OmniSharp.exe'
let g:OmniSharp_host = 'http://localhost:3389'
if has('unix') || has('mac')
	let g:OmniSharp_server_use_mono = 1
endif

autocmd! BufWinLeave *.cs,*.hpp,*.h call init#clean#main(b:clean_temp)

"call deoplete#custom#option('sources', {
			"\ 'cs': ['omnisharp'],
			"\ })

setlocal makeprg=dotnet\ build\ %:p

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

