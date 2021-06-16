scriptencoding utf-8
function! init#smartinput#main() "{{{
	inoremap <expr><C-p> pumvisible()?"\<C-p>": "\<Up>"
	inoremap <expr><C-n> pumvisible()?"\<C-n>": "\<Down>"
	inoremap <expr><Tab> pumvisible()?"\<C-y>": "\<Tab>"
	inoremap <expr><S-Tab> pumvisible()?"\<C-e>": "\<S-Tab>"
	inoremap <C-j> <C-e>
	inoremap <C-l> <C-y>
	inoremap <silent><expr> <TAB>
				\ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
				\ "\<TAB>" . coc#refresh()
	" readline
	inoremap <C-s> <C-o>/
	inoremap <C-_> <C-o>u
	inoremap <M-a> <C-o>(
	inoremap <M-e> <C-o>)
	" zle
	inoremap <M-m> <C-o>^
	inoremap <M-x> <C-o>:
	inoremap <M-s> <C-g>u<Esc>[s1z=`]a<C-g>u
	inoremap <M-Bar> <C-o><Bar>
	inoremap <M-?> <C-o>?
	inoremap <M-h> <C-o>K
	inoremap <M-<> <C-o>gg
	inoremap <M->> <C-o>G
	imap <M-'> <C-o>val'
	imap <M-"> <C-o>viw'
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
				\ 'filetype': ['sh', 'bash', 'fish', 'zsh', 'ksh', 'csh', 'tcsh', 'ps1', 'dosbatch', 'html', 'xml', 'xhtml', 'fstab', 'dot', 'tex', 'plaintex', 'context', 'tmux'],
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
				\ 'filetype': ['ruby', 'markdown', 'pandoc'],
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
	call smartinput#map_to_trigger('i', '==', '==', '==')
	call smartinput#define_rule({
				\ 'at': '\%#',
				\ 'char': '==',
				\ 'input': '==',
				\ 'filetype': ['tmux'],
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
				\ 'filetype': ['vim', 'html', 'xml', 'xhtml', 'dot', 'pandoc', 'markdown', 'gfimarkdown', 'liquid', 'txt', 'text', 'tex', 'plaintex', 'context'],
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
				\ 'filetype': ['vim', 'html', 'xml', 'xhtml', 'liquid', 'txt', 'text'],
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
				\ 'filetype': ['c', 'cpp', 'julia'],
				\ })
	call smartinput#define_rule({
				\ 'at': '\%#',
				\ 'char': '?',
				\ 'input': '? ',
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
				\ 'filetype': ['csv', 'json', 'muttrc', 'fstab'],
				\ })
	call smartinput#map_to_trigger('i', '..', '..', '..')
	call smartinput#define_rule({
				\ 'at': '\%#',
				\ 'char': '..',
				\ 'input': ' . ',
				\ 'filetype': ['vim'],
				\ })
	call smartinput#map_to_trigger('i', '..=', '..=', '..=')
	call smartinput#define_rule({
				\ 'at': '\%#',
				\ 'char': '..=',
				\ 'input': ' ..= ',
				\ })
	call smartinput#map_to_trigger('i', '=<<', '=<<', '=<<')
	call smartinput#define_rule({
				\ 'at': '\%#',
				\ 'char': '=<<',
				\ 'input': ' =<< ',
				\ })
	call smartinput#map_to_trigger('i', ':', ':', ':')
	call smartinput#define_rule({
				\ 'at': '\%#',
				\ 'char': ':',
				\ 'input': ': ',
				\ 'filetype': ['text', 'txt', 'json', 'python'],
				\ })
	" }}} text "
	" tex {{{ "
	call smartinput#map_to_trigger('i', '$', '$', '$')
	call smartinput#define_rule({
				\ 'at': '\%#',
				\ 'char': '$',
				\ 'input': '$$<Left>',
				\ 'filetype': ['tex', 'plaintex', 'context', 'pandoc', 'markdown', 'gfimarkdown', 'csv', 'octave', 'matlab'],
				\ })
	call smartinput#map_to_trigger('i', '$$', '$$', '$$')
	call smartinput#define_rule({
				\ 'at': '\%#',
				\ 'char': '$$',
				\ 'input': '$$$$<Left><Left>',
				\ 'filetype': ['tex', 'plaintex', 'context', 'pandoc', 'markdown', 'gfimarkdown'],
				\ })
	call smartinput#map_to_trigger('i', '<bar>-', '<bar>-', '<bar>-')
	call smartinput#define_rule({
				\ 'at': '\%#',
				\ 'char': '<bar>-',
				\ 'input': ' <bar>- ',
				\ 'filetype': ['tex', 'plaintex', 'context'],
				\ })
	call smartinput#map_to_trigger('i', '-<bar>', '-<bar>', '-<bar>')
	call smartinput#define_rule({
				\ 'at': '\%#',
				\ 'char': '-<bar>',
				\ 'input': ' -<bar> ',
				\ 'filetype': ['tex', 'plaintex', 'context'],
				\ })
	call smartinput#map_to_trigger('i', '--', '--', '--')
	call smartinput#define_rule({
				\ 'at': '\%#',
				\ 'char': '--',
				\ 'input': ' -- ',
				\ 'filetype': ['tex', 'plaintex', 'context'],
				\ })
	" }}} tex "
endfunction "}}}
