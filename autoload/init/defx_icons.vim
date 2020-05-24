let s:default_color = synIDattr(hlID('Normal'), 'fg')
if s:default_color ==# ''
	let s:default_color = 'white'
endif
function! init#defx_icons#main() "{{{
	let g:defx_icons_extensions = {}
	for [l:key, l:value] in items(g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols)
		execute('let g:defx_icons_extensions["' . l:key .'"] = {"icon": l:value, "color": s:default_color, "term_color": s:default_color}')
	endfor
	let g:defx_icons_pattern_matches = {}
	for [l:key, l:value] in items(g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols)
		execute('let g:defx_icons_pattern_matches["' . l:key .'"] = {"icon": l:value, "color": s:default_color, "term_color": s:default_color}')
	endfor
endfunction "}}}
