function! init#which_key#main() "{{{
	" <Leader> {{{ "
	let g:which_key_map_leader = extend(g:which_key_map_leader, {
				\ 'name': "choose a key about global map",
				\ ' ':{
				\ 'name': '+motion',
				\ },
				\ 'a':{
				\ 'name': '+ale',
				\ },
				\ 'c':{
				\ 'name':'+NERDCommentor',
				\ },
				\ 'd':{
				\ 'name': "+draw",
				\ },
				\ 'e':{
				\ 'name': "+vim-template",
				\ },
				\ 'f':{
				\ 'name': '+leaderf',
				\ },
				\ 'g':{
				\ 'name': '+git',
				\ },
				\ 'h':{
				\ 'name': '+shell',
				\ },
				\ 'i':{
				\ 'name': "+VisIncr",
				\ },
				\ 'j':{
				\ 'name': '+jump',
				\ },
				\ 'k':{
				\ 'name': '+keymap',
				\ },
				\ 'l':{
				\ 'name': '+location',
				\ },
				\ 'm':{
				\ 'name': "+vim-visual-multi",
				\ },
				\ 'n':{
				\ 'name': '+Ultisnips',
				\ 'u': 'Ultisnips',
				\ 's': 'SnippetMates',
				\ },
				\ 'o':{
				\ 'name': '+option',
				\ },
				\ 'p':{
				\ 'name': "+plugin",
				\ },
				\ 'q':{
				\ 'name': '+quickui',
				\ },
				\ 'r':{
				\ 'name': '+replace',
				\ 'r': "+substitute",
				\ 'c': "+count",
				\ 'd': "delete empty lines",
				\ '/': '\→/',
				\ '?': '/→\',
				\ '<Tab>': '\→\\',
				\ '|': '\\→\',
				\ 's': ' →',
				\ },
				\ 's':{
				\ 'name': "+vim-startify&vim-splash",
				\ },
				\ 't':{
				\ 'name': "+vim-translator",
				\ },
				\ 'u':{
				\ 'name': '+ui',
				\ },
				\ 'v':{
				\ 'name': '+vim',
				\ },
				\ 'w':{
				\ 'name': "+vimwiki",
				\ },
				\ 'x':{
				\ 'name': "+doxygen",
				\ },
				\ 'y':{
				\ 'name': "+happy",
				\ },
				\ 'z':{
				\ 'name': '+language',
				\ },
				\ })
	call which_key#register('<Space>', "g:which_key_map_leader")
	" }}} <Leader> "
	" <LocalLeader> {{{ "
	call which_key#register(g:maplocalleader, (exists('b:which_key_map_localleader')?'b':'g').':which_key_map_localleader')
	autocmd FileType * call which_key#register(g:maplocalleader, (exists('b:which_key_map_localleader')?'b':'g').':which_key_map_localleader')
	" }}} <LocalLeader> "
	" z {{{ "
	let g:which_key_map_z = {
				\ 'name': "choose a key about fold&wrap&spell",
				\ 'u':{
				\ 'name': '+spell',
				\ },
				\ }
	call which_key#register('z', "g:which_key_map_z")
	" }}} z "
	" g {{{ "
	let g:which_key_map_g = {
				\ 'name': "choose a key about go&get",
				\ }
	call which_key#register('g', "g:which_key_map_g")
	" }}} g "
	" [ {{{ "
	let g:which_key_map_leftbracket = {
				\ 'name': "choose a key about moveFoward",
				\ 'o':{
				\ 'name': "+options on",
				\ 'b': "background",
				\ 'c': "cursorline",
				\ 'd': "diff",
				\ 'h': "hlsearch",
				\ 'i': "ignorecase",
				\ 'l': "list",
				\ 'n': "number",
				\ 'r': "relativenumber",
				\ 's': "spell",
				\ 'u': "cursorcolumn",
				\ 'v': "virtualedit",
				\ 'p': "paste",
				\ 'w': "wrap",
				\ 'x': "cursorline&cursorcolumn",
				\ },
				\ }
	call which_key#register('[', "g:which_key_map_leftbracket")
	" }}} [ "
	" ] {{{ "
	let g:which_key_map_rightbracket = {
				\ 'name': "choose a key about moveBackword",
				\ 'o':{
				\ 'name': "+options off",
				\ 'b': "background",
				\ 'c': "cursorline",
				\ 'd': "diff",
				\ 'h': "hlsearch",
				\ 'i': "ignorecase",
				\ 'l': "list",
				\ 'n': "number",
				\ 'r': "relativenumber",
				\ 's': "spell",
				\ 'u': "cursorcolumn",
				\ 'v': "virtualedit",
				\ 'p': "paste",
				\ 'w': "wrap",
				\ 'x': "cursorline&cursorcolumn",
				\ },
				\ }
	call which_key#register(']', "g:which_key_map_rightbracket")
	" }}} ] "
	" <lt>C-w> {{{ "
	let g:which_key_map_C_w = {
				\ 'name': "choose a key about window",
				\ 'g':{
				\ 'name': '+go',
				\ },
				\ }
	call which_key#register('<C-w>', "g:which_key_map_C_w")
	" }}} <lt>C-w> "
	" yo {{{ "
	augroup init_yoMap "{{{
		autocmd!
		autocmd SourcePre unimpaired.vim call init#unimpaired#main()
	augroup END "}}}
	let g:which_key_map_y_o = {
				\ 'name': "choose a key about toggle options",
				\ 'b': "background",
				\ 'c': "cursorline",
				\ 'd': "diff",
				\ 'h': "hlsearch",
				\ 'i': "ignorecase",
				\ 'l': "list",
				\ 'n': "number",
				\ 'r': "relativenumber",
				\ 's': "spell",
				\ 'u': "cursorcolumn",
				\ 'v': "virtualedit",
				\ 'p': "paste",
				\ 'w': "wrap",
				\ 'x': "cursorline&cursorcolumn",
				\ }
	call which_key#register('yo', "g:which_key_map_y_o")
	" }}} yo "
	" i {{{ "
	let g:which_key_map_i = {
				\ 'name': "choose a key about inner text object",
				\ 'T':{
				\ 'name': "+vim-textobj-datetime",
				\ },
				\ 'j':{
				\ 'name': "+vim-textobj-jabraces",
				\ },
				\ }
	call which_key#register('i', "g:which_key_map_i")
	" }}} i "
	" a {{{ "
	let g:which_key_map_a = {
				\ 'name': "choose a key about around text object",
				\ 'T':{
				\ 'name': "+vim-textobj-datetime",
				\ },
				\ 'j':{
				\ 'name': "+vim-textobj-jabraces",
				\ },
				\ }
	call which_key#register('a', "g:which_key_map_a")
	" }}} i "
	" I {{{ "
	let g:which_key_map_I = {
				\ 'name': "choose a key about Inner text object",
				\ }
	call which_key#register('I', "g:which_key_map_I")
	" }}} I "
	" A {{{ "
	let g:which_key_map_A = {
				\ 'name': "choose a key about Around text object",
				\ }
	call which_key#register('A', "g:which_key_map_A")
	" }}} I "
	call which_key#register('.', "g:which_key_map_startify_dot")
endfunction "}}}
