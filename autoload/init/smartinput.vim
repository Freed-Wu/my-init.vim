scriptencoding utf-8
function! init#smartinput#main() "{{{
	inoremap <expr><C-p> pumvisible()?"\<C-p>": "\<Up>"
	inoremap <expr><C-n> pumvisible()?"\<C-n>": "\<Down>"
	inoremap <C-j> <C-e>
	inoremap <C-l> <C-y>
	inoremap <C-\> <C-k>
	inoremap <C-q> <End><C-u>
	inoremap <C-s> <C-o>/
	inoremap <C-_> <C-o>u
	inoremap <M-h> <C-o>K
	inoremap <M-s> <C-g>u<Esc>[s1z=`]a<C-g>u
	inoremap <M-g> <Home><C-o>y<End>
	inoremap <M-a> <End><CR>
	inoremap <M-e> <Up><End><CR>
	inoremap <silent><expr> <TAB>
				\ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
				\ "\<TAB>" . coc#refresh()
	if !exists('$WINDOWID')
		inoremap ：： ；
	endif
	call smartinput#map_to_trigger('i', '（', '（', '（')
	call smartinput#define_rule({
				\ 'at': '\%#',
				\ 'char': '（',
				\ 'input': '（）<Left>',
				\ })
	call smartinput#map_to_trigger('i', '《', '《', '《')
	call smartinput#define_rule({
				\ 'at': '\%#',
				\ 'char': '《',
				\ 'input': '《》<Left>',
				\ })
	call smartinput#map_to_trigger('i', '【', '【', '【')
	call smartinput#define_rule({
				\ 'at': '\%#',
				\ 'char': '【',
				\ 'input': '【】<Left>',
				\ })
	call smartinput#map_to_trigger('i', '‘', '‘', '‘')
	call smartinput#define_rule({
				\ 'at': '\%#',
				\ 'char': '‘',
				\ 'input': '‘’<Left>',
				\ })
	call smartinput#map_to_trigger('i', '“', '“', '“')
	call smartinput#define_rule({
				\ 'at': '\%#',
				\ 'char': '“',
				\ 'input': '“”<Left>',
				\ })

	call smartinput#map_to_trigger('i', '(', '(', '(')
	call smartinput#define_rule({
				\ 'at': '\%#',
				\ 'char': '(',
				\ 'input': ' ()<Left>',
				\ 'filetype': ['text', 'txt'],
				\ })
	" c {{{ "
	call smartinput#map_to_trigger('i', '=', '=', '=')
	call smartinput#define_rule({
				\ 'at': '\%#',
				\ 'char': '=',
				\ 'input': ' = ',
				\ })
	call smartinput#define_rule({
				\ 'at': '\%#',
				\ 'char': '=',
				\ 'input': '=',
				\ 'filetype': ['sh', 'bash', 'fish', 'zsh', 'ksh', 'csh', 'tcsh', 'ps1', 'dosbatch'],
				\ })
	call smartinput#map_to_trigger('i', '<<', '<<', '<<')
	call smartinput#define_rule({
				\ 'at': '\%#',
				\ 'char': '<<',
				\ 'input': ' << ',
				\ })
	call smartinput#map_to_trigger('i', '>>', '>>', '>>')
	call smartinput#define_rule({
				\ 'at': '\%#',
				\ 'char': '>>',
				\ 'input': ' >> ',
				\ })
	call smartinput#map_to_trigger('i', '+', '+', '+')
	call smartinput#define_rule({
				\ 'at': '\%#',
				\ 'char': '+',
				\ 'input': ' + ',
				\ })
	call smartinput#define_rule({
				\ 'at': '\%#',
				\ 'char': '+',
				\ 'input': '+ ',
				\ 'filetype': ['spice'],
				\ })
	call smartinput#map_to_trigger('i', '++', '++', '++')
	call smartinput#define_rule({
				\ 'at': '\%#',
				\ 'char': '++',
				\ 'input': '++',
				\ })
	call smartinput#map_to_trigger('i', '+-', '+-', '+-')
	call smartinput#define_rule({
				\ 'at': '\%#',
				\ 'char': '+-',
				\ 'input': '+-',
				\ })
	call smartinput#map_to_trigger('i', '+=', '+=', '+=')
	call smartinput#define_rule({
				\ 'at': '\%#',
				\ 'char': '+=',
				\ 'input': ' += ',
				\ })
	call smartinput#define_rule({
				\ 'at': '\%#',
				\ 'char': '+=',
				\ 'input': '+=',
				\ 'filetype': ['zsh'],
				\ })
	call smartinput#map_to_trigger('i', '-=', '-=', '-=')
	call smartinput#define_rule({
				\ 'at': '\%#',
				\ 'char': '-=',
				\ 'input': ' -= ',
				\ })
	call smartinput#define_rule({
				\ 'at': '\%#',
				\ 'char': '-=',
				\ 'input': '-=',
				\ 'filetype': ['zsh'],
				\ })
	call smartinput#map_to_trigger('i', '*=', '*=', '*=')
	call smartinput#define_rule({
				\ 'at': '\%#',
				\ 'char': '*=',
				\ 'input': ' *= ',
				\ })
	call smartinput#map_to_trigger('i', '/=', '/=', '/=')
	call smartinput#define_rule({
				\ 'at': '\%#',
				\ 'char': '/=',
				\ 'input': ' /= ',
				\ })
	call smartinput#define_rule({
				\ 'at': '\%#',
				\ 'char': '*=',
				\ 'input': '*=',
				\ 'filetype': ['zsh'],
				\ })
	call smartinput#map_to_trigger('i', '&=', '&=', '&=')
	call smartinput#define_rule({
				\ 'at': '\%#',
				\ 'char': '&=',
				\ 'input': ' &= ',
				\ })
	call smartinput#define_rule({
				\ 'at': '\%#',
				\ 'char': '&=',
				\ 'input': '&=',
				\ 'filetype': ['zsh'],
				\ })
	call smartinput#map_to_trigger('i', '<Bar>=', '<Bar>=', '<Bar>=')
	call smartinput#define_rule({
				\ 'at': '\%#',
				\ 'char': '<Bar>=',
				\ 'input': ' <Bar>= ',
				\ })
	call smartinput#define_rule({
				\ 'at': '\%#',
				\ 'char': '<Bar>=',
				\ 'input': '<Bar>=',
				\ 'filetype': ['zsh'],
				\ })
	call smartinput#map_to_trigger('i', '^=', '^=', '^=')
	call smartinput#define_rule({
				\ 'at': '\%#',
				\ 'char': '^=',
				\ 'input': ' ^= ',
				\ })
	call smartinput#define_rule({
				\ 'at': '\%#',
				\ 'char': '^=',
				\ 'input': '^=',
				\ 'filetype': ['zsh'],
				\ })
	call smartinput#map_to_trigger('i', '&&', '&&', '&&')
	call smartinput#define_rule({
				\ 'at': '\%#',
				\ 'char': '&&',
				\ 'input': ' && ',
				\ })
	call smartinput#map_to_trigger('i', '^', '^', '^')
	call smartinput#define_rule({
				\ 'at': '\%#',
				\ 'char': '^',
				\ 'input': ' ^ ',
				\ 'filetype': ['c', 'cpp', 'cs', 'java', 'objc', 'objcpp', 'arduino', 'julia', 'python'],
				\ })
	call smartinput#map_to_trigger('i', '^^', '^^', '^^')
	call smartinput#define_rule({
				\ 'at': '\%#',
				\ 'char': '^^',
				\ 'input': ' ^^ ',
				\ })
	call smartinput#map_to_trigger('i', '<Bar>', '<Bar>', '<Bar>')
	call smartinput#define_rule({
				\ 'at': '\%#',
				\ 'char': '<Bar>',
				\ 'input': ' <Bar> ',
				\ })
	call smartinput#define_rule({
				\ 'at': '\%#',
				\ 'char': '<Bar>',
				\ 'input': '<Bar>',
				\ 'filetype': ['tex', 'plaintex', 'context'],
				\ })
	call smartinput#define_rule({
				\ 'at': '\%#',
				\ 'char': '<Bar>',
				\ 'input': '<Bar><Bar><Left>',
				\ 'filetype': ['ruby'],
				\ })
	call smartinput#map_to_trigger('i', '<Bar><Bar>', '<Bar><Bar>', '<Bar><Bar>')
	call smartinput#define_rule({
				\ 'at': '\%#',
				\ 'char': '<Bar><Bar>',
				\ 'input': ' <Bar><Bar> ',
				\ })
	call smartinput#map_to_trigger('i', '%=', '%=', '%=')
	call smartinput#define_rule({
				\ 'at': '\%#',
				\ 'char': '%=',
				\ 'input': ' %= ',
				\ 'filetype': ['c', 'julia', 'python', 'vim'],
				\ })
	call smartinput#map_to_trigger('i', '/*', '/*', '/*')
	call smartinput#define_rule({
				\ 'at': '\%#',
				\ 'char': '/*',
				\ 'input': ' /* ',
				\ })
	call smartinput#define_rule({
				\ 'at': '\%#',
				\ 'char': '/*',
				\ 'input': '/*',
				\ 'filetype': ['gitignore'],
				\ })
	call smartinput#map_to_trigger('i', '*/', '*/', '*/')
	call smartinput#define_rule({
				\ 'at': '\%#',
				\ 'char': '*/',
				\ 'input': ' */ ',
				\ })
	call smartinput#define_rule({
				\ 'at': '\%#',
				\ 'char': '*/',
				\ 'input': '*/',
				\ 'filetype': ['gitignore'],
				\ })
	" }}} c "
	" ruby {{{ "
	call smartinput#map_to_trigger('i', '#', '#', '#')
	call smartinput#define_rule({
				\   'at': '\%#',
				\   'char': '#',
				\   'input': '#{}<Left>',
				\   'filetype': ['ruby'],
				\   'syntax': ['Constant', 'Special'],
				\ })
	" }}} ruby "
	" octave {{{ "
	call smartinput#map_to_trigger('i', '~=', '~=', '~=')
	call smartinput#define_rule({
				\ 'at': '\%#',
				\ 'char': '~=',
				\ 'input': ' ~= ',
				\ })
	" }}} octave "
	" vim {{{ "
	call smartinput#map_to_trigger('i', '==', '==', '==')
	call smartinput#define_rule({
				\ 'at': '\%#',
				\ 'char': '==',
				\ 'input': ' == ',
				\ })
	call smartinput#map_to_trigger('i', '!=', '!=', '!=')
	call smartinput#define_rule({
				\ 'at': '\%#',
				\ 'char': '!=',
				\ 'input': ' != ',
				\ })
	call smartinput#map_to_trigger('i', '<', '<', '<')
	call smartinput#define_rule({
				\ 'at': '\%#',
				\ 'char': '<',
				\ 'input': ' < ',
				\ })
	call smartinput#define_rule({
				\ 'at': '\%#',
				\ 'char': '<',
				\ 'input': '<lt>><Left>',
				\ 'filetype': ['vim', 'html', 'xhtml', 'pandoc', 'markdown', 'gfimarkdown', 'liquid', 'txt', 'text', 'tex', 'plaintex', 'context'],
				\ })
	call smartinput#map_to_trigger('i', '>', '>', '>')
	call smartinput#define_rule({
				\ 'at': '\%#',
				\ 'char': '>',
				\ 'input': ' > ',
				\ })
	call smartinput#define_rule({
				\ 'at': '\%#',
				\ 'char': '>',
				\ 'input': '><CR><C-u><CR><lt><Up><Tab>',
				\ 'filetype': ['help'],
				\ })
	call smartinput#define_rule({
				\ 'at': '\%#',
				\ 'char': '>',
				\ 'input': '>',
				\ 'filetype': ['vim', 'html', 'xhtml', 'liquid', 'txt', 'text'],
				\ })
	call smartinput#define_rule({
				\ 'at': '\%#',
				\ 'char': '>',
				\ 'input': '> ',
				\ 'filetype': ['pandoc', 'markdown', 'gfimarkdown'],
				\ })
	call smartinput#map_to_trigger('i', '>=', '>=', '>=')
	call smartinput#define_rule({
				\ 'at': '\%#',
				\ 'char': '>=',
				\ 'input': ' >= ',
				\ })
	call smartinput#map_to_trigger('i', '<=', '<=', '<=')
	call smartinput#define_rule({
				\ 'at': '\%#',
				\ 'char': '<=',
				\ 'input': ' <= ',
				\ })
	call smartinput#define_rule({
				\ 'at': '\%#',
				\ 'char': '<=',
				\ 'input': '<=',
				\ 'filetype': ['vim'],
				\ })
	call smartinput#map_to_trigger('i', '=~', '=~', '=~')
	call smartinput#define_rule({
				\ 'at': '\%#',
				\ 'char': '=~',
				\ 'input': ' =~ ',
				\ })
	call smartinput#map_to_trigger('i', '!~', '!~', '!~')
	call smartinput#define_rule({
				\ 'at': '\%#',
				\ 'char': '!~',
				\ 'input': ' !~ ',
				\ })
	call smartinput#map_to_trigger('i', '==#', '==#', '==#')
	call smartinput#define_rule({
				\ 'at': '\%#',
				\ 'char': '==#',
				\ 'input': ' ==# ',
				\ })
	call smartinput#map_to_trigger('i', '!=#', '!=#', '!=#')
	call smartinput#define_rule({
				\ 'at': '\%#',
				\ 'char': '!=#',
				\ 'input': ' !=# ',
				\ })
	call smartinput#map_to_trigger('i', '<#', '<#', '<#')
	call smartinput#define_rule({
				\ 'at': '\%#',
				\ 'char': '<#',
				\ 'input': ' <# ',
				\ })
	call smartinput#map_to_trigger('i', '>#', '>#', '>#')
	call smartinput#define_rule({
				\ 'at': '\%#',
				\ 'char': '>#',
				\ 'input': ' ># ',
				\ })
	call smartinput#map_to_trigger('i', '>=#', '>=#', '>=#')
	call smartinput#define_rule({
				\ 'at': '\%#',
				\ 'char': '>=#',
				\ 'input': ' >=# ',
				\ })
	call smartinput#map_to_trigger('i', '<=#', '<=#', '<=#')
	call smartinput#define_rule({
				\ 'at': '\%#',
				\ 'char': '<=#',
				\ 'input': ' <=# ',
				\ })
	call smartinput#map_to_trigger('i', '=~#', '=~#', '=~#')
	call smartinput#define_rule({
				\ 'at': '\%#',
				\ 'char': '=~#',
				\ 'input': ' =~# ',
				\ })
	call smartinput#map_to_trigger('i', '!~#', '!~#', '!~#')
	call smartinput#define_rule({
				\ 'at': '\%#',
				\ 'char': '!~#',
				\ 'input': ' !~# ',
				\ })
	call smartinput#map_to_trigger('i', '==?', '==?', '==?')
	call smartinput#define_rule({
				\ 'at': '\%#',
				\ 'char': '==?',
				\ 'input': ' ==? ',
				\ })
	call smartinput#map_to_trigger('i', '!=?', '!=?', '!=?')
	call smartinput#define_rule({
				\ 'at': '\%#',
				\ 'char': '!=?',
				\ 'input': ' !=? ',
				\ })
	call smartinput#map_to_trigger('i', '<?', '<?', '<?')
	call smartinput#define_rule({
				\ 'at': '\%#',
				\ 'char': '<?',
				\ 'input': ' <? ',
				\ })
	call smartinput#map_to_trigger('i', '>?', '>?', '>?')
	call smartinput#define_rule({
				\ 'at': '\%#',
				\ 'char': '>?',
				\ 'input': ' >? ',
				\ })
	call smartinput#map_to_trigger('i', '>=?', '>=?', '>=?')
	call smartinput#define_rule({
				\ 'at': '\%#',
				\ 'char': '>=?',
				\ 'input': ' >=? ',
				\ })
	call smartinput#map_to_trigger('i', '<=?', '<=?', '<=?')
	call smartinput#define_rule({
				\ 'at': '\%#',
				\ 'char': '<=?',
				\ 'input': ' <=? ',
				\ })
	call smartinput#map_to_trigger('i', '=~?', '=~?', '=~?')
	call smartinput#define_rule({
				\ 'at': '\%#',
				\ 'char': '=~?',
				\ 'input': ' =~? ',
				\ })
	call smartinput#map_to_trigger('i', '!~?', '!~?', '!~?')
	call smartinput#define_rule({
				\ 'at': '\%#',
				\ 'char': '!~?',
				\ 'input': ' !~? ',
				\ })
	" }}} vim "
	" r {{{ "
	call smartinput#map_to_trigger('i', '<-', '<-', '<-')
	call smartinput#define_rule({
				\ 'at': '\%#',
				\ 'char': '<-',
				\ 'input': ' <- ',
				\ })
	" }}} r "
	" julia {{{ "
	call smartinput#map_to_trigger('i', '->', '->', '->')
	call smartinput#define_rule({
				\ 'at': '\%#',
				\ 'char': '->',
				\ 'input': ' -> ',
				\ })
	call smartinput#map_to_trigger('i', '=>', '=>', '=>')
	call smartinput#define_rule({
				\ 'at': '\%#',
				\ 'char': '=>',
				\ 'input': ' => ',
				\ })
	" }}} julia "
	" text {{{ "
	call smartinput#map_to_trigger('i', '!', '!', '!')
	call smartinput#define_rule({
				\ 'at': '\%#',
				\ 'char': '!',
				\ 'input': '! ',
				\ 'filetype': ['text', 'txt'],
				\ })
	call smartinput#map_to_trigger('i', '?', '?', '?')
	call smartinput#define_rule({
				\ 'at': '\%#',
				\ 'char': '?',
				\ 'input': ' ?  : <Left><Left><Left>',
				\ })
	call smartinput#define_rule({
				\ 'at': '\%#',
				\ 'char': '?',
				\ 'input': '? ',
				\ 'filetype': ['tex', 'plaintex', 'context', 'text', 'txt'],
				\ })
	call smartinput#define_rule({
				\ 'at': '\%#',
				\ 'char': '?',
				\ 'input': ' ? ',
				\ 'filetype': ['cs'],
				\ })
	call smartinput#map_to_trigger('i', ',', ',', ',')
	call smartinput#define_rule({
				\ 'at': '\%#',
				\ 'char': ',',
				\ 'input': ', ',
				\ })
	call smartinput#define_rule({
				\ 'at': '\%#',
				\ 'char': ',',
				\ 'input': ',',
				\ 'filetype': ['csv', 'json', 'muttrc'],
				\ })
	call smartinput#map_to_trigger('i', '.', '.', '.')
	call smartinput#define_rule({
				\ 'at': '\%#',
				\ 'char': '.',
				\ 'input': ' . ',
				\ 'filetype': ['vim'],
				\ })
	call smartinput#map_to_trigger('i', '..', '..', '..')
	call smartinput#define_rule({
				\ 'at': '\%#',
				\ 'char': '..',
				\ 'input': '..',
				\ })
	call smartinput#map_to_trigger('i', '...', '...', '...')
	call smartinput#define_rule({
				\ 'at': '\%#',
				\ 'char': '...',
				\ 'input': ' ... ',
				\ })
	call smartinput#map_to_trigger('i', ':', ':', ':')
	call smartinput#define_rule({
				\ 'at': '\%#',
				\ 'char': ':',
				\ 'input': ': ',
				\ 'filetype': ['text', 'txt', 'json'],
				\ })
	" }}} text "
	" tex {{{ "
	call smartinput#map_to_trigger('i', '$', '$', '$')
	call smartinput#define_rule({
				\ 'at': '\%#',
				\ 'char': '$',
				\ 'input': '$$<Left>',
				\ 'filetype': ['tex', 'plaintex', 'context', 'pandoc', 'markdown', 'gfimarkdown', 'csv'],
				\ })
	call smartinput#map_to_trigger('i', '$$', '$$', '$$')
	call smartinput#define_rule({
				\ 'at': '\%#',
				\ 'char': '$$',
				\ 'input': '$$$$<Left><Left>',
				\ 'filetype': ['tex', 'plaintex', 'context', 'pandoc', 'markdown', 'gfimarkdown'],
				\ })
	" }}} tex "
endfunction "}}}
