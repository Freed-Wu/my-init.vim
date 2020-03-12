let g:neoformat_enabled_python = ['yapf']
let b:dir = ['\.ropeproject']

call textobj#user#map('python', {
			\   'class': {
			\     'select-a': '<buffer>ae',
			\     'select-i': '<buffer>ie',
			\     'move-p': '<buffer>[[',
			\     'move-n': '<buffer>]]',
			\   },
			\   'function': {
			\     'select-a': '<buffer>af',
			\     'select-i': '<buffer>if',
			\     'move-p': '<buffer>[m',
			\     'move-n': '<buffer>]m',
			\   }
			\ })

"nnoremap <buffer> <LocalLeader>l :call LanguageClient_contextMenu()<CR>
"nnoremap <buffer> <silent> K :call LanguageClient#textDocument_hover()<CR>
"nnoremap <buffer> <silent> gd :call LanguageClient#textDocument_definition()<CR>
"nnoremap <buffer> <silent> gD :call LanguageClient#textDocument_rename()<CR>
nnoremap <buffer> <LocalLeader>u :PymodeRopeUndo<CR>
nnoremap <buffer> <LocalLeader>U :PymodeRopeRedo<CR>
nnoremap <buffer> <LocalLeader>i :PymodeRopeAutoImpor<CR>
nnoremap <buffer> <LocalLeader>c :PymodeRopeModuleToPackage<CR>
nnoremap <buffer> <LocalLeader>n :PymodeRopeNewProject<CR>
nnoremap <buffer> <LocalLeader>R :PymodeRopeRenameModule<CR>
nnoremap <buffer> <LocalLeader>G :PymodeRopeRegenerate<CR>
nnoremap <buffer> gK :PymodeDoc<Space>

