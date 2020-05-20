scriptencoding utf-8
function! init#smartinput#main() "{{{
	inoremap （ （）<Left>
	inoremap 《 《》<Left>
	inoremap 【 【】<Left>
	inoremap 〖 〖〗<Left>
	inoremap ‘ ‘’<Left>
	inoremap “ “”<Left>
	inoremap ：： ；

	" c {{{ "
	call smartinput#map_to_trigger('i', '=', '=', '=')
	call smartinput#define_rule({
				\ 'at': '\%#',
				\ 'char': '=',
				\ 'input': ' = ',
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
				\ 'filetype': ['muttrc', 'json', 'gentoo-make-conf', 'gentoo-package-use', 'cmusrc', 'pandoc', 'markdown', 'gfimarkdown'],
				\ })
	call smartinput#map_to_trigger('i', '--', '--', '--')
	call smartinput#define_rule({
				\ 'at': '\%#',
				\ 'char': '--',
				\ 'input': ' -- ',
				\ })
	call smartinput#map_to_trigger('i', '*', '*', '*')
	call smartinput#define_rule({
				\ 'at': '\%#',
				\ 'char': '*',
				\ 'input': ' * ',
				\ })
	call smartinput#map_to_trigger('i', '/', '/', '/')
	call smartinput#define_rule({
				\ 'at': '\%#',
				\ 'char': '/',
				\ 'input': ' / ',
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
				\ 'filetype': ['c', 'julia', 'python', 'vim'],
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
				\ 'filetype': ['vim', 'html', 'xhtml', 'pandoc', 'markdown', 'gfimarkdown', 'liquid'],
				\ })
	call smartinput#map_to_trigger('i', '>', '>', '>')
	call smartinput#define_rule({
				\ 'at': '\%#',
				\ 'char': '>',
				\ 'input': ' > ',
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
				\ })
	call smartinput#define_rule({
				\ 'at': '\%#',
				\ 'char': '!',
				\ 'input': '!',
				\ 'filetype': ['tex', 'plaintex', 'context'],
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
				\ 'filetype': ['csv'],
				\ })
	call smartinput#map_to_trigger('i', '.', '.', '.')
	call smartinput#define_rule({
				\ 'at': '\%#',
				\ 'char': '.',
				\ 'input': ' . ',
				\ 'filetype': ['vim'],
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
				\ })
	call smartinput#define_rule({
				\ 'at': '\%#',
				\ 'char': ':',
				\ 'input': ':',
				\ 'filetype': ['octave', 'matlab', 'julia', 'vim'],
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
				\ 'input': '$$<Left>$$',
				\ 'filetype': ['tex', 'plaintex', 'context', 'pandoc', 'markdown', 'gfimarkdown'],
				\ })
	" }}} tex "
endfunction "}}}
