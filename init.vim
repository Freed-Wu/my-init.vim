" Plugin {{{1 "
"  {{{2 "
"  {{{3 "
scriptencoding utf-8
let g:mapleader = 'Q'
let g:maplocalleader = ';'
if has('gui_running')
	if exists('$VIMWORKSPACE')
		cd $VIMWORKSPACE
	else
		cd $HOME/Documents
	endif
endif
" 3}}}  "
" 2}}}  "

" PluginManage {{{2 "
" Shougo/dein.vim {{{3 "
if executable('Snarl_CMD') && executable('Snarl') || executable('notify-send') || executable('osascript') || executable('terminal-notifier')
	let g:dein#enable_notification = 1
endif
if has('nvim')
	let g:dein#install_progress_type = 'title'
endif
let g:dein#install_log_filename = $VIMDATA.'/.dein.vim/dein.log'
set runtimepath=$VIMRUNTIME,$GITHUBWORKSPACE/Shougo/dein.vim
if dein#load_state(fnamemodify($GITHUBWORKSPACE, ':p:h:h:h'))
	call dein#begin(fnamemodify($GITHUBWORKSPACE, ':p:h:h:h'))

	" Plugin {{{4 "
	" PluginManage {{{5 "
	call dein#add('Shougo/dein.vim')
	call dein#add('haya14busa/dein-command.vim', {
				\ 'on_cmd': 'Dein',
				\ })
	call dein#add('wsdjeg/dein-ui.vim', {
				\ 'on_cmd': ['SPUpdate', 'SPInstall', 'SPReinstall'],
				\ })
	call dein#add('neoclide/coc.nvim', {
				\ 'if': executable('node'),
				\ 'build': 'yarn install --frozen-lockfile',
				\ 'on_if': 1,
				\ })
	" 5}}} PluginManage "

	" PluginDetect {{{5 "
	call dein#add('tpope/vim-scriptease', {
				\ 'on_cmd': ['PP', 'PPmsg', 'Runtime', 'Time', 'Verbose', 'Vedit', 'Vopen', 'Vread', 'Vsplit', 'Vvsplit', 'Vtabedit', 'Vpedit', 'Messages', 'Scriptnames', 'Breakadd', 'Breakdel', 'Disarm'],
				\ 'on_map': ['<Plug>ScripteaseHelp','<Plug>ScripteaseFilter', '<Plug>ScripteaseSynnames']
				\ })
	call dein#add('junegunn/vader.vim', {
				\ 'on_cmd': 'Vader',
				\ })
	" 5}}} PluginDetect "
	" 4}}} Plugin "

	" Default {{{4 "
	"  {{{5 "
	call dein#add('tpope/vim-sensible')
	call dein#add('gentoo/gentoo-syntax', {
				\ 'on_cmd': ['NewEbuild', 'NewMetadata', 'NewGLEP', 'NewInitd'],
				\ 'on_ft': split(glob($GITHUBWORKSPACE . '/gentoo/gentoo-syntax/syntax/*.vim'), '\(\.vim\n\)\?' . $GITHUBWORKSPACE . '/gentoo/gentoo-syntax/syntax/\|\.vim'),
				\ })
	call dein#add($VIMCONFIG, {
				\ 'frozen': 1,
				\ })
	" 5}}}  "

	" Encoding {{{5 "
	call dein#add('vimchina/vim-fencview', {
				\ 'if': has('iconv') && executable('tellenc'),
				\ })
	" 5}}} Encoding "

	" Help {{{5 "
	call dein#add('yianwillis/vimcdoc', {
				\ 'on_ft': 'help',
				\ })
	" 5}}} Help "

	" Log {{{5 "
	call dein#add('AD7six/vim-activity-log', {
				\ 'if': has('unix') || has('win32unix'),
				\ 'on_event': ['BufWrite','BufRead', 'BufNewFile'],
				\ })
	call dein#add('wakatime/vim-wakatime', {
				\ 'on_event': 'BufWrite',
				\ })
	" 5}}} Log "

	" Language {{{5 "
	call dein#add('voldikss/vim-translator', {
				\ 'if': has('pythonx'),
				\ 'on_cmd': ['Translate', 'TranslateW', 'TranslateR', 'TranslateH'],
				\ 'on_map': '<Plug>Translate',
				\ })
	" 5}}} Language "
	" 4}}} Default "

	" Interaction {{{4 "
	" UI {{{5 "
	call dein#add('liuchengxu/vim-which-key', {
				\ 'on_cmd': ['WhichKey', 'WhichKeyVisual'],
				\ 'hook_post_source': join([
				\ 'call init#which_key#main()',
				\ ], "\n"),
				\ })
	call dein#add('skywind3000/vim-quickui', {
				\ 'on_func': ['quickui#menu#open', 'QuickThemeChange'],
				\ 'hook_post_source': join([
				\ 'call init#quickui#main()',
				\ ], "\n"),
				\ })
	call dein#add('mhinz/vim-startify')
	" 5}}} UI "

	" Hotkey {{{5 "
	call dein#add('tpope/vim-unimpaired', {
				\ 'on_map': {'n': ['<Plug>', 'yo', '[', ']']},
				\ 'hook_post_source': join([
				\ 'call init#unimpaired#main()',
				\ ], "\n"),
				\ })
	call dein#add('tpope/vim-capslock')
	call dein#add('tpope/vim-rsi', {
				\ 'on_if': !exists('g:rsi_no_meta'),
				\ 'hook_post_source': join([
				\ 'inoremap ð <C-o>(',
				\ 'inoremap î <C-o>)',
				\ 'inoremap <C-f> <Right>',
				\ 'cnoremap <C-y> <C-r>+',
				\ ], "\n"),
				\ })
	" 5}}} Hotkey "

	" KeyMap {{{5 "
	call dein#add('vim-scripts/VimIM', {
				\ 'on_func': ['Vimim_chinese', 'Vimim_gi', 'Vimim_search'],
				\ 'on_cmd': 'ViMiM',
				\ 'on_map': {'i': '<C-space>', 'n': '<C-space>'},
				\ })
	" 5}}} KeyMap "

	" MacroExplore {{{5 "
	call dein#add('vim-scripts/marvim', {
				\ 'on_map': 'q',
				\ })
	call dein#add('dohsimpson/vim-macroeditor', {
				\ 'on_cmd': 'MacroEdit',
				\ })
	" 5}}} MacroExplore "
	" 4}}} Interaction "

	" Appearance {{{4 "
	" Colorscheme {{{5 "
	call dein#add('flazz/vim-colorschemes')
	call dein#add('vim-airline/vim-airline-themes')
	call dein#add('reedes/vim-thematic', {
				\ 'on_cmd': ['Thematic', 'ThematicFirst', 'ThematicNext', 'ThematicPrevious', 'ThematicRandom'],
				\ })
	call dein#add('drmikehenry/vim-fontsize', {
				\ 'on_if': has('gui_running'),
				\ 'on_map': '<Plug>Fontsize',
				\ })
	call dein#add('Godlygeek/csapprox', {
				\ 'on_if': !has('gui_running'),
				\ })
	" 5}}} Colorscheme "

	" Highlight {{{5 "
	call dein#add('luochen1990/rainbow')
	call dein#add('jaxbot/semantic-highlight.vim', {
				\ 'on_cmd': ['SemanticHighlight', 'SemanticHighlightRevert', 'SemanticHighlightToggle'],
				\ })
	call dein#add('nathanaelkane/vim-indent-guides')
	call dein#add('dbmrq/vim-redacted', {
				\ 'on_cmd': ['Redact', 'RedactedW'],
				\ 'on_map': '<Plug>Redact',
				\ })
	call dein#add('vim-utils/vim-troll-stopper')
	call dein#add('Soares/longline.vim', {
				\ 'on_map': '<Plug>longline#',
				\ 'on_cmd': 'LongLine',
				\ })
	" 5}}} Highlight "

	" Conceal {{{5 "
	call dein#add('ryanoasis/vim-devicons')
	call dein#add('KeitaNakamura/tex-conceal.vim', {
				\ 'on_ft': ['tex', 'plaintex', 'context', 'markdown', 'pandoc'],
				\ })
	call dein#add('Yggdroot/indentLine', {
				\ 'on_ft': ['python', 'yaml', 'tex', 'plaintex', 'context', 'markdown', 'pandoc', 'defx'],
				\ })
	call dein#add('powerman/vim-plugin-AnsiEsc', {
				\ 'on_cmd': 'AnsiEsc',
				\ })
	" 5}}} Conceal "

	" StatusBar {{{5 "
	call dein#add('bling/vim-airline', {
				\ 'if': &encoding ==# 'utf-8',
				\ })
	call dein#add('mattn/webapi-vim', {
				\ 'on_source': ['airline-weather.vim', 'excelview-vim', 'vim-splash'],
				\ 'if': executable('wget') || executable('curl'),
				\ })
	call dein#add('Wildog/airline-weather.vim')
	call dein#add('enricobacis/vim-airline-clock')
	call dein#add('Zuckonit/vim-airline-todo')
	call dein#add('tpope/vim-endwise')
	" 5}}} StatusBar "

	" Display {{{5 "
	call dein#add('junegunn/goyo.vim', {
				\ 'on_cmd': 'Goyo',
				\ })
	call dein#add('junegunn/limelight.vim', {
				\ 'on_cmd': 'Limelight',
				\ })
	call dein#add('mattn/vimtweak', {
				\ 'if': has('gui_win32'),
				\ })
	call dein#add('mattn/transparency-windows-vim', {
				\ 'if': has('gui_win32'),
				\ })
	call dein#add('t9md/vim-macvim-transparency', {
				\ 'if': has('gui_mac'),
				\ })
	call dein#add('Kjwon15/vim-transparent', {
				\ 'on_if': !has('gui_running'),
				\ 'on_cmd': 'ClearBackground',
				\ })
	call dein#add('thinca/vim-splash', {
				\ 'on_cmd': 'Splash',
				\ })
	" 5}}} Display "

	" SyntaxMarkUp {{{5 "
	call dein#add('sheerun/vim-polyglot')
	call dein#add('calon/txt')
	call dein#add('walkermatt/vim-mapfile')
	call dein#add('vim-pandoc/vim-pandoc-syntax', {
				\ 'on_ft': ['pandoc', 'markdown', 'rst', 'textile', 'gfimarkdown'],
				\ })
	call dein#add('vim-scripts/fountain.vim')
	call dein#add('TrustifierLabs/vim-lyx-layout')
	call dein#add('vim-scripts/tpp.vim')
	call dein#add('lambdalisue/vim-manpager', {
				\ 'on_ft': 'man',
				\ 'on_cmd': ['Man', 'MANPAGER'],
				\ })
	call dein#add('lambdalisue/vim-pager', {
				\ 'on_cmd': 'PAGER',
				\ })
	call dein#add('jwalton512/vim-blade')
	call dein#add('rdolgushin/gitignore.vim')
	" 5}}} SyntaxMarkUp "

	" SyntaxScript {{{5 "
	call dein#add('vim-scripts/lingo.vim')
	call dein#add('vim-scripts/lindo.vim')
	call dein#add('jeroenbourgois/vim-actionscript')
	call dein#add('vim-scripts/forth.vim')
	call dein#add('fasterthanlime/ooc.vim')
	call dein#add('ykanda/squirrel.vim')
	" 5}}} SyntaxScript "

	" SyntaxCompile {{{5 "
	call dein#add('yesmar/vim-banned')
	call dein#add('vim-scripts/sqlite_c')
	call dein#add('vim-scripts/tcl_sqlite.vim')
	call dein#add('Kocha/vim-systemc', {
				\ 'on_ft': 'cpp',
				\ })
	" 5}}} SyntaxCompile "

	" Fold {{{5 "
	call dein#add('dbmrq/vim-chalk', {
				\ 'on_map': ['<Plug>ChalkUp', '<Plug>ChalkDown ', '<Plug>Chalk', '<Plug>ChalkRange', '<Plug>SingleChalk', '<Plug>SingleChalkUp'],
				\ 'on_func': ['chalk#makeMarker', 'chalk#makeFold', 'chalk#makeFold'],
				\ })
	call dein#add('Konfekt/FastFold')
	call dein#add('embear/vim-foldsearch', {
				\ 'on_cmd': ['Fw', 'Fs', 'FS', 'Fl', 'Fi', 'Fd', 'Fe'],
				\ })
	call dein#add('LucHermitte/lh-vim-lib', {
				\ 'on_ft': ['c', 'cpp', 'cs', 'java', 'arduino', 'objc', 'objcpp'],
				\ })
	call dein#add('LucHermitte/VimFold4C')
	call dein#add('djoshea/vim-matlab-fold')
	call dein#add('shepheb/vim-forth-folding')
	call dein#add('Twinside/vim-haskellFold')
	call dein#add('vim-scripts/phpfolding.vim', {
				\ 'on_ft': 'php',
				\ })
	call dein#add('thinca/vim-ft-help_fold')
	call dein#add('vim-utils/vim-ruby-fold', {
				\ 'on_ft': ['ruby', 'rspec'],
				\ })
	call dein#add('pedrohdz/vim-yaml-folds')
	call dein#add('gberenfield/cljfold.vim', {
				\ 'on_ft': 'clojure',
				\ })
	call dein#add('sgeb/vim-diff-fold')
	call dein#add('matcatc/vim-asciidoc-folding')
	" 5}}} Fold "
	" 4}}} Appearance "

	" CursorMove {{{4 "
	" TagExplore {{{5 "
	call dein#add('ludovicchabant/vim-gutentags', {
				\ 'if': executable('ctags') || executable('cscope') || executable('gtags-cscope'),
				\ })
	call dein#add('skywind3000/gutentags_plus', {
				\ 'depends': 'ludovicchabant/vim-gutentags',
				\ 'on_cmd': ['GscopeFind', 'GscopeKill'],
				\ })
	call dein#add('liuchengxu/vista.vim')
	call dein#add('dirn/TODO.vim', {
				\ 'on_cmd': 'TODO',
				\ })
	call dein#add('xltan/LeaderF-tjump')
	call dein#add('Yggdroot/LeaderF-changes')
	" 5}}} TagExplore "

	" MarkExplore {{{5 "
	call dein#add('kshenoy/vim-signature')
	call dein#add('Yggdroot/LeaderF-marks')
	" 5}}} MarkExplore "

	" Move {{{5 "
	call dein#add('easymotion/vim-easymotion', {
				\ 'on_map': '<Plug>',
				\ 'on_source': 'incsearch-easymotion.vim',
				\ })
	call dein#add('psliwka/vim-smoothie', {
				\ 'on_func': ['smoothie#upwards', 'smoothie#downwards', 'smoothie#forwards', 'smoothie#backwards'],
				\ })
	call dein#add('reedes/vim-wheel', {
				\ 'on_map': '<Plug>(Wheel',
				\ })
	call dein#add('andymass/vim-matchup', {
				\ 'on_map': '<plug>(matchup-',
				\ })
	call dein#add('wesQ3/vim-windowswap')
	" 5}}} Move "

	" Search {{{5 "
	call dein#add('justinmk/vim-sneak', {
				\ 'on_map': {'n': '<Plug>Sneak', 'o': '<Plug>Sneak', 'x': '<Plug>Sneak'},
				\ })
	call dein#add('osyo-manga/vim-anzu', {
				\ 'on_map': '<Plug>',
				\ })
	call dein#add('haya14busa/vim-asterisk', {
				\ 'on_map': '<Plug>',
				\ })
	call dein#add('haya14busa/incsearch.vim', {
				\ 'on_map': '<Plug>',
				\ 'on_func': 'incsearch#go',
				\ 'on_source': ['incsearch-easymotion.vim', 'incsearch-fuzzy.vim'],
				\ })
	call dein#add('haya14busa/is.vim', {
				\ 'on_map': '<Plug>(is-',
				\ })
	call dein#add('haya14busa/incsearch-easymotion.vim', {
				\ 'on_map': '<Plug>',
				\ 'on_func': 'incsearch#config#easymotion#module',
				\ })
	call dein#add('haya14busa/incsearch-fuzzy.vim', {
				\ 'on_map': '<Plug>',
				\ 'on_func': 'incsearch#config#fuzzy#converter',
				\ })
	call dein#add('Shougo/vimproc.vim', {
				\ 'build': 'make Makefile',
				\ 'on_source': 'incsearch-migemo.vim',
				\ })
	call dein#add('haya14busa/incsearch-migemo.vim', {
				\ 'on_map': '<Plug>',
				\ })
	call dein#add('luochen1990/select-and-search', {
				\ 'on_func': 'select_and_search#get_search_pat',
				\ })
	" 5}}} Search "

	" Replace {{{5 "
	call dein#add('tpope/vim-abolish', {
				\ 'on_map': 'cr',
				\ 'on_cmd': 'Subvert',
				\ })
	call dein#add('svermeulen/vim-subversive', {
				\ 'on_map': '<plug>(Subversive',
				\ })
	call dein#add('kurkale6ka/vim-swap', {
				\ 'on_map': '<plug>SwapSwap',
				\ })
	call dein#add('JikkuJose/vim-visincr', {
				\ 'on_cmd': ['I', 'IA', 'IB', 'IO', 'IX', 'ID', 'IM', 'IDMY', 'IMDY', 'IYMD', 'II', 'IIA', 'IIB', 'IIO', 'IIX'],
				\ })
	" 5}}} Replace "

	" Increment {{{5 "
	call dein#add('nishigori/increment-activator', {
				\ 'on_map': ['<C-a>', '<C-x>'],
				\ })
	" 5}}} Increment "
	" 4}}} CursorMove "

	" CursorVisual {{{4 "
	" Select {{{5 "
	call dein#add('mg979/vim-visual-multi', {
				\ 'on_map': ['<Plug>VM', '<Leader>m'],
				\ })
	" 5}}} Select "

	" TextObjChar {{{5 "
	call dein#add('wellle/targets.vim', {
				\ 'on_func': 'targes#e',
				\ })
	call dein#add('kana/vim-textobj-user')
	call dein#add('thinca/vim-textobj-between', {
				\ 'on_map': {'o': '<Plug>', 'x': '<Plug>'},
				\ })
	call dein#add('kana/vim-textobj-jabraces', {
				\ 'on_map': {'o': ['ij', 'aj'], 'x': ['ij', 'aj']},
				\ })
	call dein#add('reedes/vim-textobj-quote', {
				\ 'on_map': {'o': ['ijj', 'ajj', 'ijJ', 'ajJ'], 'x': ['ijj', 'ajj', 'ijJ', 'ajJ', '<Plug>SurroundWithDouble', '<Plug>SurroundWithSingle']},
				\ 'hook_post_source': join([
				\ 'call textobj#quote#init({"educate": 0})',
				\ 'nmap ys <Plug>Ysurround',
				\ 'nmap yS <Plug>YSurround',
				\ 'xmap s <Plug>VSurround',
				\ 'xmap S <Plug>VgSurround',
				\ ], "\n"),
				\ })
	call dein#add('reedes/vim-textobj-sentence', {
				\ 'on_map': {'o': ['is', 'as'], 'x': ['is', 'as',], 'n': 'g'},
				\ 'hook_post_source': join([
				\ 'textobj#sentence#init',
				\ ], "\n"),
				\ })
	call dein#add('whatyouhide/vim-textobj-xmlattr', {
				\ 'on_map': {'o': ['ix', 'ax'], 'x': ['ix', 'ax']},
				\ })
	" 5}}} TextObjChar "

	" TextObjSymbol {{{5 "
	call dein#add('kana/vim-textobj-entire', {
				\ 'on_map': {'o': '<Plug>', 'x': '<Plug>'},
				\ })
	call dein#add('kana/vim-textobj-indent', {
				\ 'on_map': {'o': ['ii', 'ai', 'iI', 'aI'], 'x': ['ii', 'ai', 'iI', 'aI']},
				\ })
	call dein#add('glts/vim-textobj-indblock', {
				\ 'on_map': {'o': ['oo', 'ao', 'oO', 'aO'], 'x': ['oo', 'ao', 'oO', 'aO']},
				\ })
	call dein#add('kana/vim-textobj-line', {
				\ 'on_map': {'o': ['il', 'al'], 'x': ['il', 'al']},
				\ })
	call dein#add('rhysd/vim-textobj-continuous-line', {
				\ 'on_map': {'o': '<Plug>textobj-continuous', 'x': '<Plug>textobj-continuous'},
				\ 'hook_post_source': join([
				\ 'let g:textobj_continuous_line_no_default_mappings = 1',
				\ ], "\n"),
				\ })
	call dein#add('coderifous/textobj-word-column.vim', {
				\ 'on_func': 'TextObjWordBasedColumn',
				\ })
	call dein#add('saaguero/vim-textobj-pastedtext', {
				\ 'on_map': {'o': 'gb', 'x': 'gb'},
				\ })
	" 5}}} TextObjSymbol "

	" TextObjSyntax {{{5 "
	call dein#add('somini/vim-textobj-fold', {
				\ 'on_map': {'o': ['iz', 'az'], 'x': ['iz', 'az']},
				\ })
	call dein#add('kana/vim-textobj-syntax', {
				\ 'on_map': {'o': ['iy', 'ay'], 'x': ['iy', 'ay']},
				\ })
	call dein#add('glts/vim-textobj-comment', {
				\ 'on_map': {'o': '<Plug>', 'x': '<Plug>'},
				\ })
	" 5}}} TextObjSyntax "

	" TextObjContent {{{5 "
	call dein#add('Julian/vim-textobj-variable-segment', {
				\ 'on_map': {'o': ['iv', 'av'], 'x': ['iv', 'av']},
				\ })
	call dein#add('Chun-Yang/vim-textobj-chunk', {
				\ 'on_map': {'o': '<Plug>', 'x': '<Plug>'},
				\ })
	call dein#add('rsrchboy/vim-textobj-heredocs', {
				\ 'on_map': {'o': ['iH', 'aH'], 'x': ['iH', 'aH']},
				\ })
	call dein#add('kana/vim-textobj-datetime', {
				\ 'on_map': {'o': '<Plug>', 'x': '<Plug>'},
				\ })
	call dein#add('paulhybryant/vim-textobj-path', {
				\ 'on_map': {'o': '<Plug>', 'x': '<Plug>'},
				\ })
	call dein#add('jceb/vim-textobj-uri', {
				\ 'on_map': {'o': '<Plug>', 'x': '<Plug>'},
				\ })
	call dein#add('mattn/vim-textobj-url', {
				\ 'on_map': {'o': ['iu', 'au'], 'x': ['iu', 'au']},
				\ })
	" 5}}} TextObjContent "

	" TextObjMarkUp {{{5 "
	call dein#add('kana/vim-textobj-diff', {
				\ 'on_ft': 'diff',
				\ 'on_map': {'n': '<Plug>', 'o': '<Plug>', 'x': '<Plug>'},
				\ })
	call dein#add('kana/vim-textobj-help')
	call dein#add('coachshea/vim-textobj-markdown')
	call dein#add('rbonvall/vim-textobj-latex')
	call dein#add('jasonlong/vim-textobj-css', {
				\ 'on_ft': 'css',
				\ 'on_map': {'n': '<Plug>', 'o': '<Plug>', 'x': '<Plug>'},
				\ })
	call dein#add('whatyouhide/vim-textobj-erb', {
				\ 'on_ft': 'erb',
				\ 'on_map': {'n': '<Plug>', 'o': '<Plug>', 'x': '<Plug>'},
				\ })
	" 5}}} TextObjMarkUp "

	" TextObjScript {{{5 "
	call dein#add('kana/vim-textobj-function', {
				\ 'on_ft': ['c', 'cpp', 'java', 'vim'],
				\ 'on_map': {'n': '<Plug>', 'o': '<Plug>', 'x': '<Plug>'},
				\ })
	call dein#add('spacewander/vim-textobj-lua', {
				\ 'on_ft': 'lua',
				\ 'on_map': {'n': '<Plug>', 'o': '<Plug>', 'x': '<Plug>'},
				\ 'if': has('python'),
				\ })
	call dein#add('akiyan/vim-textobj-php', {
				\ 'on_ft': 'php',
				\ 'on_map': {'n': '<Plug>', 'o': '<Plug>', 'x': '<Plug>'},
				\ })
	call dein#add('bps/vim-textobj-python')
	call dein#add('vimtaku/vim-textobj-sigil', {
				\ 'on_ft': 'perl',
				\ 'on_map': {'n': '<Plug>', 'o': '<Plug>', 'x': '<Plug>'},
				\ })
	call dein#add('tek/vim-textobj-ruby', {
				\ 'on_ft': 'ruby',
				\ 'on_map': {'n': '<Plug>', 'o': '<Plug>', 'x': '<Plug>'},
				\ })
	" 5}}} TextObjScript "

	" TextObjCompile {{{5 "
	call dein#add('libclang-vim/vim-textobj-clang')
	call dein#add('gilligan/vim-textobj-haskell', {
				\ 'if': has('python'),
				\ 'on_ft': 'haskell',
				\ 'on_map': '<Plug>',
				\ })
	call dein#add('andyl/vim-textobj-elixir', {
				\ 'on_ft': 'elixir',
				\ 'on_map': '<Plug>',
				\ })
	call dein#add('adriaanzon/vim-textobj-blade-directive', {
				\ 'on_ft': 'blade',
				\ 'on_map': '<Plug>',
				\ })
	" 5}}} TextObjCompile "
	" 4}}} CursorVisual "

	" Edit {{{4 "
	" Repeat {{{5 "
	call dein#add('tpope/vim-repeat')
	call dein#add('inkarkat/vim-ingo-library')
	call dein#add('vim-scripts/visualrepeat', {
				\ 'on_map': {'x': '.'},
				\ })
	" 5}}} Repeat "

	" ClipBoard {{{5 "
	call dein#add('svermeulen/vim-yoink', {
				\ 'on_map': '<plug>(Yoink',
				\ })
	call dein#add('junegunn/vim-peekaboo', {
				\ 'on_map': {
				\ 'n': ['"', '@'],
				\ 'x': ['"', '@'],
				\ 'i': '<C-R>',
				\ },
				\ 'augroup': 'peekaboo_init',
				\ })
	call dein#add('machakann/vim-highlightedyank', {
				\ 'on_map': ['y', 'Y'],
				\ 'hook_post_source': join([
				\ 'nnoremap Y y$',
				\ 'xnoremap Y $y',
				\ ], "\n"),
				\ })
	" 5}}} ClipBoard "

	" Draw {{{5 "
	call dein#add('vim-scripts/DrawIt', {
				\ 'on_cmd': ['DrawIt', 'DIstart', 'DIstop', 'DInrml', 'DIsngl', 'DIdbl'],
				\ })
	call dein#add('vim-scripts/sketch.vim', {
				\ 'on_func': 'ToggleSketch',
				\ })
	" 5}}} Draw "

	" Filter {{{5 "
	call dein#add('iwataka/cowsay.vim', {
				\ 'on_func': 'cowsay#cowsay',
				\ })
	call dein#add('pocke/vanner')
	call dein#add('LiquidFun/vim-comment-banners', {
				\ 'on_cmd': ['CommentBanner'],
				\ })
	" 5}}} Filter "

	" Compose {{{5 "
	call dein#add('junegunn/vim-easy-align', {
				\ 'on_map': '<Plug>(EasyAlign)',
				\ 'on_cmd': ['EasyAlign', 'LiveEasyAlign'],
				\ })
	" 5}}} Compose "

	" Format {{{5 "
	call dein#add('Soares/trailguide.vim', {
				\ 'on_map': {'n': '<Plug>trailguide#'},
				\ 'on_if': get(b:, 'trailguide', 1),
				\ })
	call dein#add('dbmrq/vim-bucky', {
				\ 'on_func': ['bucky#tex#format()', 'BuckyTexIndent()', 'bucky#tex#format()'],
				\ 'on_ft': ['tex', 'markdown'],
				\ })
	call dein#add('sbdchd/neoformat', {
				\ 'on_cmd': 'Neoformat',
				\ })
	call dein#add('kdheepak/JuliaFormatter.vim', {
				\ 'on_cmd': 'JuliaFormatter#Format',
				\ })
	call dein#add('editorconfig/editorconfig-vim', {
				\ 'on_cmd': 'EditorConfigReload',
				\ })
	call dein#add('Freed-Wu/masmIndent.vim')
	" 5}}} Format "

	" Comment {{{5 "
	call dein#add('scrooloose/nerdcommenter', {
				\ 'on_map': '<Plug>NERDCommenter',
				\ })
	call dein#add('tyru/caw.vim', {
				\ 'on_map': '<Plug>(caw',
				\ })
	call dein#add('Shougo/context_filetype.vim')
	call dein#add('kana/vim-operator-user')
	" 5}}} Comment "

	" Abbreviate {{{5 "
	call dein#add('panozzaj/vim-autocorrect', {
				\ 'on_func': 'AutoCorrect',
				\ 'on_event': 'InsertEnter',
				\ 'hook_post_source': join([
				\ 'call AutoCorrect()',
				\ ], "\n"),
				\ })
	" 5}}} Abbreviate "

	" Insert {{{5 "
	call dein#add('kana/vim-smartinput', {
				\ 'on_event': 'InsertEnter',
				\ 'on_func': ['smartinput#map_to_trigger', 'smartinput#define_rule'],
				\ 'hook_post_source': join([
				\ 'call init#smartinput#main()',
				\ ], "\n"),
				\ })
	call dein#add('tpope/vim-surround', {
				\ 'on_map': {'n': ['<Plug>Dsurround',
				\ '<Plug>CSurround', '<Plug>Csurround',
				\ '<Plug>YSurround', '<Plug>YSsurround',
				\ '<Plug>Ysurround', '<Plug>Yssurround'],
				\ 'x': ['<Plug>VSurround', '<Plug>VgSurround'],
				\ 'i': ['<Plug>Isurround', '<Plug>ISurround'],
				\ },
				\ })
	call dein#add('aprilwade/auto_operator_spacing.vim', {
				\ 'if': exists('v:none'),
				\ 'on_ft': ['coq', 'elm', 'haskell', 'python', 'rust'],
				\ })
	call dein#add('feix760/autospace.vim', {
				\ 'on_ft': ['javascript', 'typescript'],
				\ })
	call dein#add('tkhren/vim-fake', {
				\ 'on_func': ['fake#gen', 'fake#define'],
				\ })
	" 5}}} Insert "

	" Parse {{{5 "
	call dein#add('sillybun/vim-autodoc', {
				\ 'on_cmd': ['RecordParameter', 'RecordCurrentFunction'],
				\ })
	call dein#add('derekwyatt/vim-protodef', {
				\ 'on_func': 'protodef#ReturnSkeletonsFromPrototypesForCurrentBuffer',
				\ })
	" 5}}} Parse "

	" Complete {{{5 "
	call dein#add('junegunn/vim-emoji')
	call dein#add('rhysd/github-complete.vim', {
				\ 'on_ft': ['pandoc', 'markdown', 'gfimarkdown'],
				\ })
	call dein#add('Shougo/deoplete.nvim', {
				\ 'on_event': 'InsertEnter',
				\ 'on_source': 'omnisharp-vim',
				\ 'on_func': ['deoplete#custom#var', 'deoplete#custom#option'],
				\ })
	call dein#add('chrisbra/unicode.vim', {
				\ 'on_map': {'i': '<C-x>'},
				\ })
	call dein#add('youran0715/LeaderF-Cmdpalette')
	" 5}}} Complete "

	" Snippet {{{5 "
	call dein#add('honza/vim-snippets')
	call dein#add('aperezdc/vim-template', {
				\ 'on_cmd': ['Template', 'TemplateHere'],
				\ })
	call dein#add('ararslan/license-to-vim', {
				\ 'on_cmd': ['License', 'Stub'],
				\ 'on_func': 'LicenseComplete',
				\ })
	" 5}}} Snippet "

	" Check {{{5 "
	call dein#add('w0rp/ale')
	call dein#add('wsdjeg/ChineseLinter.vim', {
				\ 'on_cmd': 'CheckChinese',
				\ })
	call dein#add('hotoo/pangu.vim', {
				\ 'on_cmd': ['Pangu', 'PanguEnable', 'PanguDisable'],
				\ 'on_func': 'PanGuSpacing',
				\ })
	call dein#add('dbmrq/vim-ditto', {
				\ 'on_map': ['<Plug>Ditto', '<Plug>ToggleDitto'],
				\ })
	call dein#add('reedes/vim-wordy', {
				\ 'on_cmd': ['Wordy', 'WordyWordy', 'NoWordy', 'NextWordy', 'PrevWordy'],
				\ })
	" 5}}} Check "
	" 4}}} Edit "

	" File {{{4 "
	" FileExplore {{{5 "
	call dein#add('roxma/nvim-yarp', {
				\ 'if': !has('nvim') && has('python3'),
				\ 'on_source': ['deoplete.nvim', 'defx.nvim'],
				\ })
	call dein#add('roxma/vim-hug-neovim-rpc', {
				\ 'if': !has('nvim') && has('python3'),
				\ 'on_source': ['deoplete.nvim', 'defx.nvim'],
				\ })
	call dein#add('Shougo/defx.nvim', {
				\ 'if': has('python3'),
				\ 'on_cmd': 'Defx',
				\ 'hook_post_source': join([
				\ 'call init#defx#main()',
				\ ], "\n"),
				\ })
	call dein#add('linjiX/vim-defx-vista', {
				\ 'on_cmd': 'ToggleDefxVista',
				\ })
	call dein#add('kristijanhusak/defx-git')
	call dein#add('kristijanhusak/defx-icons', {
				\ 'if': has('python3'),
				\ 'on_source': 'defx.nvim',
				\ })
	call dein#add('Yggdroot/LeaderF', {
				\ 'if': has('pythonx'),
				\ 'build': has('unix')? './install.sh': './install.bat',
				\ })
	call dein#add('tamago324/LeaderF-filer')
	call dein#add('tamago324/LeaderF-bookmark')
	call dein#add('TwIStOy/leaderf-cppinclude')
	" 5}}} FileExplore "

	" FileEdit {{{5 "
	call dein#add('mhinz/vim-hugefile')
	call dein#add('derekwyatt/vim-fswitch', {
				\ 'on_cmd': ['FSHere', 'FSLeft', 'FSSplitLeft', 'FSRight', 'FSSplitRight', 'FSBelow', 'FSSplitBelow', 'FSAbove', 'FSSplitAbove'],
				\ })
	call dein#add('tpope/vim-eunuch', {
				\ 'on_cmd': ['Delete', 'Unlink', 'Move', 'Rename', 'Chmod', 'Mkdir', 'Cfind', 'Clocate', 'Lfind', 'Llocate', 'Wall', 'SudoWrite', 'SudoEdit'],
				\ })
	call dein#add('pbrisbin/vim-mkdir')
	call dein#add('will133/vim-dirdiff', {
				\ 'on_cmd': 'DirDiff',
				\ })
	" 5}}} FileEdit "

	" Compress {{{5 "
	call dein#add('lbrayner/vim-rzip')
	" 5}}} Compress "

	" VCS {{{5 "
	call dein#add('tpope/vim-fugitive', {
				\ 'if': executable('git'),
				\ })
	call dein#add('tpope/vim-rhubarb')
	call dein#add('junegunn/gv.vim', {
				\ 'on_cmd': ['GV', 'GV?'],
				\ })
	call dein#add('mhinz/vim-signify', {
				\ 'if': executable('git') || executable('svn'),
				\ })
	call dein#add('cohama/agit.vim', {
				\ 'on_cmd': 'Agit',
				\ })
	call dein#add('junegunn/vim-github-dashboard', {
				\ 'if': has('ruby'),
				\ 'on_cmd': ['GHDashboard', 'GHActivity'],
				\ })
	call dein#add('jaxbot/github-issues.vim', {
				\ 'if': has('pythonx'),
				\ 'on_cmd': ['Gissues', 'Gmiles', 'Giadd'],
				\ })
	call dein#add('mbbill/undotree', {
				\ 'on_cmd': ['UndotreeToggle', 'UndotreeHide', 'UndotreeShow', 'UndotreeFocus'],
				\ })
	call dein#add('bennyyip/LeaderF-github-stars', {
				\ 'on_cmd': 'LeaderfStars',
				\ })
	" 5}}} VCS "
	" 4}}} File "

	" Program {{{4 "
	" Document {{{5 "
	call dein#add('vim-scripts/DoxygenToolkit.vim', {
				\ 'on_cmd': ['Dox', 'DoxAuthor', 'DoxBlock', 'DoxLic', 'DoxUndoc'],
				\ })
	call dein#add('vim-scripts/doxygen-support.vim', {
				\ 'if': executable('doxygen'),
				\ 'on_cmd': ['DxRun', 'DxSelectWorkingDir', 'DxSelectConfigFile', 'DxEditConfigFile', 'DxGenerateConfigFile', 'DxEditLocalTemplates', 'DxEditGlobalTemplates', 'DxReread', 'DxSettings'],
				\ })
	" 5}}} Document "

	" MarkUp {{{5 "
	call dein#add('lervag/vimtex')
	call dein#add('iamcco/markdown-preview.nvim', {
				\ 'build': 'sh -c "cd app & yarn install"',
				\ 'on_ft': ['pandoc', 'markdown', 'gfimarkdown'],
				\ })
	call dein#add('vim-pandoc/vim-pandoc', {
				\ 'on_ft': ['pandoc', 'markdown', 'rst', 'textile', 'gfimarkdown'],
				\ })
	call dein#add('parkr/vim-jekyll', {
				\ 'on_cmd': ['Jpost', 'JSpost', 'JVpost', 'JTpost', 'Jbuild', 'Jserve'],
				\ 'hook_post_source': join([
				\ 'doautocmd User Jekyll',
				\ ], "\n"),
				\ })
	call dein#add('vimwiki/vimwiki', {
				\ 'on_ft': 'vimwiki',
				\ 'on_map': '<Leader>w',
				\ })
	call dein#add('freitass/todo.txt-vim')
	call dein#add('szymonmaszke/vimpyter', {
				\ 'if': executable('notedown'),
				\ 'on_ft': 'ipynb',
				\ 'augroup': 'VimpyterAutoCommands',
				\ })
	call dein#add('jceb/vim-orgmode')
	call dein#add('liuchengxu/graphviz.vim')
	call dein#add('tpope/vim-haml')
	" 5}}} MarkUp "

	" Office {{{5 "
	call dein#add('chrisbra/csv.vim')
	call dein#add('mattn/excelview-vim', {
				\ 'on_cmd': 'ExcelView',
				\ })
	call dein#add('dhruvasagar/vim-table-mode', {
				\ 'on_cmd': ['TableModeToggle', 'Tableize', 'TableAddFormula'],
				\ })
	" 5}}} Office "

	" Database {{{5 "
	call dein#add('vim-scripts/dbext.vim', {
				\ 'on_ft': 'sql',
				\ })
	" 5}}} Database "

	" Script {{{5 "
	call dein#add('JuliaEditorSupport/julia-vim', {
				\ 'on_ft': 'julia',
				\ })
	call dein#add('python-mode/python-mode', {
				\ 'on_ft': ['python', 'snippets'],
				\ })
	call dein#add('vim-ruby/vim-ruby')
	call dein#add('thoughtbot/vim-rspec', {
				\ 'on_ft': 'ruby',
				\ })
	call dein#add('tpope/vim-rails', {
				\ 'on_ft': 'ruby',
				\ })
	call dein#add('tpope/vim-bundler', {
				\ 'on_ft': 'ruby',
				\ })
	call dein#add('tpope/vim-rake', {
				\ 'on_ft': 'ruby',
				\ })
	call dein#add('vim-perl/vim-perl')
	call dein#add('pangloss/vim-javascript')
	call dein#add('jalvesaq/Nvim-R')
	call dein#add('rust-lang/rust.vim', {
				\ 'on_ft': 'rust',
				\ })
	call dein#add('jdonaldson/vaxe', {
				\ 'on_ft': 'vaxe',
				\ })
	call dein#add('WolfgangMehner/awk-support', {
				\ 'on_ft': 'awk',
				\ })
	call dein#add('WolfgangMehner/bash-support', {
				\ 'on_ft': 'bash',
				\ })
	call dein#add('WolfgangMehner/lua-support', {
				\ 'on_ft': 'lua',
				\ })
	call dein#add('PProvost/vim-ps1')
	" 5}}} Script "

	" Compile {{{5 "
	call dein#add('WolfgangMehner/c-support', {
				\ 'on_ft': ['c', 'cpp', 'makefile'],
				\ })
	call dein#add('fedorenchik/qt-support.vim', {
				\ 'on_ft': 'cpp',
				\ })
	call dein#add('fatih/vim-go', {
				\ 'on_ft': 'go',
				\ 'hook_post_source': join([
				\ 'CocRestart',
				\ ], "\n"),
				\ })
	call dein#add('OmniSharp/omnisharp-vim', {
				\ 'on_ft': 'cs',
				\ })
	call dein#add('4Evergreen4/vim-hardy')
	call dein#add('suoto/vim-hdl', {
				\ 'if': has('pythonx'),
				\ 'build': 'pip wheel .ci/requirements.txt --user',
				\ 'on_ft': ['vhdl', 'verilog', 'systemverilog', 'verilog_systemverilog'],
				\ })
	call dein#add('vhda/verilog_systemverilog.vim', {
				\ 'on_ft': ['verilog', 'systemverilog', 'verilog_systemverilog'],
				\ })
	" 5}}} Compile "

	" Debug {{{5 "
	call dein#add('vim-vdebug/vdebug', {
				\ 'if': has('pythonx'),
				\ 'on_ft': ['php', 'python', 'ruby', 'perl', 'javascript', 'tcl'],
				\ })
	" 5}}} Debug "

	" Terminal {{{5 "
	call dein#add('sillybun/vim-repl', {
				\ 'if': !has('nvim'),
				\ 'on_cmd': 'REPLToggle',
				\ })
	call dein#add('voldikss/vim-floaterm', {
				\ 'if': has('nvim'),
				\ 'on_cmd': 'FloatermToggle',
				\ })
	call dein#add('edkolev/promptline.vim', {
				\ 'on_cmd': 'PromptlineSnapshot',
				\ })
	call dein#add('skywind3000/asynctasks.vim', {
				\ 'on_cmd': 'AsyncTask',
				\ })
	call dein#add('skywind3000/asyncrun.vim', {
				\ 'on_cmd': ['AsyncRun', 'AsyncStop'],
				\ })
	" 5}}} Terminal "
	" 4}}} Program "

	" SpecialFunction {{{4 "
	" Music {{{5 "
	call dein#add('azadkuh/vim-cmus', {
				\ 'if': executable('cmus'),
				\ 'on_cmd': 'Cmus',
				\ })
	call dein#add('PascalZh/vim-badapple', {
				\ 'build': 'install.sh',
				\ 'on_cmd': 'ZBadApple',
				\ })
	call dein#add('skanehira/badapple.vim', {
				\ 'on_cmd': 'BadApple',
				\ })
	" 5}}} Music "

	" Tool {{{5 "
	call dein#add('itchyny/calendar.vim', {
				\ 'on_cmd': 'Calendar',
				\ })
	call dein#add('Freed-Wu/gitdraw.vim')
	call dein#add('Freed-Wu/asciiart')
	" 5}}} Tool "

	" Web {{{5 "
	call dein#add('ianding1/leetcode.vim', {
				\ 'on_cmd': ['LeetCodeList', 'LeetCodeTest', 'LeetCodeSubmit', 'LeetCodeSignIn', 'LeetCodeReset'],
				\ })
	call dein#add('kpron/vim-dpaste', {
				\ 'on_cmd': 'Dpaste',
				\ })
	call dein#add('dbeniamine/vim-mail', {
				\ 'if': executable('mutt'),
				\ 'on_ft': 'mail',
				\ })
	" 5}}} Web "

	" Browse {{{5 "
	call dein#add('voldikss/vim-browser-search', {
				\ 'on_cmd': ['Search', 'SearchCurrentText', 'SearchVisualText'],
				\ 'on_map': ['<Plug>SearchNormal', '<Plug>SearchVisual'],
				\ })
	call dein#add('tamago324/LeaderF-openbrowser')
	call dein#add('tyru/open-browser.vim', {
				\ 'on_cmd': 'OpenBrowser',
				\ })
	call dein#add('dawsers/LeaderF-firefox', {
				\ 'if': executable('firefox'),
				\ })
	" 5}}} Browse "

	" Fortune {{{5 "
	call dein#add('openuado/vimtips-fortune', {
				\ 'on_cmd': 'Fortune',
				\ 'on_func': 'fortune_vimtips#tooltipviewtips',
				\ })
	call dein#add('iwataka/fortune.vim', {
				\ 'on_func': ['fortune#download', 'fortune#fortune'],
				\ })
	" 5}}} Fortune "

	" Game {{{5 "
	call dein#add('johngrib/vim-game-code-break', {
				\ 'on_cmd': 'VimGameCodeBreak',
				\ })
	call dein#add('johngrib/vim-game-snake', {
				\ 'on_cmd': 'VimGameSnake',
				\ })
	call dein#add('deris/vim-duzzle', {
				\ 'on_cmd': 'DuzzleStart',
				\ 'on_func': 'duzzle#puzzle_list',
				\ })
	call dein#add('jmanoel7/vim-games', {
				\ 'on_cmd': ['Sokoban', 'SokobanH', 'SokobanV', 'SudokuCustom', 'SudokuEasy', 'SudokuMedium', 'SudokuHard', 'SudokuVeryHard'],
				\ })
	call dein#add('pi314/sudoku-solver.vim', {
				\ 'on_cmd': 'SudokuSolver',
				\ })
	call dein#add('AshyIsMe/2048', {
				\ 'on_cmd': 'NewGame2048',
				\ })
	call dein#add('rbtnn/game_engine.vim', {
				\ 'on_cmd': 'GameEngineStartGame',
				\ })
	call dein#add('rbtnn/mario.vim', {
				\ 'on_cmd': 'Mario',
				\ })
	call dein#add('rbtnn/puyo.vim', {
				\ 'on_cmd': 'Puyo',
				\ })
	call dein#add('vim/killersheep', {
				\ 'if': has('textprop') && has('sound'),
				\ 'on_cmd': 'KillKillKill',
				\ })
	" 5}}} Game "
	" 4}}} SpecialFunction "

	call dein#end()
	call dein#save_state()
