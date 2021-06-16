function! init#getui#main() abort "{{{
	return join([
				\ get(g:, 'colors_name', 'default'), get(g:, 'airline_theme', ''),
				\ get(g:, 'quickui_color_scheme', ''), get(g:, 'Lf_StlColorscheme', ''),
				\ &guifont], ':')
endfunction "}}}
