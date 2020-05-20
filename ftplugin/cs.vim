let g:OmniSharp_start_server = 1
let g:OmniSharp_server_path = 'OmniSharp.exe'
let g:OmniSharp_host = 'http://localhost:3389'
if has('unix') || has('mac')
	let g:OmniSharp_server_use_mono = 1
endif

call c#map#main()

setlocal makeprg=dotnet\ build\ %:p