endif
augroup init_dein "{{{
	autocmd!
	autocmd VimEnter * call dein#call_hook('post_source')
augroup END "}}}
" 3}}} Shougo/dein.vim "

" neoclide/coc.nvim {{{3 "
let g:coc_snippet_next = '<Tab>'
let g:coc_snippet_prev = '<S-Tab>'
augroup init_coc "{{{
	autocmd!
	autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
	autocmd CursorHold * call CocActionAsync('highlight')
	autocmd Colorscheme * CocRestart
	autocmd VimEnter * CocStart
	autocmd InsertLeave * execute 'normal! zv'
augroup END "}}}
" 3}}} neoclide/coc.nvim "
" 2}}} PluginManage "

" PluginDetect {{{2 "
" tpope/vim-scriptease {{{3 "
nnoremap q= :<C-u>PP<CR>
nmap zS <Plug>ScripteaseSynnames
nmap g= <Plug>ScripteaseFilter
nmap g== <Home><Plug>ScripteaseFilter<End>
xmap g= <Plug>ScripteaseFilter
" 3}}} tpope/vim-scriptease "
" 2}}} PluginDetect "
" 1}}} Plugin "

" Default {{{1 "
" Encoding {{{2 "
"  {{{3 "
set langmenu=zh_CN.utf-8
set makeencoding=char
set fileencodings=ucs-bom,utf-8,cp936,default,latin1
" 3}}}  "
" vimchina/vim-fencview {{{3 "
if has('iconv') && executable('tellenc')
	let g:fencview_autodetect = 1
	let g:fencview_auto_patterns='*.txt,*.md,*.org,*.htm{l\=}'
