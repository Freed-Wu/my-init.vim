scriptencoding utf-8

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
endfunction "}}}

