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

"call deoplete#custom#option('sources', {
			"\ 'cs': ['omnisharp'],
			"\ })
call c#map#main()

setlocal makeprg=dotnet\ build\ %:p