endif
" 3}}} vimchina/vim-fencview "
" 2}}} Encoding "

" Help {{{2 "
" 2}}} Help "

" Log {{{2 "
" AD7six/vim-activity-log {{{3 "
let g:activity_log_location = $VIMDATA.'/.vim-activity-log/%Y/%m/%d.log'
" 3}}} AD7six/vim-activity-log "
" 2}}} Log "

" Language {{{2 "
if has('pythonx')
	" voldikss/vim-translator {{{3 "
	let g:translator_history_enable = 1
	let g:translator_source_lang = 'en'
	let g:translator_window_max_width = &columns
	let g:translator_window_max_height = &lines
	let g:translator_default_engines = ['google', 'bing', 'iciba', 'youdao', executable('trans')? 'trans': '', executable('sdcv')? 'sdcv': '']
	nmap gK <Plug>TranslateW
	xmap gK <Plug>TranslateWV
	nmap <BS> <Plug>TranslateR
	xmap <BS> <Plug>TranslateRV
	" 3}}} voldikss/vim-translator "
endif
" 2}}} Language "
" 1}}} Default "

" Interaction {{{1 "
" UI {{{2 "
" liuchengxu/vim-which-key {{{3 "
let g:which_key_display_names = {' ': '█', '<CR>': '↵', '<TAB>': '⇆'}
let g:which_key_map_localleader = {
			\ 'name': 'choose a key about local map',
			\ }
nnoremap <nowait> <Leader> :<C-u>WhichKey '<Leader>'<CR>
xnoremap <nowait> <Leader> :<C-u>WhichKeyVisual '<Leader>'<CR>
nnoremap <nowait> <LocalLeader> :<C-u>WhichKey '<LocalLeader>'<CR>
xnoremap <nowait> <LocalLeader> :<C-u>WhichKeyVisual '<LocalLeader>'<CR>
nnoremap <nowait> z :<C-u>WhichKey 'z'<CR>
xnoremap <nowait> z :<C-u>WhichKeyVisual 'z'<CR>
nnoremap <nowait> g :<C-u>WhichKey 'g'<CR>
xnoremap <nowait> g :<C-u>WhichKeyVisual 'g'<CR>
nnoremap <nowait> <C-w> :WhichKey '<lt>C-w>'<CR>
xnoremap <nowait> <C-w> :WhichKeyVisual '<lt>C-w>'<CR>
xnoremap <nowait> i :<C-u>WhichKeyVisual 'i'<CR>
xnoremap <nowait> a :<C-u>WhichKeyVisual 'a'<CR>
xnoremap <nowait> I :<C-u>WhichKeyVisual 'I'<CR>
xnoremap <nowait> A :<C-u>WhichKeyVisual 'A'<CR>
" 3}}} liuchengxu/vim-which-key "
" skywind3000/vim-quickui {{{3 "
let g:quickui_border_style = 3
nnoremap <Space> :call quickui#menu#open()<CR>
xnoremap <Space> :<C-u>call quickui#menu#open()<CR>
nnoremap [<C-f> :<C-u>call quickui#tools#list_function()<CR>
nnoremap ]<C-f> :<C-u>call quickui#tools#preview_tag('')<CR>
" 3}}} skywind3000/vim-quickui "
" mhinz/vim-startify {{{3 "
let g:startify_session_dir = $VIMDATA . '/.vim-startify'
let g:startify_enable_special = 0
let g:startify_change_to_dir = 1
let g:startify_change_to_vcs_root = 1
let g:startify_custom_indices = []
for s:num in range(0, 9)
	let g:startify_custom_indices += [g:maplocalleader . s:num]
endfor
for s:num in range(0, 9)
	let g:startify_custom_indices += ['.' . s:num]
endfor
let g:startify_bookmarks = [
			\ {g:maplocalleader.'s': has('unix') ? '/etc/profile.d/user.sh' : glob('$VIMCONFIG/etc/*.ps1')},
			\ {g:maplocalleader.'v': $MYVIMRC},
			\ {g:maplocalleader.'j': expand('$VIMCONFIG/coc-settings.json')},
			\ {g:maplocalleader.'z': expand('$HOME/.zshrc')},
			\ {g:maplocalleader.'p': '/etc/portage/make.conf'},
			\ {g:maplocalleader.'x': expand('$HOME/.ssh/id_rsa.pub')},
			\ ]
augroup init_Startify "{{{
	autocmd!
	autocmd VimEnter * call s:cowsay()
