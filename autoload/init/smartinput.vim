scriptencoding utf-8
function! init#smartinput#main() "{{{
	inoremap <expr><C-p> pumvisible()?"\<C-p>": "\<Up>"
	inoremap <expr><C-n> pumvisible()?"\<C-n>": "\<Down>"
	inoremap <C-k> <C-o>:set virtualedit +=onemore<CR><C-o>d$<C-o>:set virtualedit -=onemore<CR>
	inoremap <C-j> <C-e>
	inoremap <C-l> <C-y>
	inoremap <C-\> <C-k>
	inoremap <C-]> <C-g>u<Esc>[s1z=`]a<C-g>u
	inoremap <silent><expr> <TAB>
				\ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
				\ init#check_back_space#main() ? "\<TAB>" :
				\ coc#refresh()

	inoremap ：： ；
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
				\ 'input': '+',
				\ 'filetype': ['html', 'xhtml', 'liquid', 'xml'],
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
				\ 'input': ' ++ ',
				\ })
	call smartinput#map_to_trigger('i', '-', '-', '-')
	call smartinput#define_rule({
				\ 'at': '\%#',
				\ 'char': '-',
				\ 'input': ' - ',
				\ })
	call smartinput#define_rule({
				\ 'at': '\%#',
				\ 'char': '-',
				\ 'input': '-',
				\ 'filetype': ['vim', 'muttrc', 'json', 'ebuild', 'gentoo-make-conf', 'gentoo-package-use', 'cmusrc', 'pandoc', 'markdown', 'gfimarkdown', 'gitcommit', 'txt', 'text', 'bib', 'sh', 'bash', 'fish', 'zsh', 'ksh', 'csh', 'tcsh', 'ps1', 'dosbatch', 'gentoo-metadata', 'html', 'xhtml', 'liquid', 'xml', 'spice', 'gitconfig', 'gitignore'],
				\ })
	call smartinput#map_to_trigger('i', '--', '--', '--')
	call smartinput#define_rule({
				\ 'at': '\%#',
				\ 'char': '--',
				\ 'input': ' -- ',
				\ })
	call smartinput#define_rule({
				\ 'at': '\%#',
				\ 'char': '--',
				\ 'input': '--',
				\ 'filetype': ['pandoc', 'markdown', 'gfimarkdown', 'vim'],
				\ })
	call smartinput#map_to_trigger('i', '*', '*', '*')
	call smartinput#define_rule({
				\ 'at': '\%#',
				\ 'char': '*',
				\ 'input': ' * ',
				\ })
	call smartinput#define_rule({
				\ 'at': '\%#',
				\ 'char': '*',
				\ 'input': '*',
				\ 'filetype': ['gitignore', 'gitcommit', 'vim', 'html', 'xhtml', 'liquid', 'xml'],
				\ })
	call smartinput#map_to_trigger('i', '/', '/', '/')
	call smartinput#define_rule({
				\ 'at': '\%#',
				\ 'char': '/',
				\ 'input': ' / ',
				\ })
	call smartinput#define_rule({
				\ 'at': '\%#',
				\ 'char': '/',
				\ 'input': '/',
				\ 'filetype': ['text', 'txt', 'vim', 'sh', 'bash', 'fish', 'zsh', 'ksh', 'csh', 'tcsh', 'ps1', 'dosbatch', 'markdown', 'pandoc', 'gfimarkdown', 'rst', 'html', 'xhtml', 'liquid', 'xml', 'gitignore', 'gitcommit', 'json', 'gentoo-package-use'],
				\ })
	call smartinput#map_to_trigger('i', '+=', '+=', '+=')
	call smartinput#define_rule({
				\ 'at': '\%#',
				\ 'char': '+=',
				\ 'input': ' += ',
				\ })
	call smartinput#map_to_trigger('i', '-=', '-=', '-=')
	call smartinput#define_rule({
				\ 'at': '\%#',
				\ 'char': '-=',
				\ 'input': ' -= ',
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
	call smartinput#map_to_trigger('i', '&=', '&=', '&=')
	call smartinput#define_rule({
				\ 'at': '\%#',
				\ 'char': '&=',
				\ 'input': ' &= ',
				\ })
	call smartinput#map_to_trigger('i', '<Bar>=', '<Bar>=', '<Bar>=')
	call smartinput#define_rule({
				\ 'at': '\%#',
				\ 'char': '<Bar>=',
				\ 'input': ' <Bar>= ',
				\ })
	call smartinput#map_to_trigger('i', '^=', '^=', '^=')
	call smartinput#define_rule({
				\ 'at': '\%#',
				\ 'char': '^=',
				\ 'input': ' ^= ',
				\ })
	call smartinput#map_to_trigger('i', '&', '&', '&')
	call smartinput#define_rule({
				\ 'at': '\%#',
				\ 'char': '&',
				\ 'input': ' & ',
				\ })
	call smartinput#define_rule({
				\ 'at': '\%#',
				\ 'char': '&',
				\ 'input': '&',
				\ 'filetype': ['vim'],
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
				\ })
	call smartinput#define_rule({
				\ 'at': '\%#',
				\ 'char': '^',
				\ 'input': '^',
				\ 'filetype': ['vim', 'pandoc', 'markdown', 'gfimarkdown', 'tex', 'plaintex', 'context', 'html', 'xhtml', 'liquid', 'xml'],
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
	call smartinput#map_to_trigger('i', '%', '%', '%')
	call smartinput#define_rule({
				\ 'at': '\%#',
				\ 'char': '%',
				\ 'input': ' % ',
				\ 'filetype': ['c', 'julia', 'python'],
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
	call smartinput#map_to_trigger('i', '*/', '*/', '*/')
	call smartinput#define_rule({
				\ 'at': '\%#',
				\ 'char': '*/',
				\ 'input': ' */ ',
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
				\ 'filetype': ['vim', 'html', 'xhtml', 'pandoc', 'markdown', 'gfimarkdown', 'liquid', 'txt', 'text'],
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
				\ 'filetype': ['csv', 'json'],
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
				\ 'filetype': ['tex', 'plaintex', 'context', 'pandoc', 'markdown', 'gfimarkdown'],
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
