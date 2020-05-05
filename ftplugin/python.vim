let g:neoformat_enabled_python = ['yapf']
let b:dir = ['\.ropeproject']
let g:pymode_doc_bind = ''

call textobj#user#map('python', {
			\ 'class': {
			\ 'select-a': '<buffer>ae',
			\ 'select-i': '<buffer>ie',
			\ 'move-p': '<buffer>[[',
			\ 'move-n': '<buffer>]]',
			\ },
			\ 'function': {
			\ 'select-a': '<buffer>af',
			\ 'select-i': '<buffer>if',
			\ 'move-p': '<buffer>[m',
			\ 'move-n': '<buffer>]m',
			\ }
			\ })

setlocal keywordprg=:Help

nnoremap <buffer> <LocalLeader>u :PymodeRopeUndo<CR>
nnoremap <buffer> <LocalLeader>U :PymodeRopeRedo<CR>
nnoremap <buffer> <LocalLeader>i :PymodeRopeAutoImpor<CR>
nnoremap <buffer> <LocalLeader>c :PymodeRopeModuleToPackage<CR>
nnoremap <buffer> <LocalLeader>n :PymodeRopeNewProject<CR>
nnoremap <buffer> <LocalLeader>R :PymodeRopeRenameModule<CR>
nnoremap <buffer> <LocalLeader>G :PymodeRopeRegenerate<CR>
nnoremap <buffer> gS :<C-u>REPLDebugStopAtCurrentLine<Cr>
nnoremap <buffer> gsn :<C-u>REPLPDBN<Cr>
nnoremap <buffer> gss :<C-u>REPLPDBS<Cr>