augroup END "}}}
function! s:cowsay() "{{{
	if !argc()
		" let g:startify_custom_header = split(system('fortune | cowthink -f dragon-and-cow'), '\n')
		" let g:startify_custom_header = cowsay#cowsay(fortune#fortune(), 'dragon-and-cow')
		let g:startify_custom_header = split(fortune_vimtips#tooltipviewtips(), '\n') + readfile($GITHUBWORKSPACE . '/Freed-Wu/asciiart/txt/mythology/103')
	endif
endfunction "}}}
let g:startify_lists = [
			\ { 'type': 'sessions', 'header': ['    Sessions']},
			\ { 'type': 'files', 'header': ['    Most Recently Used']},
			\ { 'type': 'dir', 'header': ['    Most Recently Used @ ' . getcwd()] },
			\ { 'type': 'commands', 'header': ['    Commands']},
			\ { 'type': 'bookmarks', 'header': ['    Bookmarks']},
			\ ]
" 3}}} mhinz/vim-startify "
" 2}}} UI "

" Hotkey {{{2 "
"  {{{3 "
" noVi {{{4 "
nnoremap gO i<Esc>:<C-u>%s/\v\n{3,}/\r\r/ge<CR>`^zv{O<Esc>:let @/ = ''<CR>o
nnoremap go i<Esc>:<C-u>%s/\v\n{3,}/\r\r/ge<CR>`^zv}O<Esc>:let @/ = ''<CR>o
nnoremap S ch
nnoremap s cl
xnoremap <C-t> <Esc>`.``gvp``:call init#swap#main()<CR>
nnoremap g. :<C-u>execute v:count?v:count.'go':''<CR><C-g>
xnoremap g. go
nnoremap g<C-g> g<C-g>
xnoremap g<C-g> g<C-g>
nnoremap g> :<C-u>pwd<CR>
xnoremap g> :<C-u>pwd<CR>
nnoremap gH :left<CR>
nnoremap gM :center<CR>
nnoremap gL :right<CR>
xnoremap gH :left<CR>
xnoremap gM :center<CR>
xnoremap gL :right<CR>
" 4}}} noVi "
" modify {{{4 "
nnoremap g- g-
nnoremap g+ g+
nnoremap gQ gQ
nnoremap gw gw
xnoremap gw gw
nnoremap gq gq
xnoremap gq gq
nnoremap gI gI
xnoremap gI gI
" 4}}} modify "
" markMoveCursor {{{4 "
onoremap [' ['
onoremap [` [`
onoremap ]' ]'
onoremap ]` ]`
xnoremap [' ['
xnoremap [` [`
xnoremap ]' ]'
xnoremap ]` ]`
nnoremap g` g`
xnoremap g` g`
nnoremap g' g'
xnoremap g' g'
" 4}}} markMoveCursor "
" charMoveCursor {{{4 "
nnoremap g0 g0
xnoremap g0 g0
onoremap g0 g0
nnoremap gh g^
xnoremap gh g^
onoremap gh g^
nnoremap gl g$
xnoremap gl g$h
onoremap gl g$
nnoremap gm gm
xnoremap gm gm
onoremap gm gm
" 4}}} charMoveCursor "
" wordMoveCursor {{{4 "
nnoremap ge ge
nnoremap gE gE
xnoremap ge ge
xnoremap gE gE
onoremap ge ge
onoremap gE gE
" 4}}} wordMoveCursor "
" lineMoveCursor {{{4 "
nnoremap gj gj
nnoremap gk gk
xnoremap gj gj
xnoremap gk gk
onoremap gj gj
onoremap gk gk
nnoremap gg gg
xnoremap gg gg
onoremap gg gg
" 4}}} lineMoveCursor "
" foldMoveCursor {{{4 "
nnoremap zJ zjzMzv
nnoremap zK zkzMzv
xnoremap zJ zjzMzv
xnoremap zK zkzMzv
onoremap zJ zjzMzv
onoremap zK zkzMzv
" 4}}} foldMoveCursor "
" scrollMoveCursor {{{4 "
nnoremap zt zt
nnoremap zb zb
nnoremap zz zz
nnoremap zT z+
nnoremap zB z-
nnoremap zZ z.
xnoremap zt zt
xnoremap zb zb
xnoremap zz zz
xnoremap zT z+
xnoremap zB z-
xnoremap zZ z.
" 4}}} scrollMoveCursor "
" wrapMoveCursor {{{4 "
nnoremap zh zh
nnoremap zl zl
nnoremap zH zH
nnoremap zL zL
nnoremap zs zs
nnoremap ze ze
xnoremap zh zh
xnoremap zl zl
xnoremap zH zH
xnoremap zL zL
xnoremap zs zs
xnoremap ze ze
onoremap zh zh
onoremap zl zl
onoremap zH zH
onoremap zL zL
onoremap zs zs
onoremap ze ze
" 4}}} wrapMoveCursor "
" searchMoveCursor {{{4 "
nnoremap gn gn
nnoremap gN gN
xnoremap gn gn
xnoremap gN gN
onoremap gn gn
onoremap gN gN
" 4}}} searchMoveCursor "
" changeMoveCursor {{{4 "
nnoremap g; g;
nnoremap g, g,
xnoremap g; g;
xnoremap g, g,
" 4}}} changeMoveCursor "
" featureMoveCursor {{{4 "
nnoremap [# [#
nnoremap ]# ]#
xnoremap [# [#
xnoremap ]# ]#
onoremap [# [#
onoremap ]# ]#
nnoremap [/ [/
nnoremap ]/ ]/
xnoremap [/ [/
xnoremap ]/ ]/
onoremap [/ [/
onoremap ]/ ]/
nnoremap [c [c
nnoremap ]c ]c
nnoremap [C 99[c
nnoremap ]C 99]c
nnoremap [s [s
nnoremap ]s ]s
nnoremap [S 99[s
nnoremap ]S 99]s
xnoremap [c [c
xnoremap ]c ]c
xnoremap [C 99[c
xnoremap ]C 99]c
xnoremap [s [s
xnoremap ]s ]s
xnoremap [S 99[s
xnoremap ]S 99]s
onoremap [c [c
onoremap ]c ]c
onoremap [C 99[c
onoremap ]C 99]c
onoremap [s [s
onoremap ]s ]s
onoremap [S 99[s
onoremap ]S 99]s
onoremap [m [m
onoremap ]m ]m
onoremap [M [M
onoremap ]M ]M
nnoremap [( [(
nnoremap [) [)
nnoremap ]( ](
nnoremap ]) ])
xnoremap [( [(
xnoremap [) [)
xnoremap ]( ](
xnoremap ]) ])
onoremap [( v[(
onoremap [) v[)
onoremap ]( v](
onoremap ]) v])
nnoremap [{ [{
nnoremap [} [}
nnoremap ]{ ]{
nnoremap ]} ]}
xnoremap [{ [{
xnoremap [} [}
xnoremap ]{ ]{
xnoremap ]} ]}
onoremap [{ v[{
onoremap [} v[}
onoremap ]{ v]{
onoremap ]} v]}
nnoremap [[ [[
nnoremap ]] ]]
nnoremap [] []
nnoremap ][ ][
xnoremap [[ [[
xnoremap ]] ]]
xnoremap [] []
xnoremap ][ ][
onoremap [[ [[
onoremap ]] ]]
onoremap [] []
onoremap ][ ][
" 4}}} featureMoveCursor "
" show {{{4 "
nnoremap [i [i
nnoremap ]i ]i
nnoremap [I [I
nnoremap ]I ]I
nnoremap [<C-i> [<C-i>
nnoremap ]<C-i> ]<C-i>
nnoremap [d [d
nnoremap ]d ]d
nnoremap [D [D
nnoremap ]D ]D
nnoremap [<C-d> [<C-d>
nnoremap ]<C-d> ]<C-d>
" 4}}} show "
" tabMoveCursor {{{4 "
nnoremap gt gt
nnoremap gT gT
" 4}}} tabMoveCursor "
" windowMoveCursor {{{4 "
nnoremap <C-\><C-\> <C-w>w
nnoremap <C-w>w <C-w>w
nnoremap <C-w>W <C-w>W
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-w>t <C-w>t
nnoremap <C-w>b <C-w>b
nnoremap <C-w>r <C-w>r
nnoremap <C-w>R <C-w>R
xnoremap <C-w>w <C-w>w
xnoremap <C-w>W <C-w>W
xnoremap <C-j> <C-w>j
xnoremap <C-k> <C-w>k
xnoremap <C-h> <C-w>h
xnoremap <C-l> <C-w>l
xnoremap <C-w>t <C-w>t
xnoremap <C-w>b <C-w>b
xnoremap <C-w>r <C-w>r
xnoremap <C-w>R <C-w>R
nnoremap <C-w>x <C-w>x
xnoremap <C-w>x <C-w>x
" 4}}} windowMoveCursor "
" cursorMoveWindow {{{4 "
nnoremap <C-w>j <C-w>J
nnoremap <C-w>k <C-w>K
nnoremap <C-w>h <C-w>H
nnoremap <C-w>l <C-w>L
xnoremap <C-w>j <C-w>J
xnoremap <C-w>k <C-w>K
xnoremap <C-w>h <C-w>H
xnoremap <C-w>l <C-w>L
" 4}}} cursorMoveWindow "
" windowModify {{{4 "
nnoremap <C-w>+ <C-w>+
nnoremap <C-w>- <C-w>-
nnoremap <C-w>_ <C-w>_
nnoremap <C-w>< <C-w><
nnoremap <C-w>> <C-w>>
nnoremap <C-w><Bar> <C-w><Bar>
nnoremap <C-w>= <C-w>=
xnoremap <C-w>+ <C-w>+
xnoremap <C-w>- <C-w>-
xnoremap <C-w>_ <C-w>_
xnoremap <C-w>< <C-w><
xnoremap <C-w>> <C-w>>
xnoremap <C-w><Bar> <C-w><Bar>
xnoremap <C-w>= <C-w>=
" 4}}} windowModify "
" windowNew {{{4 "
nnoremap <C-w>^ <C-w>^
nnoremap <C-w>s <C-w>s
nnoremap <C-w>v <C-w>v
xnoremap <C-w>w <C-w>^
xnoremap <C-w>s <C-w>s
xnoremap <C-w>v <C-w>v
nnoremap <C-w>e :enew<CR>
nnoremap <C-w>n <C-w>n
nnoremap <C-w>m :vnew<CR>
xnoremap <C-w>e :<C-u>enew<CR>
xnoremap <C-w>n <C-w>n
xnoremap <C-w>m :<C-u>vnew<CR>
" 4}}} windowNew "
" tabnew {{{4 "
nnoremap <C-w>T <C-w>T
xnoremap <C-w>T <C-w>T
nnoremap <C-w><Tab> :tabnew<CR>
xnoremap <C-w><Tab> :<C-u>tabnew<CR>
nnoremap <C-w>gf <C-w>gf
xnoremap <C-w>gf <C-w>gf
nnoremap <C-w>gF <C-w>gF
xnoremap <C-w>gF <C-w>gF
" 4}}} tabnew "
" windowOpen {{{4 "
nnoremap <C-w>} <C-w>}
nnoremap <C-w>] <C-w>]
nnoremap <C-w>p <C-w>p
nnoremap <C-w>P <C-w>P
nnoremap <C-w>z <C-w>z
xnoremap <C-w>} <C-w>}
xnoremap <C-w>] <C-w>]
xnoremap <C-w>p <C-w>p
xnoremap <C-w>P <C-w>P
xnoremap <C-w>z <C-w>z
nnoremap <C-w>` <C-w>g}
nnoremap <C-w>g] <C-w>g]
nnoremap <C-w>gg <C-w>g<C-]>
nnoremap <C-w>g} <C-w>g}
xnoremap <C-w>g] <C-w>g]
xnoremap <C-w>gg <C-w>g<C-]>
xnoremap <C-w>g} <C-w>g}
nnoremap <C-w>i <C-w>i
nnoremap <C-w>d <C-w>d
xnoremap <C-w>i <C-w>i
xnoremap <C-w>d <C-w>d
nnoremap <C-w>f :<C-u>execute finddir(expand('<cfile>')) !=# '' ? 'Defx ' . finddir(expand('<cfile>')) : 'sfind <cfile>'<CR>
xnoremap <C-w>f y:execute finddir(<C-r>0) !=# '' ? 'Defx ' . finddir(<C-r>0) : 'sfind <C-r>0'<CR>
nnoremap <C-w>F :<C-u>execute finddir(expand('<cfile>')) !=# '' ? 'cd ' . expand('<cfile>') : 'sfind <cfile>'<CR>
xnoremap <C-w>F y:execute finddir(<C-r>0) !=# '' ? 'cd ' . finddir(<C-r>0) : 'sfind <C-r>0'<CR>
" 4}}} windowOpen "
" windowClose {{{4 "
nnoremap <C-w>c <C-w>c
nnoremap <C-w>o <C-w>o
nnoremap <C-w>q <C-w>q
xnoremap <C-w>c <C-w>c
xnoremap <C-w>o <C-w>o
xnoremap <C-w>q <C-w>q
nnoremap <C-w>a :qall<CR>
xnoremap <C-w>a :<C-u>qall<CR>
nnoremap <C-w>Z :hide<CR>
xnoremap <C-w>Z :<C-u>hide<CR>
" 4}}} windowClose "
" fold+- {{{4 "
nnoremap zd zd
nnoremap zD zD
nnoremap zE zE
xnoremap zd zd
xnoremap zD zD
xnoremap zE zE
" 4}}} fold+- "
" fold open&close {{{4 "
nnoremap zV zMzv
xnoremap zV zMzv
onoremap zV zMzv
" 4}}} fold open&close "
" spell {{{4 "
nnoremap z= z=
nnoremap zg zg
nnoremap zG zG
nnoremap zw zw
nnoremap zW zW
nnoremap zug zug
nnoremap zuG zuG
nnoremap zuw zuw
nnoremap zuW zuW
" 4}}} spell "
" fileSwitch {{{4 "
nnoremap gf gf
nnoremap gF gF
nnoremap g] g]
nnoremap g} g<C-]>
xnoremap gf gf
xnoremap gF gF
xnoremap g] g]
xnoremap g} g<C-]>
nnoremap gd gd
nnoremap gD gD
xnoremap gd gd
xnoremap gD gD
" 4}}} fileSwitch "
" virtual {{{4 "
nnoremap gr gr
nnoremap gR gR
" 4}}} virtual "
" last {{{4 "
nnoremap gv gv
nnoremap g& g&
xnoremap gv gv
xnoremap g& g&
nnoremap gi gi
xnoremap gi gi
" 4}}} last "
" show {{{4 "
nnoremap ga ga
nnoremap g8 g8
nnoremap 8g8 8g8
nnoremap g< g<
xnoremap g< g<
" 4}}} show "
" edit {{{4 "
xnoremap g<C-a> g<C-a>
xnoremap g<C-x> g<C-x>
nnoremap gJ gJ
nnoremap gp gp
nnoremap gP gP
xnoremap gJ gJ
xnoremap gp gp
xnoremap gP gP
nnoremap gu gu
nnoremap gU gU
nnoremap g? g?
xnoremap g? g?
nnoremap g@ g@
xnoremap g@ g@
nnoremap g~ g~
xnoremap g~ g~
" 4}}} edit "
" tpope/vim-unimpaired {{{3 "
nmap y<Space> <Plug>unimpairedBlankUp<Plug>unimpairedBlankDown
" 3}}} tpope/vim-unimpaired "
" tpope/vim-rsi {{{3 "
cnoremap <C-k> <C-f>i<C-o>:set virtualedit +=onemore<CR><C-o>d$<C-o>:set virtualedit -=onemore<CR><C-c>
cnoremap <C-\> <C-k>
snoremap <C-b> <Left>
snoremap <C-f> <Right>
snoremap <C-n> <Down>
snoremap <C-p> <Up>
snoremap <C-a> <Home>
snoremap <C-e> <End>
snoremap <C-y> <C-g>pgv<C-g>
" 3}}} tpope/vim-rsi "
" 2}}} Hotkey "

" KeyMap {{{2 "
" vim-scripts/VimIM {{{3 "
set imdisable
let g:Vimim_punctuation = 3
let g:Vimim_map = 'no-gino-tabc-space'
nnoremap zi a<C-R>=g:Vimim_gi()<CR>
let g:Vimim_plugin = $VIMDATA.'/.VimIM'
let g:Vimim_shuangpin = 'ms'
" 3}}} vim-scripts/VimIM "
" 2}}} KeyMap "

" MacroExplore {{{2 "
" vim-scripts/marvim {{{3 "
let g:marvim_store = $VIMDATA.'/.marvim'
let g:marvim_find_key = 'q)'
let g:marvim_store_key = 'q('
let g:marvim_register = 'q'
" 3}}} vim-scripts/marvim "
" dohsimpson/vim-macroeditor {{{3 "
nnoremap q_ :<C-u>MacroEdit<Space>
" 3}}} dohsimpson/vim-macroeditor "
" 2}}} MacroExplore "
" 1}}} Interaction "

" Appearance {{{1 "
" Colorscheme {{{2 "
" reedes/vim-thematic {{{3 "
source $VIMDATA/thematic.vim
augroup init_ThematicRandom "{{{
	autocmd!
	autocmd VimEnter * ThematicRandom
				\| highlight Conceal guibg=NONE
	autocmd ColorScheme * highlight Conceal guibg=NONE
augroup END "}}}
nnoremap [X :ThematicPrevious<CR>
nnoremap ]X :ThematicNext<CR>
nnoremap [Y :ThematicFirst<CR>
nnoremap ]Y :ThematicFirst<CR>:ThematicPrevious<CR>
" 3}}} reedes/vim-thematic "
" 2}}} Colorscheme "

" Highlight {{{2 "
" luochen1990/rainbow {{{3 "
let g:rainbow_active = 1
augroup init_syntax "{{{
	autocmd!
	autocmd VimEnter * autocmd Syntax * call rainbow_main#load()
