setlocal concealcursor=
setlocal path+=$XDG_CONFIG_HOME/coc/extensions/node_modules
if expand('%:t') ==# 'package.json'
	nnoremap <buffer> gd :<C-u>execute 'edit  ' . glob($XDG_CONFIG_HOME . '/coc/extensions/node_modules/' . expand('<cfile>') . '/R*.md', 0, 1)[0]<CR>
	nnoremap <buffer> <C-w>d :<C-u>execute 'split  ' . glob($XDG_CONFIG_HOME . '/coc/extensions/node_modules/' . expand('<cfile>') . '/R*.md', 0, 1)[0]<CR>
endif
