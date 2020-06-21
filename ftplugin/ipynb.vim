if expand('%:p') == g:vimpyter_view_directory
	let b:proxy_file = expand('%:p')
	let b:original_file = $VIMWORKSPACE . '/' . expand('%:t')
elseif expand('%:p') == g:vimpyter_view_directory
	let b:proxy_file = $VIMWORKSPACE . '/' . expand('%:t')
	let b:original_file = expand('%:p')
endif

let b:clean_temp = ['.ipynb_checkpoints']

setlocal makeprg=jupyter\ nbconvert\ %\ --to\ python

nnoremap <buffer> <LocalLeader>ll :VimpyterStartJupyter<CR>
nnoremap <buffer> <LocalLeader>lL :VimpyterStartNteract<CR>
nnoremap <buffer> <LocalLeader>o o<Esc>:VimpyterInsertPythonBlock<CR>i