augroup END "}}}
" 3}}} luochen1990/rainbow "
if has('pythonx')
	" jaxbot/semantic-highlight.vim {{{3 "
	let g:semanticPersistCacheLocation = $VIMDATA.'/.semantic-highlight.vim/.semantic-highlight-cache'
	" 3}}} jaxbot/semantic-highlight.vim "
endif
" nathanaelkane/vim-indent-guides {{{3 "
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_default_mapping = 0
let g:indent_guides_exclude_filetypes = ['help', 'man', 'less', 'duzzle', 'startify', 'calendar', 'python', 'yaml', 'tex', 'plaintex', 'context', 'markdown', 'pandoc', 'floaterm', 'defx', 'text']
" 3}}} nathanaelkane/vim-indent-guides "
" dbmrq/vim-redacted {{{3 "
nmap gz <Plug>Redact
vmap gz <Plug>Redact
" 3}}} dbmrq/vim-redacted "
" Soares/longline.vim {{{3 "
nmap [J <Plug>longline#next
nmap ]J <Plug>longline#prev
" 3}}} Soares/longline.vim "
" 2}}} Highlight "

" Conceal {{{2 "
" ryanoasis/vim-devicons {{{3 "
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {
			\ 'commonmark': '',
			\ 'pandoc': '',
			\ 'html5': '',
			\ 'docbook': '',
			\ 'docbook5': '',
			\ 'patch': '',
			\ 'aap': '',
			\ 'tex': '',
			\ 'latex': '',
			\ 'context': '',
			\ 'beamer': '',
			\ 'inp': '',
			\ 'tikz': '',
			\ 'lyx': '',
			\ 'layout': '',
			\ 'cls': '',
			\ 'sty': '',
			\ 'mtx': '',
			\ 'bib': '',
			\ 'bst': '',
			\ 'ist': '',
			\ 'cir': '',
			\ 'ahk': '',
			\ 'mkd': '',
			\ 'OutJob': '',
			\ 'lnk': '',
			\ 'csv': '',
			\ 'tsv': '',
			\ 'dat': '',
			\ 'ppt': '',
			\ 'pptx': '',
			\ 'xls': '',
			\ 'xlsx': '',
			\ 'xlt': '',
			\ 'xltx': '',
			\ 'doc': '',
			\ 'docx': '',
			\ 'dot': '',
			\ 'dotx': '',
			\ 'gv': '',
			\ 'jar': '',
			\ 'snippets': '',
			\ 'fountain': '',
			\ 'txt': '',
			\ 'u8': '',
			\ 'plain': '',
			\ 'rtf': '',
			\ 'cnx': '中',
			\ 'jax': '日',
			\ 'caj': '知',
			\ 'pdg': '超',
			\ 'e': '易',
			\ 'vcf': '',
			\ 'log': '',
			\ 'rpt': '',
			\ 'backup': '',
			\ 'bin': '',
			\ 'rst': '',
			\ 'm': '',
			\ 'matlab': '',
			\ 'oct': '',
			\ 'fig': '',
			\ 'mat': '',
			\ 'mma': '',
			\ 'r': '',
			\ 's': '',
			\ 'sas': '',
			\ 'asm': '',
			\ 'lingo': '',
			\ 'vi': '',
			\ 'tcl': '',
			\ 'qsf': '',
			\ 'qip': '',
			\ 'el': '',
			\ 'woff': '',
			\ 'woff2': '',
			\ 'ttc': '',
			\ 'fon': '',
			\ 'ttf': '',
			\ 'otf': '',
			\ 'eot': '',
			\ 'svg': '',
			\ 'opf': '',
			\ 'xml': '',
			\ 'inx': '',
			\ 'cof': '',
			\ 'ino': '',
			\ 'cs': '',
			\ 'csproj': '',
			\ 'qml': '',
			\ 'mysql': '',
			\ 'pdf': '',
			\ 'bmp': '',
			\ 'png': '',
			\ 'jpg': '',
			\ 'jpeg': '',
			\ 'cmd': '',
			\ 'bat': '',
			\ 'cfg': '',
			\ 'crx': '',
			\ 'hex': '',
			\ 'project': '',
			\ 'zip': '',
			\ 'rar': '',
			\ '7z': '',
			\ 'tar': '',
			\ 'gz': '',
			\ 'v': '',
			\ 'vh': '',
			\ 'vl': '',
			\ 'vlg': '',
			\ 'verilog': '',
			\ 'vt': '',
			\ 'vo': '',
			\ 'sv': '',
			\ 'vhd': '',
			\ 'vhdl': '',
			\ 'vht': '',
			\ 'cmp': '',
			\ 'tdf': '',
			\ 'inc': '',
			\ 'mif': '',
			\ 'vsd': '',
			\ 'vsdx': '',
			\ 'dia': '',
			\ 'torrent': '',
			\ 'ms7': '',
			\ 'ms8': '',
			\ 'ms9': '',
			\ 'ms10': '',
			\ 'ms11': '',
			\ 'ms12': '',
			\ 'ms13': '',
			\ 'ms14': '',
			\ 'ks': '',
			\ 'avi': '',
			\ 'mv': '',
			\ 'exe': '',
			\ 'com': '',
			\ 'msi': '',
			\ 'out': '',
			\ 'deb': '',
			\ 'rpm': '',
			\ 'ebuild': '',
			\ 'install': '',
			\ 'apk': '',
			\ 'ipa': '',
			\ 'dmg': '',
			\ 'lib': '',
			\ 'dll': '',
			\ 'vb': '',
			\ 'f': '',
			\ 'pas': '',
			\ 'yml': '',
			\ 'yaml': '',
			\ 'toml': '',
			\ 'desktop': '',
			\ 'theme': '',
			\ 'list': '',
			\ 'directory': '',
			\ 'mp3': '',
			\ 'mp4': '',
			\ 'wav': '',
			\ 'rm': '',
			\ 'ada': '',
			\ 'map': '',
			\ 'tags': '',
			\ 'sys': '',
			\ '3mf': '',
			\ 'stp': '',
			\ 'schprj': '',
			\ 'schdoc': '',
			\ 'prjpcb': '',
			\ 'intlib': '',
			\ 'download': '',
			\ 'downloading': '',
			\ 'aria2': '',
			\ 'cache': '',
			\ 'fmt': '',
			\ 'tmp': '',
			\ 'temp': '',
			\ 'pmx': '',
			\ 'pygtex': '',
			\ 'pygstyle': '',
			\ 'aux': '',
			\ 'bbl': '',
			\ 'blg': '',
			\ 'idx': '',
			\ 'ind': '',
			\ 'ilg': '',
			\ 'nlo': '',
			\ 'nls': '',
			\ 'lof': '',
			\ 'lot': '',
			\ 'loe': '',
			\ 'upa': '',
			\ 'upb': '',
			\ 'toc': '',
			\ 'acn': '',
			\ 'acr': '',
			\ 'alg': '',
			\ 'glg': '',
			\ 'glo': '',
			\ 'gls': '',
			\ 'fls': '',
			\ 'fdb_latexmk': '',
			\ 'brf': '',
			\ 'cmap': '',
			\ 'mw': '',
			\ 'mx1': '',
			\ 'pyg': '',
			\ 'gnuplot': '',
			\ 'nav': '',
			\ 'snm': '',
			\ 'vrb': '',
			\ 'listing': '',
			\ 'xdv': '',
			\ 'dvi': '',
			\ 'nsi': '',
			\ 'ipynb': '',
			\ }
let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols = {
			\ '.*\.todo\.txt$': '',
			\ '.*\.dia\.autosave$': '',
			\ '.*\.paf\.exe$': '',
			\ '.*\.search-ms$': '',
			\ '.*\.ms14 (Security copy)$': '',
			\ '.*\.synctex(busy)$': '',
			\ 'Dockerfile$': '',
			\ 'Makefile$': '',
			\ '\.octaverc$': '',
			\ '\.pyrc$': '',
			\ '\.editorconfig$': '',
			\ '\.inputrc$': '',
			\ '\.bash_profile$': '',
			\ 'profile$': '',
			\ '\.gitignore$': '',
			\ 'index$': '',
			\ 'HEAD$': '',
			\ 'FETCH_HEAD$': '',
			\ 'config$': '',
			\ 'description$': '',
			\ '\.github$': '',
			\ '.*_history$': '',
			\ '\.viminfo$': '',
			\ 'tags$': '',
			\ }
" 3}}} ryanoasis/vim-devicons "
" Yggdroot/indentLine {{{ "
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
" }}} Yggdroot/indentLine "
" 2}}} Conceal "

" StatusBar {{{2 "
" bling/vim-airline {{{3 "
set showtabline=2
let g:airline_powerline_fonts = 1
let g:airline_left_sep = get(g:, 'Lf_StlSeparator', {'left': ''})['left']
let g:airline_left_alt_sep = ''
let g:airline_right_sep = get(g:, 'Lf_StlSeparator', {'right': ''})['right']
let g:airline_right_alt_sep = ''
let g:airline_symbols = {
			\ 'paste': '',
			\ 'spell': 'Ꞩ',
			\ 'whitespace': '█',
			\ 'notexists': 'Ɇ',
			\ }
augroup init_titlestring "{{{
	autocmd!
	autocmd Filetype * let &titlestring = '%<%F ' . get(g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols, &filetype, '') . '%=%P' . get(g:, airline_symbols.linenr, 'Ξ') . '%l/%L' . get(g:, 'airline_symbols.maxlinenr', '')
augroup END "}}}
nmap <C-w>1 <Plug>AirlineSelectTab1
nmap <C-w>2 <Plug>AirlineSelectTab2
nmap <C-w>3 <Plug>AirlineSelectTab3
nmap <C-w>4 <Plug>AirlineSelectTab4
nmap <C-w>5 <Plug>AirlineSelectTab5
nmap <C-w>6 <Plug>AirlineSelectTab6
nmap <C-w>7 <Plug>AirlineSelectTab7
nmap <C-w>8 <Plug>AirlineSelectTab8
nmap <C-w>9 <Plug>AirlineSelectTab9
nmap <C-w>; <Plug>AirlineSelectPrevTab
nmap <C-w>, <Plug>AirlineSelectNextTab
" ale {{{4 "
let g:airline#extensions#ale#error_symbol = '✗'
let g:airline#extensions#ale#warning_symbol = ''
let g:airline#extensions#ale#open_lnum_symbol = 'Ξ'
let g:airline#extensions#ale#close_lnum_symbol = ''
" 4}}} ale "
" coc {{{4 "
let airline#extensions#coc#error_symbol = '✗'
let airline#extensions#coc#warning_symbol = ''
" 4}}} coc "
" quickfix {{{4 "
let g:airline#extensions#quickfix#quickfix_text = ''
let g:airline#extensions#quickfix#location_text = ''
" 4}}} quickfix "
" vimtex {{{4 "
let g:airline#extensions#vimtex#left = get(g:, 'airline_alt_left_sep', '')
let g:airline#extensions#vimtex#right = get(g:, 'airline_alt_right_sep', '')
let g:airline#extensions#vimtex#main = ''
let g:airline#extensions#vimtex#sub_main = ''
let g:airline#extensions#vimtex#sub_local = ''
let g:airline#extensions#vimtex#compiled = '✔'
let g:airline#extensions#vimtex#continuous = ''
let g:airline#extensions#vimtex#viewer = ''
" 4}}} vimtex "
" tabline {{{4 "
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#show_close_button = 1
let g:airline#extensions#tabline#buffers_label = ''
let g:airline#extensions#tabline#tabs_label = ''
let g:airline#extensions#tabline#close_symbol = '✗'
let g:airline#extensions#tabline#overflow_marker = '…'
let g:airline#extensions#tabline#buffer_idx_format = {
			\ '1': '① ',
			\ '2': '② ',
			\ '3': '③ ',
			\ '4': '④ ',
			\ '5': '⑤ ',
			\ '6': '⑥ ',
			\ '7': '⑦ ',
			\ '8': '⑧ ',
			\ '9': '⑨ ',
			\ '10': '⑩ ',
			\ '11': '⑪ ',
			\ '12': '⑫ ',
			\ '13': '⑬ ',
			\ '14': '⑭ ',
			\ '15': '⑮ ',
			\ '16': '⑯ ',
			\ '17': '⑰ ',
			\ '18': '⑱ ',
			\ '19': '⑲ ',
			\ '20': '⑳ ',
			\ }
" 4}}} tabline "
" wordcount {{{4 "
let g:airline#extensions#wordcount#filetypes =['all']
" 4}}} wordcount "
" capslock {{{4 "
let g:airline#extensions#capslock#symbol = '隷'
" 4}}} capslock "
" whitespace {{{4 "
let g:airline#extensions#whitespace#trailing_format = '█%s'
let g:airline#extensions#whitespace#mixed_indent_format =
			\ '%s'
let g:airline#extensions#whitespace#long_format = '…%s'
let g:airline#extensions#whitespace#mixed_indent_file_format =
			\ '✗%s'
let g:airline#extensions#whitespace#conflicts_format = '%s'
" 4}}} whitespace "
" 3}}} bling/vim-airline "
" Wildog/airline-weather.vim {{{3 "
let g:weather#appid = readfile($VIMDATA.'/airline-weather.txt')[0]
let g:weather#area = readfile($VIMDATA.'/airline-weather.txt')[1]
" 3}}} Wildog/airline-weather.vim "
" Zuckonit/vim-airline-todo {{{3 "
let g:todo#directory = $VIMDATA.'/.vim-airline-todo'
let g:todo#remind = ''
let g:todo#suffix = ''
" 3}}} Zuckonit/vim-airline-todo "
" 2}}} StatusBar "

" Display {{{2 "
"  {{{3 "
if has('gui_running')
	set lines=99
	set columns=999
	if has('win32')
		augroup init_simalt "{{{
			autocmd!
			autocmd VimEnter * simalt ~x
		augroup END "}}}
	endif
endif
set lazyredraw
set cursorcolumn
set cursorline
set number
set relativenumber
set listchars=extends:→,precedes:←,nbsp:+
execute 'set fillchars=vert:\|,fold:' . get(g:, 'airline#extensions#tabline#overflow_marker', '…')
set display=uhex
set mouse=a
set whichwrap+=h,l,<,>,~,[,]
set virtualedit=block
set scrolloff=3
set showcmd
augroup init_vim "{{{
	autocmd!
	autocmd VimResized * wincmd =
	autocmd BufRead * call init#locate()
augroup END "}}}
function! init#locate() "{{{
	if line("'\"") > 1 && line("'\"") <= line('$')
		execute 'normal! g`"'
	endif
endfunction "}}}
" 3}}}  "
" junegunn/limelight.vim {{{3  "
augroup init_Goyo "{{{
	autocmd!
	autocmd! User GoyoEnter Limelight
	autocmd! User GoyoLeave Limelight!
augroup END "}}}
" 3}}} junegunn/limelight.vim "
" Kjwon15/vim-transparent {{{3  "
augroup init_transparent "{{{
	autocmd!
	autocmd BufWinEnter * execute has('gui_running') ? '' : 'ClearBackground'
augroup END "}}}
" 3}}} Kjwon15/vim-transparent "
" 2}}} Display "

" SyntaxMarkUp {{{2 "
"  {{{3 "
command! -nargs=1 Help call init#help#main(<q-args>)
set keywordprg=:Man
let g:tex_flavor = 'latex'
let g:filetype_m = 'octave'
let g:asmsyntax = 'masm'
let g:load_doxygen_syntax = 1
" 3}}}  "
" sheerun/vim-polyglot {{{3 "
let g:polyglot_disabled = ['markdown', 'less']
" 3}}} sheerun/vim-polyglot "
" vim-pandoc/vim-pandoc-syntax {{{3 "
let g:pandoc#syntax#codeblocks#embeds#langs = ['vim']
" 3}}} vim-pandoc/vim-pandoc-syntax "
" 2}}} SyntaxMarkUp "

" SyntaxScript {{{2 "
" 2}}} SyntaxScript "

" SyntaxCompile {{{2 "
" 2}}} SyntaxCompile "

" Fold {{{2 "
"  {{{3 "
let g:javaScript_fold = 1
let g:perl_fold = 1
let g:php_folding = 1
let g:r_syntax_folding = 1
let g:ruby_fold = 1
let g:sh_fold_enabled = 1
let g:vimsyn_folding = 'af'
let g:xml_syntax_folding = 1
set foldmethod=syntax
" 3}}}  "
" dbmrq/vim-chalk {{{3 "
let g:chalk_align = 0
let g:chalk_space_before = 1
vmap zf <Plug>Chalk
nmap zf <Plug>Chalk
nmap zF <Plug>ChalkRange
nmap zp <Plug>SingleChalk
nmap zP <Plug>SingleChalkUp
nmap z> <Plug>ChalkUp
nmap z< <Plug>ChalkDown
vmap z> <Plug>ChalkUp
vmap z< <Plug>ChalkDown
" 3}}} dbmrq/vim-chalk "
" Konfekt/FastFold {{{3 "
let g:fastfold_fold_command_suffixes = [
			\ 'x', 'X', 'a', 'A', 'o', 'O', 'c', 'C',
			\ 'm', 'M', 'r', 'R', 'v',
			\ ]
nmap [Z 99[z
nmap ]Z 99]z
xmap [Z 99[z
xmap ]Z 99]z
omap [Z 99[z
omap ]Z 99]z
" 3}}} Konfekt/FastFold "
" embear/vim-foldsearch {{{3 "
let g:foldsearch_disable_mappings = 1
" 3}}} embear/vim-foldsearch "
" 2}}} Fold "
" 1}}} Appearance "

