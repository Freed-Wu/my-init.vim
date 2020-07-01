scriptencoding utf-8
let s:default_color = synIDattr(hlID('Normal'), 'fg')
if s:default_color ==# ''
	let s:default_color = 'white'
endif

function! init#defx#main() "{{{
	call defx#custom#option('_', {
				\ 'winwidth': &columns / 4,
				\ 'split': 'vertical',
				\ 'direction': 'topleft',
				\ 'show_ignored_files': 0,
				\ 'buffer_name': '',
				\ 'new': 1,
				\ 'resume': 1,
				\ 'auto_cd': 1,
				\ 'session_file': $XDG_CACHE_HOME . '/nvim/defx.txt',
				\ 'columns': 'indent:mark:git:icons:filename:type:size:time',
				\ 'root_marker': ' ',
				\ })
	call defx#custom#column('mark', {
				\ 'readonly_icon': '',
				\ 'selected_icon': '✓',
				\ })
	let g:defx_icons_extensions = {}
	for [l:key, l:value] in items(g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols)
		execute('let g:defx_icons_extensions["' . l:key .'"] = {"icon": l:value, "color": s:default_color, "term_color": s:default_color}')
	endfor
	let g:defx_icons_pattern_matches = {}
	for [l:key, l:value] in items(g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols)
		execute('let g:defx_icons_pattern_matches["' . l:key .'"] = {"icon": l:value, "color": s:default_color, "term_color": s:default_color}')
	endfor
endfunction "}}}

