call c#map#main()

setlocal makeprg=arduino_debug\ %:p

nnoremap <buffer> <LocalLeader>1 :make --verify<CR>
nnoremap <buffer> <LocalLeader>2 :make --upload<CR>
nnoremap <buffer> <LocalLeader>m :ArduinoVerify<CR>
nnoremap <buffer> <LocalLeader>M :ArduinoUpload<CR>