" CursorMove {{{1 "
" TagExplore {{{2 "
" ludovicchabant/vim-gutentags {{{3 "
let g:gutentags_ctags_tagfile = '.tags'
let g:gutentags_cache_dir = $VIMDATA.'/.vim-gutentags'
let g:gutentags_modules = ['ctags', 'cscope']
" 3}}} ludovicchabant/vim-gutentags "
" skywind3000/gutentags_plus {{{3 "
let g:gutentags_plus_nomap = 1
" 3}}} skywind3000/gutentags_plus "
" liuchengxu/vista.vim {{{3 "
let g:vista_sidebar_width = &columns / 4
let g:vista_fold_toggle_icons = ['', '']
let g:vista_close_on_jump = 1
" 3}}} liuchengxu/vista.vim "
" xltan/LeaderF-tjump {{{3 "
nnoremap g<C-]> :LeaderfTjump <C-r><C-w><CR>
" 3}}} xltan/LeaderF-tjump "
" 2}}} TagExplore "

" MarkExplore {{{2 "
" kshenoy/vim-signature {{{3 "
nmap m_ dm
" 3}}} kshenoy/vim-signature "
" 2}}} MarkExplore "

" Move {{{2 "
" easymotion/vim-easymotion {{{3 "
nmap co <Plug>(easymotion-prefix)
xmap co <Plug>(easymotion-prefix)
omap co <Plug>(easymotion-prefix)
xmap co; <Plug>(easymotion-bd-f)
nmap co; <Plug>(easymotion-overwin-f)
xmap co, <Plug>(easymotion-bd-f2)
nmap co, <Plug>(easymotion-overwin-f2)
xmap coo <Plug>(easymotion-bd-jk)
nmap coo <Plug>(easymotion-overwin-line)
xmap co<Space> <Plug>(easymotion-bd-w)
nmap co<Space> <Plug>(easymotion-overwin-w)
" 3}}} easymotion/vim-easymotion "
" psliwka/vim-smoothie {{{3 "
nnoremap <C-D> :<C-U>call smoothie#downwards()<CR>
nnoremap <C-U> :<C-U>call smoothie#upwards()<CR>
nnoremap <C-F> :<C-U>call smoothie#forwards()<CR>
nnoremap <C-B> :<C-U>call smoothie#backwards()<CR>
" 3}}} psliwka/vim-smoothie "
" reedes/vim-wheel {{{3 "
nmap z[ <Plug>(WheelUp)
xmap z[ <Plug>(WheelUp)
nmap z] <Plug>(WheelDown)
xmap z] <Plug>(WheelDown)
nmap z{ <Plug>(WheelLeft)
xmap z{ <Plug>(WheelLeft)
nmap z} <Plug>(WheelRight)
xmap z} <Plug>(WheelRight)
" 3}}} reedes/vim-wheel "
" andymass/vim-matchup {{{3 "
set showmatch
let g:loaded_matchit = 1
nmap [h <plug>(matchup-g%)
omap [h <plug>(matchup-g%)
xmap [h <plug>(matchup-g%)
nmap ]h <plug>(matchup-%)
omap ]h <plug>(matchup-%)
xmap ]h <plug>(matchup-%)
nmap [H <plug>(matchup-[%)
omap [H <plug>(matchup-[%)
xmap [H <plug>(matchup-[%)
nmap ]H <plug>(matchup-]%)
omap ]H <plug>(matchup-]%)
xmap ]H <plug>(matchup-]%)
xmap ah <plug>(matchup-a%)
xmap ih <plug>(matchup-i%)
omap ah <plug>(matchup-a%)
omap ih <plug>(matchup-i%)
nmap dsh <plug>(matchup-ds%)
nmap csh <plug>(matchup-cs%)
" 3}}} andymass/vim-matchup "
" wesQ3/vim-windowswap {{{3 "
let g:windowswap_map_keys = 0 "prevent default bindings
nnoremap <C-w>y :<C-u>call WindowSwap#EasyWindowSwap()<CR>
" 3}}} wesQ3/vim-windowswap "
" 2}}} Move "

" Search {{{2 "
"  {{{3 "
set hlsearch
set ignorecase
set wrapscan
if exists('&inccommand')
	set inccommand=nosplit
endif
xmap <Leader>* "sy<Esc>/\V\C<C-r>s<CR>
xmap <Leader># "sy<Esc>?\V\C<C-r>s<CR>
" 3}}}  "
" justinmk/vim-sneak {{{3 "
let g:sneak#s_next = 1
let g:sneak#label = 1
nmap f <Plug>Sneak_f
xmap f <Plug>Sneak_f
omap f <Plug>Sneak_f
nmap F <Plug>Sneak_F
xmap F <Plug>Sneak_F
omap F <Plug>Sneak_F
nmap t <Plug>Sneak_t
xmap t <Plug>Sneak_t
omap t <Plug>Sneak_t
nmap T <Plug>Sneak_T
xmap T <Plug>Sneak_T
omap T <Plug>Sneak_T
nmap z; <Plug>Sneak_;
xmap z; <Plug>Sneak_;
omap z; <Plug>Sneak_;
nmap z, <Plug>Sneak_,
xmap z, <Plug>Sneak_,
omap z, <Plug>Sneak_,
nmap z/ <Plug>SneakLabel_s
xmap z/ <Plug>SneakLabel_s
omap z/ <Plug>SneakLabel_s
nmap z? <Plug>SneakLabel_S
xmap z? <Plug>SneakLabel_S
omap z? <Plug>SneakLabel_S
" 3}}} justinmk/vim-sneak "
" haya14busa/is.vim {{{3 "
nmap n <Plug>(is-nohl)<Plug>(anzu-n-with-echo)
nmap N <Plug>(is-nohl)<Plug>(anzu-N-with-echo)
xmap n <Plug>(is-n)<Plug>(anzu-n-with-echo)
xmap N <Plug>(is-n)<Plug>(anzu-N-with-echo)
nmap * <Plug>(is-*)
nmap # <Plug>(is-#)
nmap g* <Plug>(is-g*)
nmap g# <Plug>(is-g#)
xmap * <Plug>(is-*)
xmap # <Plug>(is-#)
xmap g* <Plug>(is-g*)
xmap g# <Plug>(is-g#)
" 3}}} haya14busa/is.vim "
" haya14busa/incsearch-easymotion.vim {{{3 "
nmap / <Plug>(incsearch-easymotion-stay)
xmap / <Plug>(incsearch-easymotion-stay)
omap / <Plug>(incsearch-easymotion-stay)
" 3}}} haya14busa/incsearch-easymotion.vim "
" haya14busa/incsearch-fuzzy.vim {{{3 "
nnoremap <expr> ? incsearch#go(init#fuzzymotion#main({'is_stay': 1}))
xnoremap <expr> ? incsearch#go(init#fuzzymotion#main({'is_stay': 1}))
onoremap <expr> ? incsearch#go(init#fuzzymotion#main({'is_stay': 1}))
" 3}}} haya14busa/incsearch-fuzzy.vim "
" luochen1990/select-and-searce {{{3 "
let g:select_and_search_active = 4
xnoremap n :<C-u>let @/=select_and_search#get_search_pat()<CR><Esc>n
xnoremap N :<C-u>let @/=select_and_search#get_search_pat()<CR><Esc>N
xnoremap zn n
xnoremap zN N
" 3}}} luochen1990/select-and-searce "
" 2}}} Search "

" Replace {{{2 "
" svermeulen/vim-subversive {{{3 "
nmap , <plug>(SubversiveSubstitute)
xmap p <plug>(SubversiveSubstitute)
nmap ,, <plug>(SubversiveSubstituteToEndOfLine)
nmap z- <plug>(SubversiveSubstituteRange)
xmap - <plug>(SubversiveSubstituteRange)
nmap - <plug>(SubversiveSubstituteWordRange)
nmap -- <plug>(SubversiveSubstituteWordRange)$
nmap z_ <plug>(SubversiveSubstituteRangeConfirm)
xmap _ <plug>(SubversiveSubstituteRangeConfirm)
nmap _ <plug>(SubversiveSubstituteWordRangeConfirm)
nmap __ <plug>(SubversiveSubstituteWordRangeConfirm)$
" 3}}} svermeulen/vim-subversive "

" kurkale6ka/vim-swap {{{3 "
xmap [= <plug>SwapSwapPivotOperands
xmap ]= <plug>SwapSwapOperands
nmap [= <plug>SwapSwapWithL_WORD
nmap ]= <plug>SwapSwapWithR_WORD
" 3}}} kurkale6ka/vim-swap "

" JikkuJose/vim-VisIncr {{{3 "
xnoremap <Leader>Ii :I<Space>
xnoremap <Leader>Ia :IA<Space>
xnoremap <Leader>Ib :IB<Space>
xnoremap <Leader>Io :IO<Space>
xnoremap <Leader>Ix :IX<Space>
xnoremap <Leader>Id :ID<Space>
xnoremap <Leader>Im :IM<Space>
xnoremap <Leader>ID :IDMY<Space>
xnoremap <Leader>IM :IMDY<Space>
xnoremap <Leader>IY :IYMD<Space>
xnoremap <Leader>II :II<Space>
xnoremap <Leader>IA :IIA<Space>
xnoremap <Leader>IB :IIB<Space>
xnoremap <Leader>IO :IIO<Space>
xnoremap <Leader>IX :IIX<Space>
" 3}}} JikkuJose/vim-VisIncr "
" 2}}} Replace "
" 1}}} CursorMove "

" CursorVisual {{{1 "
" Select {{{2 "
" mg979/vim-visual-multi {{{3 "
let g:VM_leader = '<Leader>m'
let g:VM_maps = {}
let g:VM_maps['Find Under'] = g:VM_leader.'m'
let g:VM_maps['Find Subword Under'] = g:VM_leader.'m'
let g:VM_maps['Get Operator'] = g:VM_leader.'g'
let g:VM_maps['Reselect Last'] = g:VM_leader.'r'
let g:VM_maps['Add Cursor At Pos'] = g:VM_leader.'a'
let g:VM_maps['Select Cursor Up'] = g:VM_leader.'k'
let g:VM_maps['Select Cursor Down'] = g:VM_leader.'j'
let g:VM_maps['Select Cursor Left'] = g:VM_leader.'h'
let g:VM_maps['Select Cursor Right'] = g:VM_leader.'l'
" 3}}} mg979/vim-visual-multi "
" 2}}} Select "

" TextObjChar {{{2 "
"  {{{3 "
xnoremap iw iw
xnoremap iW iW
xnoremap aw aw
xnoremap aW aW
onoremap iw iw
onoremap iW iW
onoremap aw aw
onoremap aW aW
xnoremap ip ip
xnoremap ap ap
onoremap ip ip
onoremap ap ap
" 3}}}  "
" wellle/targets.vim {{{3 "
let g:targets_aiAI = 'aiAI'
let g:targets_nl = 'nN'
xmap <expr> <plug>(init-targets-I) targets#e('x', 'I', 'I')
xmap <expr> <plug>(init-targets-A) targets#e('x', 'A', 'A')
omap <expr> <plug>(init-targets-I) targets#e('o', 'I', 'I')
omap <expr> <plug>(init-targets-A) targets#e('o', 'A', 'A')
xmap <expr> <plug>(init-targets-i) targets#e('x', 'i', 'i')
xmap <expr> <plug>(init-targets-a) targets#e('x', 'a', 'a')
omap <expr> <plug>(init-targets-i) targets#e('o', 'i', 'i')
omap <expr> <plug>(init-targets-a) targets#e('o', 'a', 'a')
for s:target in ['(', ')', '[', ']', '{', '}', '<', '>', 'B', 't', 'b',
			\ "'", '"', '`', 'q', 'a',
			\ ',', '.', ';', '+', '-', '=', '~', '_', '*', '#',
			\ '/', '<Bar>', '\', '&', '$',
			\ g:targets_nl[0], g:targets_nl[1],
			\ ]
	for s:key in [g:targets_aiAI[0], g:targets_aiAI[1], g:targets_aiAI[2], g:targets_aiAI[3],]
		execute 'xmap '.s:key.s:target.' <plug>(init-targets-'.s:key.')'.s:target
		execute 'omap '.s:key.s:target.' <plug>(init-targets-'.s:key.')'.s:target
	endfor
endfor
" 3}}} wellle/targets.vim "
" thinca/vim-textobj-between {{{3 "
let g:textobj_between_no_default_key_mappings = 1
xmap x <Plug>(textobj-between-i)
xmap X <Plug>(textobj-between-a)
omap x <Plug>(textobj-between-i)
omap X <Plug>(textobj-between-a)
" 3}}} thinca/vim-textobj-between "
" reedes/vim-textobj-quote {{{3 "
let g:textobj#quote#doubleMotion = 'jj'
let g:textobj#quote#singleMotion = 'jJ'
xmap sj <Plug>SurroundWithDouble
xmap sJ <Plug>SurroundWithSingle
" 3}}} reedes/vim-textobj-quote "
" 2}}} TextObjChar "

" TextObjSymbol {{{2 "
"  {{{3 "
xnoremap iG g^og$
xnoremap aG g0og$
" 3}}}  "
" kana/vim-textobj-entire {{{3 "
let g:textobj_entire_no_default_key_mappings = 1
xmap i0 <Plug>(textobj-entire-i)
xmap a0 <Plug>(textobj-entire-a)
omap i0 <Plug>(textobj-entire-i)
omap a0 <Plug>(textobj-entire-a)
" 3}}} kana/vim-textobj-entire "
" coderifous/textobj-word-column.vim {{{3 "
let g:skip_default_textobj_word_column_mappings = 1
xnoremap a<Tab> :<C-u>call TextObjWordBasedColumn("aw")<CR>
xnoremap A<Tab> :<C-u>call TextObjWordBasedColumn("aW")<CR>
xnoremap i<Tab> :<C-u>call TextObjWordBasedColumn("iw")<CR>
xnoremap I<Tab> :<C-u>call TextObjWordBasedColumn("iW")<CR>
onoremap a<Tab> :<C-u>call TextObjWordBasedColumn("aw")<CR>
onoremap A<Tab> :<C-u>call TextObjWordBasedColumn("aW")<CR>
onoremap i<Tab> :<C-u>call TextObjWordBasedColumn("iw")<CR>
onoremap I<Tab> :<C-u>call TextObjWordBasedColumn("iW")<CR>
" 3}}} coderifous/textobj-word-column.vim "
" saaguero/vim-textobj-pastedtext {{{3 "
nmap gb vgb
" 3}}} saaguero/vim-textobj-pastedtext "
" 2}}} TextObjSymbol "

" TextObjSyntax {{{2 "
" glts/vim-textobj-comment {{{3 "
let g:textobj_comment_no_default_key_mappings = 1
xmap ar <Plug>(textobj-comment-a)
xmap ir <Plug>(textobj-comment-i)
xmap aR <Plug>(textobj-comment-big-a)
omap ar <Plug>(textobj-comment-a)
omap ir <Plug>(textobj-comment-i)
omap aR <Plug>(textobj-comment-big-a)
" 3}}} glts/vim-textobj-comment "
" 2}}} TextObjSyntax "

" TextObjContent {{{2 "
" Chun-Yang/vim-textobj-chunk {{{3 "
let g:textobj_chunk_no_default_key_mappings = 1
omap ak <Plug>(textobj-chunk-a)
xmap ak <Plug>(textobj-chunk-a)
omap ik <Plug>(textobj-chunk-i)
xmap ik <Plug>(textobj-chunk-i)
" 3}}} Chun-Yang/vim-textobj-chunk "
" kana/vim-textobj-datetime {{{3 "
let g:textobj_datetime_no_default_key_mappings = 1
xmap aTa <Plug>(textobj-datetime-auto)
xmap aTd <Plug>(textobj-datetime-date)
xmap aTf <Plug>(textobj-datetime-full)
xmap aTt <Plug>(textobj-datetime-time)
xmap aTz <Plug>(textobj-datetime-tz)
xmap iTa <Plug>(textobj-datetime-auto)
xmap iTd <Plug>(textobj-datetime-date)
xmap iTf <Plug>(textobj-datetime-full)
xmap iTt <Plug>(textobj-datetime-time)
xmap iTz <Plug>(textobj-datetime-tz)
omap aTa <Plug>(textobj-datetime-auto)
omap aTd <Plug>(textobj-datetime-date)
omap aTf <Plug>(textobj-datetime-full)
omap aTt <Plug>(textobj-datetime-time)
omap aTz <Plug>(textobj-datetime-tz)
omap iTa <Plug>(textobj-datetime-auto)
omap iTd <Plug>(textobj-datetime-date)
omap iTf <Plug>(textobj-datetime-full)
omap iTt <Plug>(textobj-datetime-time)
omap iTz <Plug>(textobj-datetime-tz)
" 3}}} kana/vim-textobj-datetime "
" paulhybryant/vim-textobj-path {{{3 "
let g:textobj_path_no_default_key_mappings = 0
xmap iA <Plug>(textobj-path-next_path-i)
xmap aA <Plug>(textobj-path-next_path-a)
xmap IA <Plug>(textobj-path-prev_path-i)
xmap AA <Plug>(textobj-path-prev_path-a)
omap iA <Plug>(textobj-path-next_path-i)
omap aA <Plug>(textobj-path-next_path-a)
omap IA <Plug>(textobj-path-prev_path-i)
omap AA <Plug>(textobj-path-prev_path-a)
" 3}}} paulhybryant/vim-textobj-path "
" jceb/vim-textobj-uri {{{3 "
let g:textobj_uri_no_default_key_mappings = 1
xmap iU <Plug>(textobj-uri-uri-i)
xmap aU <Plug>(textobj-uri-uri-a)
omap iU <Plug>(textobj-uri-uri-i)
omap aU <Plug>(textobj-uri-uri-a)
" 3}}} jceb/vim-textobj-uri "
" 2}}} TextObjContent "

