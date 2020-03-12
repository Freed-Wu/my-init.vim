function! init#fuzzymotion#main(...) abort "{{{
	return extend(copy({
				\   'converters': [
				\ incsearch#config#fuzzy#converter(),
				\ incsearch#config#fuzzyspell#converter()
				\ ],
				\ 'modules': [incsearch#config#easymotion#module()],
				\ 'keymap': {"\<CR>": '<Over>(easymotion)'},
				\ 'is_expr': 0,
				\ 'is_stay': 1
				\ }),
				\ get(a:, 1, {}))
endfunction "}}}

