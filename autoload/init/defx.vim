let s:gui_colors = extend({
			\ 'brown': '905532',
			\ 'aqua': '3AFFDB',
			\ 'blue': '689FB6',
			\ 'darkBlue': '44788E',
			\ 'purple': '834F79',
			\ 'lightPurple': '834F79',
			\ 'red': 'AE403F',
			\ 'beige': 'F5C06F',
			\ 'yellow': 'F09F17',
			\ 'orange': 'D4843E',
			\ 'darkOrange': 'F16529',
			\ 'pink': 'CB6F6F',
			\ 'salmon': 'EE6E73',
			\ 'green': '8FAA54',
			\ 'lightGreen': '31B53E',
			\ 'white': 'FFFFFF',
			\ }, get(g:, 'defx_icons_gui_colors', {}))
let s:term_colors = extend({
			\ 'brown'       : 130,
			\ 'aqua'        : 66,
			\ 'blue'        : 67,
			\ 'darkBlue'    : 57,
			\ 'purple'      : 60,
			\ 'lightPurple' : 103,
			\ 'red'         : 131,
			\ 'beige'       : 137,
			\ 'yellow'      : 229,
			\ 'orange'      : 208,
			\ 'darkOrange'  : 166,
			\ 'pink'        : 205,
			\ 'salmon'      : 209,
			\ 'green'       : 65,
			\ 'lightGreen'  : 108,
			\ 'white'       : 231,
			\ }, get(g: ,'defx_icons_term_colors', {}))
let s:default_color = synIDattr(hlID('Normal'), 'fg')
function! init#defx#main() "{{{
	call defx#custom#option('_', {
				\ 'winwidth': &columns / 4,
				\ 'split': 'vertical',
				\ 'direction': 'topleft',
				\ 'show_ignored_files': 0,
				\ 'buffer_name': '',
				\ 'new': 1,
				\ 'resume': 1,
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