" TextObjMarkUp {{{2 "
" kana/vim-textobj-diff {{{3 "
let g:textobj_diff_no_default_key_mappings = 1
" 3}}} kana/vim-textobj-diff "
" rbonvall/vim-textobj-latex {{{3 "
let g:textobj_latex_no_default_key_mappings = 1
" 3}}} rbonvall/vim-textobj-latex "
" jasonlong/vim-textobj-css {{{3 "
let g:textobj_css_no_default_key_mappings = 1
" 3}}} jasonlong/vim-textobj-css "
" whatyouhide/vim-textobj-erb {{{3 "
let g:textobj_erb_no_default_key_mappings = 1
" 3}}} whatyouhide/vim-textobj-erb "
" 2}}} TextObjMarkUp "

" TextObjScript {{{2 "
" kana/vim-textobj-function {{{3 "
let g:textobj_function_no_default_key_mappings = 1
" 3}}} kana/vim-textobj-function "
" akiyan/vim-textobj-php {{{3 "
let g:textobj_php_no_default_key_mappings = 1
" 3}}} akiyan/vim-textobj-php "
" bps/vim-textobj-python {{{3 "
let g:textobj_python_no_default_key_mappings = 1
" 3}}} bps/vim-textobj-python "
" vimtaku/vim-textobj-sigil {{{3 "
let g:textobj_sigil_no_default_key_mappings = 1
" 3}}} vimtaku/vim-textobj-sigil "
" tek/vim-textobj-ruby {{{3 "
let g:textobj_ruby_no_mappings = 1
" 3}}} tek/vim-textobj-ruby "
" 2}}} TextObjScript "

" TextObjCompile {{{2 "
" libclang-vim/vim-textobj-clang {{{3 "
"let g:textobj_clang_no_default_key_mappings = 1
" 3}}} libclang-vim/vim-textobj-clang "
"if has('python')
" gilligan/vim-textobj-haskell {{{3 "
"let g:textobj_haskell_no_default_key_mappings = 1
" 3}}} gilligan/vim-textobj-haskell "
"endif
" andyl/vim-textobj-elixir {{{3 "
"let g:textobj_elixir_no_default_key_mappings = 1
" 3}}} andyl/vim-textobj-elixir "
" adriaanzon/vim-textobj-blade-directive {{{3 "
"let g:textobj_blade_directive_no_default_key_mappings = 1
" 3}}} adriaanzon/vim-textobj-blade-directive "
" 2}}} TextObjCompile "
" 1}}} CursorVisual "

" Edit {{{1 "
" Repeat {{{2 "
" tpope/vim-repeat {{{3 "
nnoremap . :<C-U>exe repeat#run(v:count)<CR>
nnoremap u :<C-U>call repeat#wrap('u',v:count)<CR>
nnoremap U :<C-U>call repeat#wrap('U',v:count)<CR>
nnoremap <C-r> :<C-U>call repeat#wrap("\<Lt>C-R>",v:count)<CR>
" 3}}} tpope/vim-repeat "
" 2}}} Repeat "

" ClipBoard {{{2 "
"  {{{3 "
set clipboard=unnamed
set clipboard+=unnamedplus
" 3}}}  "
" svermeulen/vim-yoink {{{3 "
let g:yoinkSyncNumberedRegisters = 1
nmap <C-p> <plug>(YoinkPostPasteSwapBack)
nmap <C-n> <plug>(YoinkPostPasteSwapForward)
nmap p <plug>(YoinkPaste_p)
nmap P <plug>(YoinkPaste_P)
nmap [r <plug>(YoinkRotateBack)
nmap ]r <plug>(YoinkRotateForward)
nnoremap [R :<C-u>Yanks<CR>
nnoremap ]R :<C-u>ClearYanks<CR>
" 3}}} svermeulen/vim-yoink "
" 2}}} ClipBoard "

" Draw {{{2 "
" 2}}} Draw "

" Filter {{{2 "
" 2}}} Filter "

" Compose {{{2 "
" junegunn/vim-easy-align {{{3 "
xmap gy <Plug>(EasyAlign)
nmap gy <Plug>(EasyAlign)
" 3}}} junegunn/vim-easy-align "
" 2}}} Compose "

" Format {{{2 "
"  {{{3 "
set textwidth=77
let g:textwidth = &textwidth
set colorcolumn=+1
set linebreak
set formatoptions+=cqrnlmB
set formatoptions-=at2M
" 3}}}  "
" Soares/trailguide.vim {{{3 "
let g:trailguide_automap = 0
let g:trailguide_matchgroup = 'SpellBad'
nmap [j <Plug>trailguide#prev
nmap ]j <Plug>trailguide#next
" 3}}} Soares/trailguide.vim "
" sbdchd/neoformat {{{3 "
let g:neoformat_basic_format_align = 1
let g:neoformat_basic_format_retab = 1
let g:neoformat_basic_format_trim = 1
let g:neoformat_try_formatprg = 1
nnoremap g_ :<C-u>set operatorfunc=init#format#main<CR>g@
" 3}}} sbdchd/neoformat "
" 2}}} Format "

" Comment {{{2 "
" scrooloose/nerdcommenter {{{3 "
let g:NERDSpaceDelims = 1
nmap <Leader>cn <Plug>NERDCommenterNested
nmap <Leader>cm <Plug>NERDCommenterMinimal
nmap <Leader>cs <Plug>NERDCommenterSexy
xmap <Leader>cs <Plug>NERDCommenterSexy
nmap <Leader>cg <Plug>NERDCommenterToEOL
xmap <Leader>cg <Plug>NERDCommenterToEOL
nmap <Leader>cA <Plug>NERDCommenterAppend
nmap <Leader>cI <Plug>NERDCommenterInsert
nmap <Leader>ca <Plug>NERDCommenterAltDelims
nmap <Leader>cl <Plug>NERDCommenterAlignLeft
nmap <Leader>cb <Plug>NERDCommenterAlignBoth
" 3}}} scrooloose/nerdcommenter "
" tyru/caw.vim {{{3 "
let g:caw_dollarpos_sp_left = ' '
nmap gc <Plug>(caw:prefix)
xmap gc <Plug>(caw:prefix)
nmap gcc <Plug>(caw:hatpos:toggle:operator)
xmap gcc <Plug>(caw:hatpos:toggle:operator)
" 3}}} tyru/caw.vim "
" 2}}} Comment "

" Abbreviate {{{2 "
" 2}}} Abbreviate "

" Insert {{{2 "
" kana/vim-smartinput {{{3 "
let g:smartinput_break_undo = 1
" 3}}} kana/vim-smartinput "
" tpope/vim-surround {{{3 "
let g:surround_no_mappings = 1
nmap ds <Plug>Dsurround
nmap cs <Plug>Csurround
nmap cS <Plug>CSurround
nmap ys <Plug>Ysurround
nmap yS <Plug>YSurround
nmap yss <Plug>Yssurround
nmap ySs <Plug>YSsurround
nmap ySS <Plug>YSsurround
xmap s <Plug>VSurround
xmap S <Plug>VgSurround
imap <C-x>i <Plug>Isurround
imap <C-x>I <Plug>ISurround
" 3}}} tpope/vim-surround "
" 2}}} Insert "

" Parse {{{2 "
" derekwyatt/vim-protodef {{{3 "
let g:disable_protodef_sorting=1
let g:disable_protodef_mapping = 1
" 3}}} derekwyatt/vim-protodef "
" 2}}} Parse "

" Complete {{{2 "
"  {{{3 "
execute 'set thesaurus=' . substitute(glob($VIMDATA.'/.thesaurus/*'), '\n', ',', 'g')
" 3}}}  "
" mattn/emmet-vim {{{3 "
let g:user_emmet_leader_key = g:maplocalleader
let g:user_emmet_install_global = 0
let g:user_emmet_mode = 'a' " enable all function! init#in all mode.
let g:user_emmet_expandabbr_key = g:maplocalleader.g:maplocalleader
let g:user_emmet_expandword_key = g:maplocalleader.','
"let g:user_emmet_update_tag = '<C-y>u'
"let g:user_emmet_balancetaginward_key = '<C-y>d'
"let g:user_emmet_balancetagoutward_key = '<C-y>D'
"let g:user_emmet_next_key = '<C-y>n'
"let g:user_emmet_prev_key = '<C-y>N'
"let g:user_emmet_imagesize_key = '<C-y>i'
"let g:user_emmet_togglecomment_key = '<C-y>/'
"let g:user_emmet_splitjointag_key = '<C-y>j'
"let g:user_emmet_removetag_key = '<C-y>k'
"let g:user_emmet_anchorizeurl_key = '<C-y>a'
"let g:user_emmet_anchorizesummary_key = '<C-y>A'
"let g:user_emmet_mergelines_key = '<C-y>m'
"let g:user_emmet_codepretty_key = '<C-y>c'
" 3}}} mattn/emmet-vim "
" junegunn/vim-emoji {{{3 "
set completefunc=emoji#complete
" 3}}} junegunn/vim-emoji "
" rhysd/github-complete.vim {{{3 "
let g:github_complete_enable_omni_completion = 0
" 3}}} rhysd/github-complete.vim "
if has('pythonx')
	" Shougo/deoplete.nvim {{{3 "
	if exists('&pyxversion')
		set pyxversion=3
		" let g:deoplete#enable_at_startup = 1
	else
		let g:loaded_python_provider=0
	endif
	" 3}}} Shougo/deoplete.nvim "
endif
" chrisbra/unicode.vim {{{3 "
let g:Unicode_data_directory = $VIMDATA.'/.unicode.vim'
" 3}}} chrisbra/unicode.vim "
" youran0715/LeaderF-Cmdpalette {{{3 "
nnoremap g: :Leaderf command<CR>
" 3}}} youran0715/LeaderF-Cmdpalette "
" 2}}} Complete "

" Snippet {{{2 "
" aperezdc/vim-template {{{3 "
let g:templates_global_name_prefix = ''
let g:templates_directory = [$VIMCONFIG.'/vim-template']
let g:email = matchstr($ECHANGELOG_USER, "\\(<\\)\\@<=[^>]\\+\\(>\\)\\@=")
let g:username = matchstr($ECHANGELOG_USER, "^[^<]\\+\\( <\\)\\@=")
" 3}}} aperezdc/vim-template "
" honza/vim-snippets {{{3 "
let g:snips_author = g:username
let g:snips_github = g:username
let g:snips_email = g:email
" 3}}} honza/vim-snippets "
" ararslan/license-to-vim {{{3 "
let g:license_email = g:email
let g:license_author = g:username
" 3}}} ararslan/license-to-vim "
" 2}}} Snippet "

" Check {{{2 "
"  {{{3 "
set spelllang=en_us,cjk
" 3}}}  "
" w0rp/ale {{{3 "
let g:ale_linters = {
			\ 'reStructuredText': ['rstcheck'],
			\ }
let g:ale_sign_error = get(g:, 'airline#extensions#ale#error_symbol', '✗')
let g:ale_sign_warning = get(g:, 'airline#extensions#ale#warning_symbol', '')
let g:ale_echo_msg_error_str = get(g:, 'airline#extensions#ale#error_symbol', '✗')
let g:ale_echo_msg_warning_str = get(g:, 'airline#extensions#ale#warning_symbol', '')
let g:ale_echo_msg_format = '%linter%: %severity%! %s'
nnoremap [k :<C-u>ALEPrevious<CR>
nnoremap ]k :<C-u>ALENext<CR>
nnoremap [K :<C-u>ALEFirst<CR>
nnoremap ]K :<C-u>ALELast<CR>
" 3}}} w0rp/ale "
" dbmrq/vim-ditto {{{3 "
let s:vim_ditto_config = $VIMDATA.'/.vim-ditto'
let g:ditto_dir = s:vim_ditto_config
nmap [w <Plug>DittoPrev
nmap ]w <Plug>DittoNext
nmap zy <Plug>DittoGood
nmap zuy <Plug>DittoBad
nmap [W <Plug>DittoLess
nmap ]W <Plug>DittoMore
nmap zI <Plug>ToggleDitto
" 3}}} dbmrq/vim-ditto "
" reedes/vim-wordy {{{3 "
nnoremap zY :Wordy<Space>
nnoremap zuY :NoWordy<CR>
nnoremap [U :PrevWordy<CR>
nnoremap ]U :NextWordy<CR>
" 3}}} reedes/vim-wordy "
" 2}}} Check "
" 1}}} Edit "

" File {{{1 "
" FileExplore {{{2 "
"  {{{3 "
set directory=$VIMDATA/swap
let g:netrw_home = $VIMDATA . '/.netrw'
let g:netrw_nogx = 1
let g:netrw_altfile = 1
" 3}}}  "
" Shougo/defx.nvim {{{3 "
augroup init_defx "{{{
	autocmd!
	autocmd FileType defx source $VIMCONFIG/ftplugin/defx.vim
augroup END "}}}
" 3}}} Shougo/defx.nvim "
" kristijanhusak/defx-icons {{{3 "
augroup init_defx_icons "{{{
	autocmd!
	autocmd VimEnter * call init#defx_icons#main()
augroup END "}}}
" 3}}} kristijanhusak/defx-icons "
if has('pythonx')
	" Yggdroot/LeaderF {{{3 "
	let g:Lf_StlSeparator = {
				\ 'left': get(g:, 'airline_left_sep', ''),
				\ 'right': get(g:, 'airline_right_sep', ''),
				\ }
	let g:Lf_RootMarkers = [
				\ '.git', '.yadm', '.hg', '.svn', '.bzr',
				\ '.darcs', '.fossil', '.cvs', '.rcs',
				\ '.accurev', '.perforce', '.tfs',
				\ '.vs', '.vscode', '.idea',
				\ '.project', '.sublime-project',
				\ '.latexmkrc', '.latexmain',
				\ 'README.rst', 'README.txt', 'README.mkd', 'README.md',
				\ ]
	let g:Lf_ShortcutF = ''
	let g:Lf_ShortcutB = ''
	let g:Lf_StlColorscheme = 'gruvbox_material'
	let g:Lf_HideHelp = 1
	let g:Lf_ShowHidden = 1
	let g:Lf_WindowPosition = 'popup'
	let g:Lf_CacheDirectory = $VIMDATA
	let g:Lf_DevIconsExactSymbols = g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols
	let g:Lf_DevIconsExtensionSymbols = g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols
	let g:Lf_UseVersionControlTool = 0
	let g:Lf_WildIgnore = {
				\ 'dir': ['.svn', '.git', '.hg'],
				\ 'file': ['*.sw?', '~$*', '*.bak', '*.exe', '*.o', '*.so', '*.py[co]'],
				\ }
	let g:Lf_MruWildIgnore = g:Lf_WildIgnore
	let g:Lf_CommandMap = {
				\ '<C-f>': ['<C-s>'],
				\ '<S-Insert>': ['<C-y>'],
				\ '<Up>': ['<C-p>', '<Up>'],
				\ '<Down>': ['<C-n>', '<Down>'],
				\ '<F5>': ['<C-z>'],
				\ '<C-a>': ['<C-l>'],
				\ '<BS>': ['<C-h>', '<BS>'],
				\ '<Del>': ['<C-d>', '<Del>'],
				\ '<Home>': ['<C-a>', '<Home>'],
				\ '<End>': ['<C-e>', '<End>'],
				\ '<Left>': ['<C-b>', '<Left>'],
				\ '<Right>': ['<C-f>', '<Right>'],
				\ '<C-p>': ['<C-\>'],
				\ '<C-o>': ['<C-c>'],
				\ '<C-Up>': ['<C-t>'],
				\ '<C-Down>': ['<C-v>'],
				\ }
	let g:Lf_NormalMap = {
				\ '_': [
				\ ['<nowait>u', '<C-u>'],
				\ ['<nowait>d', '<C-d>'],
				\ ['<nowait>U', '<C-b>'],
				\ ['<nowait>D', '<C-f>'],
				\ ],
				\ 'File': [
				\ ],
				\ 'Buffer': [
				\ ['<nowait>x', ':<C-u>execute g:Lf_py "bufExplManager.deleteBuffer(1)"<CR>'],
				\ ],
				\ 'Mru': [
				\ ],
				\ 'Tag': [
				\ ],
				\ 'BufTag': [
				\ ],
				\ 'Function': [
				\ ],
				\ 'Line': [
				\ ],
				\ 'History':[
				\ ],
				\ 'Help': [
				\ ],
				\ 'Self': [
				\ ],
				\ 'Colorscheme': [
				\ ],
				\}
	nnoremap q: :<C-u>Leaderf cmdHistory<CR>
	nnoremap q/ :<C-u>Leaderf searchHistory<CR>
	" 3}}} Yggdroot/LeaderF "
	" tamago324/LeaderF-filer {{{3 "
	let g:Lf_FilerUseDefaultInsertMap = 0
	let g:Lf_FilerUseDefaultNormalMap = 0
	let g:Lf_FilerInsertMap = {
				\ '<C-b>': 'left',
				\ '<C-f>': 'right',
				\ '<C-p>': 'prev_history',
				\ '<C-n>': 'next_history',
				\ '<C-j>': 'down',
				\ '<C-k>': 'up',
				\ '<C-a>': 'home',
				\ '<C-e>': 'end',
				\ '<C-d>': 'delete',
				\ '<C-h>': 'backspace',
				\ '<C-w>': 'delete_left_word',
				\ '<C-u>': 'clear_line',
				\ '<C-y>': 'paste',
				\ '<C-g>': 'open_parent_or_clear_line',
				\ '<C-o>': 'open_current',
				\ '<C-s>': 'toggle_hidden_files',
				\ '<C-r>': 'toggle_regex',
				\ '<Esc>': 'quit',
				\ '<CR>': 'accept',
				\ '<C-x>': 'accept_horizontal',
				\ '<C-]>': 'accept_vertical',
				\ '<C-t>': 'accept_tab',
				\ '<Tab>': 'switch_normal_mode',
				\ '<2-LeftMouse>': 'accept',
				\ '<ScroollWhellUp>': 'up3',
				\ '<ScroollWhellDown>': 'down3',
				\ }
	let g:Lf_FilerNormalMap = {
				\ 'K': 'open_parent',
				\ 'go': 'open_current',
				\ 'J': 'goto_root_marker_dir',
				\ '.': 'toggle_hidden_files',
				\ 'j': 'down',
				\ 'k': 'up',
				\ '<F1>': 'toggle_help',
				\ '<Tab>': 'switch_insert_mode',
				\ '<CR>': 'preview',
				\ '<Esc>': 'quit',
				\ 'o': 'accept',
				\ 'i': 'accept_horizontal',
				\ 'I': 'accept_vertical',
				\ 'O': 'accept_tab',
				\ 'u': 'page_up_in_preview',
				\ 'd': 'page_down_in_preview',
				\ 'ZZ': 'close_preview_popup',
				\ 's': 'add_selections',
				\ '<C-A>': 'select_all',
				\ 'gq': 'clear_selections',
				\ 'a': 'create_file',
				\ 'A': 'mkdir',
				\ 'r': 'rename',
				\ 'c': 'copy',
				\ 'p': 'paste',
				\ '=': 'change_directory',
				\ 'gk': 'history_backward',
				\ 'gj': 'history_forward',
				\ 'x': 'remove',
				\ 'X': 'remove_trash',
				\ }
	" 3}}} tamago324/LeaderF-filer "
