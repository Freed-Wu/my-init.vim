scriptencoding utf-8
let s:default_color = synIDattr(hlID('Normal'), 'fg')
if empty(s:default_color)
	let s:default_color = 'white'
endif
let g:defx_icons_extensions = map(copy(g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols), {_, v -> {'icon': v, 'color': s:default_color, 'term_color': s:default_color}})
let g:defx_icons_pattern_matches = map(copy(g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols), {_, v -> {'icon': v, 'color': s:default_color, 'term_color': s:default_color}})

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
endfunction "}}}
