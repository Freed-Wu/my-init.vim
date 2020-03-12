if expand('%:p') == g:vimpyter_view_directory
	let b:proxy_file = expand('%:p')
	let b:original_file = $VIMWORKSPACE . '/' . expand('%:t')
elseif expand('%:p') == g:vimpyter_view_directory
	let b:proxy_file = $VIMWORKSPACE . '/' . expand('%:t')
	let b:original_file = expand('%:p')
endif

let b:clean_temp = ['.ipynb_checkpoints']
autocmd! BufWinLeave *.ipynb call init#clean#main(b:clean_temp)

nnoremap <buffer> gs :VimpyterStartJupyter<CR>
nnoremap <buffer> gS :VimpyterStartNteract<CR>
nnoremap <buffer> <LocalLeader>g :split $HOME/.jupyter/jupyter_notebook_config.py<CR>
nnoremap <buffer> <LocalLeader>o o<Esc>:VimpyterInsertPythonBlock<CR>i
nnoremap <buffer> <LocalLeader>p :silent !jupyter nbconvert % --to python<CR>