endif
" 2}}} FileExplore "

" FileEdit {{{2 "
"  {{{3 "
nnoremap <Leader>bb :<C-u>diffsplit<Space>
" 3}}}  "
" tpope/vim-eunuch {{{3 "
nnoremap <Leader>bC :<C-u>Chmod<Space>
nnoremap <Leader>br :<C-u>Rename<Space>
nnoremap <Leader>bm :<C-u>Mkdir<Space>
nnoremap <Leader>bq :<C-u>Cfind<Space>
nnoremap <Leader>bl :<C-u>Lfind<Space>
nnoremap <Leader>bq :<C-u>Clocate<Space>
nnoremap <Leader>bl :<C-u>Llocate<Space>
nnoremap <Leader>bE :<C-u>SudoEdit<Space>
" 3}}} tpope/vim-eunuch "
" will133/vim-dirdiff {{{3 "
nnoremap <Leader>bd :<C-u>DirDiff<Space>
" 3}}} will133/vim-dirdiff "
" 2}}} FileEdit "

" Compress {{{2 "
" 2}}} Compress "

" VCS {{{2 "
"  {{{3 "
set sessionoptions="blank,buffers,globals,localoptions,tabpages,sesdir,folds,help,options,resize,winpos,winsize"
set autowrite
set confirm
" 3}}}  "
" tpope/vim-rhubarb {{{3 "
nnoremap gX :Gbrowse<CR>
xnoremap gX :Gbrowse<CR>
" 3}}} tpope/vim-rhubarb "
" junegunn/vim-github-dashboard {{{3 "
let g:github_dashboard = {
			\ 'username': g:username,
			\ 'password': readfile($VIMDATA.'/github-dashboard.txt')[0],
			\ }
" 3}}} junegunn/vim-github-dashboard "
" jaxbot/github-issues.vim {{{3 "
let g:github_access_token = readfile($VIMDATA.'/github-issues.txt')[0]
let g:gissues_lazy_load = 1
" 3}}} jaxbot/github-issues.vim "
" mhinz/vim-signify {{{3 "
nmap [g <plug>(signify-prev-hunk)
nmap ]g <plug>(signify-next-hunk)
nmap [G 9999<plug>(signify-prev-hunk)
nmap ]G 9999<plug>(signify-next-hunk)
omap ig <plug>(signify-motion-inner-pending)
xmap ig <plug>(signify-motion-inner-visual)
omap ag <plug>(signify-motion-outer-pending)
xmap ag <plug>(signify-motion-outer-visual)
" 3}}} mhinz/vim-signify "
" mbbill/undotree {{{3 "
set undofile
set undodir=$VIMDATA/undo
let g:undotree_HelpLine = 0
let g:undotree_CustomUndotreeCmd = 'botright vertical '.'30'.' new'
let g:undotree_CustomDiffpanelCmd = 'topleft 5 new'
let g:undotree_HighlightChangedText  = 1
let g:undotree_DiffAutoOpen = 1
let g:undotree_RelativeTimestamp = 1
let g:undotree_HighlightSyntaxAdd = 'ShowMarksHLl'
let g:undotree_HighlightSyntaxChange = 'ShowMarksHLl'
" 3}}} mbbill/undotree "
" bennyyip/LeaderF-github-stars {{{3 "
let gs#username='Freed-Wu'
" 3}}} bennyyip/LeaderF-github-stars "
" 2}}} VCS "
" 1}}} File "

" Program {{{1 "
" Document {{{2 "
" 2}}} Document "

" MarkUp {{{2 "
" lervag/vimtex {{{3 "
let g:vimtex_imaps_leader = '.'
let g:vimtex_mappings_disable = {
			\ 'n': ['ds$', 'cs$', 'tsc', 'tse', 'tsd', 'tsD', '<F7>', 'K', 'dsd', 'dse', 'dsc'],
			\ 'x': ['<F7>', 'tsd', 'tsD'],
			\ 'i': ['<F7>', 'tsD'],
			\ }
let g:vimtex_env_change_autofill = 1
let g:vimtex_fold_enabled = 1
let g:vimtex_fold_levelmarker = ''
let g:vimtex_indent_delims = {
			\ 'open' : ['{', '['],
			\ 'close' : ['}', ']'],
			\ 'close_indented' : 0,
			\ 'include_modified_math' : 1,
			\}
let g:vimtex_toc_todo_keywords = ['TODO', 'FIXME', 'XXX']
let g:vimtex_toc_config = {
			\ 'name' : 'toc',
			\ 'show_help': 0,
			\ 'split_pos' : 'vert :rightbelow',
			\ 'hotkeys_leader': g:maplocalleader,
			\ 'hotkeys' : 'abcdefghijklmnopgrstuvwxyz',
			\ 'hotkeys_enabled' : 1,
			\ 'layer_status' : { 'content': 1,
			\ 'label': 0,
			\ 'todo': 0,
			\ 'include': 0
			\ },
			\ 'layer_keys' : { 'content': g:maplocalleader.'`',
			\ 'label': g:maplocalleader.'<Tab>',
			\ 'todo': g:maplocalleader.g:maplocalleader,
			\ 'include': g:maplocalleader.'0'
			\ }
			\ }
if has('nvim') && executable('nvr')
	let g:vimtex_compiler_progname = 'nvr'
endif
if executable('zathura')
	let g:vimtex_view_method = 'zathura'
elseif executable('SumatraPDF')
	let g:vimtex_view_general_viewer = 'SumatraPDF'
	let g:vimtex_view_general_options =
				\ '-reuse-instance -forward-search @tex @line @pdf'
				\ . ' -inverse-search "gvim --servername '.v:servername
				\ . ' --remote-send \"^<C-\^>^<C-n^>'
				\ . ':drop \%f^<CR^>:\%l^<CR^>:normal\! zzzv^<CR^>'
				\ . ':execute ''drop ''.fnameescape(''\%f'')^<CR^>'
				\ . ':\%l^<CR^>:normal\! zzzv^<CR^>'
				\ . ':call remote_foreground('''.v:servername.''')^<CR^>^<CR^>\""'
endif
let g:vimtex_compiler_latexmk = {
			\ 'options' : [
			\ '-verbose',
			\ '-file-line-error',
			\ '-shell-escape',
			\ '-synctex=1',
			\ '-interaction=nonstopmode',
			\ ],
			\ }
let g:vimtex_compiler_latexmk_engines = {
			\ '_': '-lualatex',
			\ }
" 3}}} lervag/vimtex "
" vimwiki/vimwiki {{{3 "
let g:vimwiki_use_mouse = 1
let g:vimwiki_valid_html_tags = 'a,img,b,i,s,u,sub,sup,br,hr,div,del,code,red,center,left,right,h1,h2,h3,h4,h5,h6,pre,script,style'
let g:vimwiki_list = [
			\ {
			\ 'path': $GITHUBWORKSPACE . '/' . g:username . '/vimwiki',
			\ 'path_html': $GITHUBWORKSPACE . '/' . g:username . '/vimwiki/_site',
			\ 'template_path': $GITHUBWORKSPACE . '/' . g:username . '/vimwiki/_layouts',
			\ },
			\ ]
" 3}}} vimwiki/vimwiki "
" parkr/vim-jekyll {{{3 "
let g:jekyll_build_command = 'jekyll --no-auto --no-server'
" 3}}} parkr/vim-jekyll "
" vim-pandoc/vim-pandoc {{{3 "
let g:pandoc#keyboard#blacklist_submodule_mappings = ['references', 'styles']
let g:pandoc#formatting#mode = 'h'
let g:pandoc#formatting#textwidth = &textwidth
let g:pandoc#formatting#smart_autoformat_on_cursormoved = 1
let g:pandoc#completion#bib#mode = 'citeproc'
let g:pandoc#command#latex_engine = 'lualatex'
nnoremap gx :<C-u>call pandoc#hypertext#OpenSystem()<CR>
xnoremap gx y:call pandoc#hypertext#OpenSystem(<C-r>0)<CR>
" 3}}} vim-pandoc/vim-pandoc "
" szymonmaszke/vimpyter {{{3 "
let g:vimpyter_view_directory = $VIMDATA.'/.vimpyter'
" 3}}} szymonmaszke/vimpyter "
" 2}}} MarkUp "

" Office {{{2 "
" chrisbra/csv.vim {{{3 "
let g:csv_nomap_space = 1
let g:csv_nomap_bs = 1
" 3}}} chrisbra/csv.vim "
" 2}}} Office "

" Database {{{2 "
" vim-scripts/dbext.vim {{{3 "
let g:dbext_map_prefix = '<buffer><LocalLeader>'
let g:dbext_default_type = 'mysql'
let g:dbext_default_user = readfile($VIMDATA.'/dbext.txt')[0]
let g:dbext_default_passwd = readfile($VIMDATA.'/dbext.txt')[1]
let g:dbext_default_history_file = $HOME.'/.mysql_history'
" 3}}} vim-scripts/dbext.vim "
" 2}}} Database "

" Script {{{2 "
" python-mode/python-mode {{{3 "
let g:pymode_python = 'python3'
let g:pymode_breakpoint_cmd = 'ipdb'
let g:pymode_breakpoint_bind = '<LocalLeader>b'
let g:pymode_run_bind = '<LocalLeader>m'
let g:pymode_lint = 0
let g:pymode_motion = 0
let g:pymode_folding = 1
let g:pymode_rope = 1
let g:pymode_doc = 0
let g:pymode_rope_lookup_project = 1
let g:pymode_rope_show_doc_bind = '<LocalLeader>d'
let g:pymode_rope_regenerate_on_write = 0
let g:pymode_rope_autoimport = 1
let g:pymode_rope_goto_definition_bind = '<LocalLeader>o'
let g:pymode_rope_rename_bind = '<LocalLeader>rr'
let g:pymode_rope_rename_module_bind = '<LocalLeader>rn'
let g:pymode_rope_organize_imports_bind = '<LocalLeader>ro'
let g:pymode_rope_autoimport_bind = '<LocalLeader>ra'
let g:pymode_rope_module_to_package_bind = '<LocalLeader>rp'
let g:pymode_rope_extract_method_bind = '<LocalLeader>rm'
let g:pymode_rope_extract_variable_bind = '<LocalLeader>rl'
let g:pymode_rope_use_function_bind = '<LocalLeader>ru'
let g:pymode_rope_move_bind = '<LocalLeader>rv'
let g:pymode_rope_change_signature_bind = '<LocalLeader>rs'
let g:pymode_rope_completion_bind = '<LocalLeader><LocalLeader>'
" 3}}} python-mode/python-mode "
" 2}}} Script "

" Compile {{{2 "
" WolfgangMehner/c-support {{{3 "
let g:C_Ctrl_j = 'off'
let g:C_GlobalTemplateFile = $GITHUBWORKSPACE.'/WolfgangMehner/c-support/c-support/templates/Templates'
let g:C_LocalTemplateFile = $GITHUBWORKSPACE.'/WolfgangMehner/c-support/c-support/templates/Templates'
let g:C_CodeSnippets = $GITHUBWORKSPACE.'/WolfgangMehner/c-support/c-support/codesnippets'
" 3}}} WolfgangMehner/c-support "
" 4Evergreen4/vim-hardy {{{3 "
let g:hardy_arduino_path = 'arduino_debug'
" 3}}} 4Evergreen4/vim-hardy "
" fatih/vim-go {{{3 "
let g:go_version_warning = 0
" 3}}} fatih/vim-go "
" suoto/vim-hdl {{{3 "
let g:vimhdl_conf_file = $VIMCONFIG.'/.vim-hdl/.hdl_checker.config'
" 3}}} suoto/vim-hdl "
" 2}}} Compile "

" Debug {{{2 "
" vim-vdebug/vdebug {{{3 "
" TODO: fix <30-09-19> "
" 3}}} vim-vdebug/vdebug "
" 2}}} Debug "

" Terminal {{{2 "
"  {{{3 "
augroup init_text "{{{
	autocmd!
	if exists('#TermEnter')
		autocmd TermEnter * setfiletype floaterm
	else
		autocmd BufRead,BufNewFile,BufEnter * execute &buftype ==# 'terminal'?'setfiletype floaterm':''
	endif
	autocmd VimEnter * autocmd BufRead,BufNewFile,BufEnter * execute &filetype ==# ''?'setfiletype text':''
	autocmd BufAdd * call s:bufadd()
augroup END "}}}
function! s:bufadd() "{{{
	if &buftype !=# 'terminal'
		set modifiable
		set noreadonly
	endif
endfunction "}}}
" 3}}}  "
" sillybun/vim-repl {{{3 "
let g:repl_program = {
			\ 'default': &shell,
			\ 'sh': executable('sh')? 'sh': &shell,
			\ 'bash': executable('bash')? 'bash': &shell,
			\ 'fish': executable('fish')? 'fish': &shell,
			\ 'zsh': executable('zsh')? 'zsh': &shell,
			\ 'ksh': executable('ksh')? 'ksh': &shell,
			\ 'csh': executable('csh')? 'csh': &shell,
			\ 'tcsh': executable('tcsh')? 'tcsh': &shell,
			\ 'dosbatch': executable('cmd')? 'cmd': &shell,
			\ 'ps1': executable('powershell')? 'powershell': &shell,
			\ 'python': 'ptipython',
			\ 'gnuplot': 'gnuplot',
			\ 'octave': 'octave',
			\ 'julia': 'julia --banner=no',
			\ 'spice': 'spice',
			\ }
let g:repl_python_automerge = 1
let g:repl_position = 1
let g:repl_console_name = ''
let g:sendtorepl_invoke_key = '<CR>'
" 3}}} sillybun/vim-repl "
" voldikss/vim-floaterm {{{3 "
let g:floaterm_keymap_new = '<C-\>0'
let g:floaterm_keymap_prev = '<C-\>k'
let g:floaterm_keymap_next = '<C-\>j'
let g:floaterm_keymap_toggle = '<C-\><C-\>'
nnoremap <CR> :execute 'FloatermSend ' . getline('.')<CR>
xnoremap <CR> y:FloatermSend <C-r>0<CR>
" 3}}} voldikss/vim-floaterm "
" 2}}} Terminal "
" 1}}} Program "

" SpecialFunction {{{1 "
" Tool {{{2 "
" itchyny/calendar.vim {{{3 "
let g:calendar_cyclic_view = 1
let g:calendar_cache_directory = $VIMDATA.'/.calendar.vim'
" 3}}} itchyny/calendar.vim "
" Freed-Wu/gitdraw.vim {{{ "
let g:gitdraw#author_name = g:username
let g:gitdraw#repeat_number = 13
let g:gitdraw#repo_path = $GITHUBWORKSPACE . '/' . g:username . '/git-drawing'
" }}} Freed-Wu/gitdraw.vim "
" 2}}} Tool "

" Web {{{2 "
" ianding1/leetcode.vim {{{3 "
let g:leetcode_username = readfile($VIMDATA.'/leetcode.txt')[0]
let g:leetcode_password = readfile($VIMDATA.'/leetcode.txt')[1]
let g:leetcode_china = 1
" 3}}} ianding1/leetcode.vim "
" 2}}} Web "

" Browse {{{2 "
" voldikss/vim-browser-search {{{3 "
nmap g/ <Plug>SearchNormal
xmap g/ <Plug>SearchVisual
" 3}}} voldikss/vim-browser-search "
" 2}}} Browse "

" Fortune {{{2 "
" 2}}} Fortune "

" Game {{{2 "
" deris/vim-duzzle {{{3 "
augroup init_duzzle "{{{
	autocmd!
	autocmd SourcePre duzzle.vim language message en_US
augroup END "}}}
" 3}}} deris/vim-duzzle "
" 2}}} Game "
" 1}}} SpecialFunction "

