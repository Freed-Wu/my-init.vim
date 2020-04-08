function! dot#map#main() "{{{
	if exists('$GRAPHVIZHELP')
		execute 'nnoremap <buffer> <LocalLeader>lf :<C-u>Leaderf file '.$GRAPHVIZHELP.' --input=.html<CR>'
	elseif has('unix')
		nnoremap <buffer> <LocalLeader>lf :<C-u>Leaderf file /usr/share/doc/graphviz-2.42.3/html/info --input=.html<CR>
	elseif has('win32')
		nnoremap <buffer> <LocalLeader>lf :<C-u>Leaderf file C:/Program\ files/graphviz/doc/graphviz-2.42.3/html/info --input=.html<CR>
	endif
endfunction "}}}

