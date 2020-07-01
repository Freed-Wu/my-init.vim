setlocal concealcursor=
setlocal path+=$XDG_CONFIG_HOME/coc/extensions/node_modules
if expand('%:t') ==# 'package.json'
	nnoremap <buffer> gd :<C-u>execute 'edit  ' . split(glob($XDG_CONFIG_HOME . '/coc/extensions/node_modules/' . expand('<cfile>') . '/R*.md'))[0]<CR>
	nnoremap <buffer> <C-w>d :<C-u>execute 'split  ' . split(glob($XDG_CONFIG_HOME . '/coc/extensions/node_modules/' . expand('<cfile>') . '/R*.md'))[0]<CR>
endif
