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
function! init#defx#main() "{{{
	call defx#custom#option('_', {
				\ 'winwidth': g:columns,
				\ 'split': 'vertical',
				\ 'direction': 'topleft',
				\ 'show_ignored_files': 0,
				\ 'buffer_name': '',
				\ 'resume': 1,
				\ 'columns': 'indent:mark:git:icons:filename:type:size:time',
				\ })
	call defx#custom#column('mark', {
				\ 'readonly_icon': '',
				\ 'selected_icon': '✓',
				\ })
	let g:defx_icons_extensions = {}
	for [l:key, l:value] in items(g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols_)
		execute('let g:defx_icons_extensions.' . l:key .'= {"icon": l:value, "color": s:gui_colors.blue, "term_color": s:term_colors.blue}')
	endfor
	"let g:defx_icons_exact_matches
	"let g:defx_icon_pattern_matches
endfunction "}}}

