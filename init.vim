" Plugin {{{1 "
"  {{{2 "
"  {{{3 "
"  vim: fdm=marker
scriptencoding utf-8
let g:mapleader = ' '
let g:maplocalleader = ';'
if exists('$VIMWORKSPACE')
	cd $VIMWORKSPACE
else
	cd $HOME/Documents
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
if dein#load_state($GITWORKSPACE)
	call dein#begin($GITWORKSPACE)

	" Plugin {{{4 "
	" PluginManage {{{5 "
	call dein#add('Shougo/dein.vim')
	call dein#add('haya14busa/dein-command.vim', {
				\ 'on_cmd': 'Dein',
				\ })
	" 5}}} PluginManage "

	" PluginDetect {{{5 "
	call dein#add('tpope/vim-scriptease', {
				\ 'on_cmd': ['PP', 'PPmsg', 'Runtime', 'Time', 'Verbose', 'Vedit', 'Vopen', 'Vread', 'Vsplit', 'Vvsplit', 'Vtabedit', 'Vpedit', 'Messages', 'Scriptnames', 'Breakadd', 'Breakdel', 'Disarm'],
				\ 'on_map': ['<Plug>ScripteaseHelp','<Plug>ScripteaseFilter', '<Plug>ScripteaseSynnames']
				\ })
	" 5}}} PluginDetect "
	" 4}}} Plugin "

	" Default {{{4 "
	"  {{{5 "
	call dein#add('tpope/vim-sensible')
	call dein#add($VIM.'/vimfiles', {
				\ 'if': has('unix'),
				\ 'frozen': 1,
				\ 'on_cmd': ['NewEbuild', 'NewMetadata', 'NewGLEP', 'NewInitd'],
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
	call dein#add('Shougo/echodoc.vim', {
				\ 'on_event': 'InsertEnter',
				\ 'on_cmd': ['EchoDocEnable', 'EchoDocDisable'],
				\ })
	" TODO: cannot work <26-10-19> "
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
				\ 'if': has('python3'),
				\ 'on_cmd': ['Translate', 'TranslateW', 'TranslateR', 'TranslateH'],
				\ 'on_map': '<Plug>Translate',
				\ })
	" 5}}} Language "
	" 4}}} Default "

	" Key {{{4 "
	" HotkeyManage {{{5 "
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
	" 5}}} HotkeyManage "

	" KeyMap {{{5 "
	call dein#add('vim-scripts/VimIM', {
				\ 'on_func': ['Vimim_chinese', 'Vimim_gi', 'Vimim_search'],
				\ 'on_cmd': 'ViMiM',
				\ })
	call dein#add('gu-fan/mathematic.vim', {
				\ 'on_cmd': 'KeyHelper',
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
	" 4}}} Key "

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
	call dein#add('ap/vim-css-color')
	call dein#add('jaxbot/semantic-highlight.vim', {
				\ 'on_cmd': ['SemanticHighlight', 'SemanticHighlightRevert', 'SemanticHighlightToggle'],
				\ })
	call dein#add('nathanaelkane/vim-indent-guides')
	call dein#add('dbmrq/vim-redacted', {
				\ 'on_cmd': ['Redact', 'RedactedW'],
				\ 'on_map': '<Plug>Redact',
				\ })
	call dein#add('vim-utils/vim-troll-stopper', {
				\ 'on_cmd': 'TrollStop',
				\ })
	call dein#add('Soares/longline.vim', {
				\ 'on_map': '<Plug>longline#',
				\ 'on_cmd': 'LongLine',
				\ })
	" 5}}} Highlight "

	" Conceal {{{5 "
	call dein#add('ryanoasis/vim-devicons')
	call dein#add('KeitaNakamura/tex-conceal.vim', {
				\ 'on_ft': ['tex', 'plaintex', 'markdown', 'pandoc'],
				\ })
	" 5}}} Conceal "

	" StatusBar {{{5 "
	call dein#add('bling/vim-airline', {
				\ 'if': &encoding ==# 'utf-8',
				\ })
	call dein#add('mattn/webapi-vim', {
				\ 'on_source': ['airline-weather.vim', 'excelview-vim'],
				\ 'if': executable('wget') || executable('curl'),
				\ })
	call dein#add('Wildog/airline-weather.vim')
	call dein#add('enricobacis/vim-airline-clock')
	call dein#add('Zuckonit/vim-airline-todo')
	call dein#add('tpope/vim-endwise')
	" 5}}} StatusBar "

	" UI {{{5 "
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
				\ 'depends': 'mattn/vimtweak',
				\ 'if': has('gui_win32'),
				\ })
	call dein#add('t9md/vim-macvim-transparency', {
				\ 'if': has('gui_mac'),
				\ })
	call dein#add('Kjwon15/vim-transparent', {
				\ 'on_if': !has('gui_running'),
				\ })
	call dein#add('thinca/vim-splash', {
				\ 'on_cmd': 'Splash',
				\ })
	call dein#add('mhinz/vim-startify')
	call dein#add('vim-scripts/vimtips.zip', {
				\ 'on_cmd': 'TipOfTheDay',
				\ })
	" 5}}} UI "

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
	call dein#add('powerman/vim-plugin-AnsiEsc', {
				\ 'on_cmd': 'AnsiEsc',
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
				\ 'on_source': 'vim-defx-vista',
				\ 'on_func': 'defx#custom#option',
				\ 'on_cmd': 'Defx',
				\ 'hook_post_source': join([
				\ 'call init#defx#main()',
				\ ], "\n"),
				\ })
	call dein#add('linjiX/vim-defx-vista', {
				\ 'on_cmd': 'ToggleDefxVista',
				\ })
	call dein#add('kristijanhusak/defx-git', {
				\ 'on_ft': 'defx',
				\ })
	call dein#add('kristijanhusak/defx-icons', {
				\ 'on_ft': 'defx',
				\ })
	" 5}}} FileExplore "

	" FieEdit {{{5 "
	call dein#add('airblade/vim-rooter')
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
				\ 'if': has('python') || has('python3'),
				\ 'on_cmd': ['Gissues', 'Gmiles', 'Giadd'],
				\ })
	call dein#add('mbbill/undotree', {
				\ 'on_cmd': ['UndotreeToggle', 'UndotreeHide', 'UndotreeShow', 'UndotreeFocus'],
				\ })
	" 5}}} VCS "
	" 4}}} File "

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
	" 5}}} TagExplore "

	" FuzzyFind {{{5 "
	call dein#add('Yggdroot/LeaderF', {
				\ 'if': has('python') || has('python3'),
				\ 'build': has('unix')? './install.sh': './install.bat',
				\ })
	" 5}}} FuzzyFind "

	" MarkExplore {{{5 "
	call dein#add('kshenoy/vim-signature')
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
				\ 'depends': 'Shougo/vimproc.vim',
				\ 'on_map': '<Plug>',
				\ })
	" 5}}} Search "

	" Swap {{{5 "
	call dein#add('kurkale6ka/vim-swap', {
				\ 'on_map': '<plug>SwapSwap',
				\ })
	call dein#add('mjbrownie/swapit', {
				\ 'on_map': '<plug>(swap-',
				\ })
	" 5}}} Swap "
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
				\ 'on_map': {'o': ['ijj', 'ajj', 'ijJ', 'ajJ'], 'x': ['ijj', 'ajj', 'ijJ', 'ajJ', 'S', 's'], 'n': ['ys', 'yS']},
				\ 'hook_post_source': join([
				\ 'call textobj#quote#init({"educate": 0})',
				\ 'nmap ys <Plug>Ysurround',
				\ 'nmap yS <Plug>YSurround',
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
				\ 'on_map': ['"', '@'],
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
	call dein#add('iwataka/cowsay.vim', {
				\ 'on_func': 'cowsay#cowsay',
				\ })
	call dein#add('iwataka/fortune.vim', {
				\ 'on_func': ['fortune#download', 'fortune#fortune'],
				\ })
	" 5}}} Draw "

	" Banner {{{5 "
	call dein#add('pocke/vanner')
	call dein#add('LiquidFun/vim-comment-banners', {
				\ 'on_cmd': ['CommentBanner'],
				\ })
	" 5}}} Banner "

	" Compose {{{5 "
	call dein#add('junegunn/vim-easy-align', {
				\ 'on_map': '<Plug>(EasyAlign)',
				\ 'on_cmd': ['EasyAlign', 'LiveEasyAlign'],
				\ })
	call dein#add('JikkuJose/vim-visincr', {
				\ 'on_cmd': ['I', 'IA', 'IB', 'IO', 'IX', 'ID', 'IM', 'IDMY', 'IMDY', 'IYMD', 'II', 'IIA', 'IIB', 'IIO', 'IIX'],
				\ })
	call dein#add('tpope/vim-speeddating', {
				\ 'on_map': ['<C-a>', '<C-x>'],
				\ 'hook_post_source': join([
				\ 'xunmap <C-a>',
				\ 'xunmap <C-x>',
				\ ], "\n"),
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
	call dein#add('tpope/vim-abolish', {
				\ 'on_map': 'cr',
				\ 'on_cmd': 'Subvert',
				\ })
	call dein#add('svermeulen/vim-subversive', {
				\ 'on_map': '<plug>(Subversive',
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
	call dein#add('alcesleo/vim-uppercase-sql')
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
	call dein#add('mattn/emmet-vim', {
				\ 'on_ft': ['html', 'xml'],
				\ })
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
	call dein#add('ararslan/license-to-vim', {
				\ 'on_cmd': ['License', 'Stub'],
				\ 'on_func': 'LicenseComplete',
				\ })
	" 5}}} Complete "

	" Snippet {{{5 "
	call dein#add('SirVer/ultisnips', {
				\ 'if': has('python') || has('python3'),
				\ 'on_event': 'InsertEnter',
				\ 'on_cmd': ['UltiSnipsAddFiletypes', 'UltiSnipsEdit'],
				\ 'on_ft': 'snippets',
				\ 'on_map': {'x': '<Tab>',},
				\ })
	call dein#add('honza/vim-snippets', {
				\ 'on_source': 'ultisnips',
				\ })
	call dein#add('aperezdc/vim-template', {
				\ 'on_cmd': ['Template', 'TemplateHere'],
				\ })
	" 5}}} Snippet "

	" LSP {{{5 "
	call dein#add('neoclide/coc.nvim', {
				\ 'if': executable('node'),
				\ 'build': 'yarn install --frozen-lockfile',
				\ 'on_cmd': ['CocInstall', 'CocList'],
				\ })
	" 5}}} LSP "

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
	call dein#add('tomtom/tlib_vim', {
				\ 'if': has('ruby') && (has('unix') || has('win32unix')),
				\ 'on_ft': 'bib',
				\ 'on_source': 'tbibtools',
				\ })
	call dein#add('vim-scripts/tbibtools', {
				\ 'if': has('ruby') && (has('unix') || has('win32unix')),
				\ 'on_ft': 'bib',
				\ })
	call dein#add('lervag/vimtex')
	call dein#add('iamcco/markdown-preview.nvim', {
				\ 'build': 'sh -c "cd app & yarn install"',
				\ 'on_ft': ['pandoc', 'markdown', 'gfimarkdown'],
				\ })
	call dein#add('vim-pandoc/vim-pandoc', {
				\ 'on_ft': ['pandoc', 'markdown', 'rst', 'textile', 'gfimarkdown'],
				\ })
	call dein#add('vim-pandoc/vim-pandoc-after', {
				\ 'on_source': 'vim-pandoc',
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
	call dein#add('greyblake/vim-preview', {
				\ 'if': has('ruby') && has('--enable-rubyinterp'),
				\ 'on_cmd': ['Preview', 'PreviewMarkdown', 'PreviewTextile', 'PreviewRdoc', 'PreviewHtml', 'PreviewRonn', 'PreviewRst'],
				\ 'on_ft': ['markdown', 'pandoc', 'gfimarkdown', 'rst', 'rdoc', 'textile', 'html'],
				\ })
	call dein#add('szymonmaszke/vimpyter', {
				\ 'if': executable('notedown'),
				\ 'on_ft': 'ipynb',
				\ 'augroup': 'VimpyterAutoCommands',
				\ })
	call dein#add('jceb/vim-orgmode')
	call dein#add('liuchengxu/graphviz.vim')
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
				\ 'on_ft': 'shell',
				\ })
	call dein#add('WolfgangMehner/lua-support', {
				\ 'on_ft': 'lua',
				\ })
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
				\ })
	call dein#add('OmniSharp/omnisharp-vim', {
				\ 'on_ft': 'cs',
				\ })
	" TODO: Localhost cannot work <26-10-19> "
	call dein#add('4Evergreen4/vim-hardy')
	call dein#add('suoto/vim-hdl', {
				\ 'if': has('python') || has('python3'),
				\ 'build': 'pip3 install -r .ci/requirements.txt --user',
				\ 'on_ft': ['vhdl', 'verilog', 'systemverilog', 'verilog_systemverilog'],
				\ })
	call dein#add('vhda/verilog_systemverilog.vim', {
				\ 'on_ft': ['verilog', 'systemverilog', 'verilog_systemverilog'],
				\ })
	" 5}}} Compile "

	" Debug {{{5 "
	call dein#add('vim-vdebug/vdebug', {
				\ 'if': has('python3'),
				\ 'on_ft': ['php', 'python', 'ruby', 'perl', 'javascript', 'tcl'],
				\ })
	" 5}}} Debug "
	" 4}}} Program "

	" SpecialFunction {{{4 "
	" Terminal {{{5 "
	call dein#add('Shougo/deol.nvim', {
				\ 'on_cmd': ['Deol', 'DeolCd', 'DeolEdit'],
				\ })
	call dein#add('sillybun/vim-repl', {
				\ 'on_cmd': 'REPLToggle',
				\ })
	" 5}}} Terminal "

	" Tool {{{5 "
	call dein#add('itchyny/calendar.vim', {
				\ 'on_cmd': 'Calendar',
				\ })
	call dein#add('azadkuh/vim-cmus', {
				\ 'if': executable('cmus'),
				\ 'on_cmd': 'Cmus',
				\ })
	call dein#add('vim-scripts/qiushibaike', {
				\ 'if': has('python'),
				\ 'on_cmd': ['QB', 'QBReset', 'QBHot'],
				\ })
	call dein#add('PascalZh/vim-badapple', {
				\ 'if': has('python3'),
				\ 'on_cmd': 'BadApple',
				\ })
	call dein#add('tyru/open-browser.vim', {
				\ 'on_cmd': ['OpenBrowser', 'OpenBrowserSearch', 'OpenBrowserSmartSearch'],
				\ 'on_map': '<Plug>(openbrowser-',
				\ })
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
	" 5}}} Tool "

	" Cypher {{{5 "
	call dein#add('tkhren/vim-fake', {
				\ 'on_func': ['fake#gen', 'fake#define'],
				\ })
	" 5}}} Cypher "

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
				\ 'on_cmd': ['Mario', 'Puyo'],
				\ })
	call dein#add('rbtnn/mario.vim', {
				\ 'depends': 'rbtnn/game_engine.vim',
				\ 'on_cmd': 'Mario',
				\ })
	call dein#add('rbtnn/puyo.vim', {
				\ 'depends': 'rbtnn/game_engine.vim',
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
nnoremap <Leader>px :call delete('~/.vim/cache_gvim')<CR>:call delete('~/.vim/cache_vim')<CR>
" 3}}} Shougo/dein.vim "
" haya14busa/dein-command.vim {{{3 "
nnoremap <Leader>pc :<C-u>Dein clean<CR>
nnoremap <Leader>pr :<C-u>Dein recache_runtimepath<CR>
nnoremap <Leader>pi :<C-u>Dein install<CR>
nnoremap <Leader>pI :<C-u>Dein install<Space>
nnoremap <Leader>pu :<C-u>Dein update<CR>
nnoremap <Leader>pU :<C-u>Dein update<Space>
" 3}}} haya14busa/dein-command.vim "
" 2}}} PluginManage "

" PluginDetect {{{2 "
"  {{{3 "
nnoremap <Leader>lq :copen<CR>
nnoremap <Leader>ll :lopen<CR>
" 3}}}  "
" tpope/vim-scriptease {{{3 "
nnoremap <Leader>pp :PP<CR>
nmap <Leader>ps <Plug>ScripteaseSynnames
nnoremap <Leader>pt :Time<Space>
nnoremap <Leader>lm :Message<CR>
nnoremap <Leader>lp :Scriptnames<CR>
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
set fileencodings^=cp936
set fileencodings^=utf-8
" 3}}}  "
" vimchina/vim-fencview {{{3 "
if has('iconv') && executable('tellenc')
	let g:fencview_autodetect = 1
	let g:fencview_auto_patterns='*.txt,*.md,*.org,*.htm{l\=}'
	nnoremap <Leader>xf :<C-u>FencView<CR>
	"let $FENCVIEW_TELLENC = 'tellenc'
endif
" 3}}} vimchina/vim-fencview "
" 2}}} Encoding "

" Help {{{2 "
" Shougo/echodoc.vim {{{3 "
if !has('nvim')
	let g:echodoc#type = 'floating'
else
	let g:echodoc#type = 'popup'
endif
" To use echodoc, you must increase 'cmdheight' value.
"set cmdheight=2 " 设置命令行的高度
set noshowmode
let g:echodoc_enable_at_startup = 1
" 3}}} Shougo/echodoc.vim "
" 2}}} Help "

" Log {{{2 "
" AD7six/vim-activity-log {{{3 "
let g:activity_log_location = $VIMDATA.'/.vim-activity-log/%Y/%m/%d.log'
" 3}}} AD7six/vim-activity-log "
" 2}}} Log "

" Language {{{2 "
if has('python3')
	" voldikss/vim-translator {{{3 "
	let g:translator_history_enable = 1
	let g:translator_window_max_width = &columns
	let g:translator_window_max_height = &lines
	let g:translator_default_engines = ['google', 'bing', 'ciba', 'youdao', executable('trans')? 'trans': '', executable('sdcv')? 'sdcv': '']
	let g:translator_window_borderchars = v:null
	nmap <Leader>te <Plug>Translate
	xmap <Leader>te <Plug>TranslateV
	nnoremap <Leader>tR :Translate -w<Space>
	nmap <Leader>tt <Plug>TranslateW
	xmap <Leader>tt <Plug>TranslateWV
	nnoremap <Leader>tT :TranslateW -w<Space>
	nmap <Leader>tr <Plug>TranslateR
	xmap <Leader>tr <Plug>TranslateRV
	nnoremap <Leader>tR :TranslateR -w<Space>
	nnoremap <Leader>th :TranslateH<CR>
	" 3}}} voldikss/vim-translator "
endif
" 2}}} Language "
" 1}}} Default "

" Key {{{1 "
" HotkeyManage {{{2 "
"  {{{3 "
" noVi {{{4 "
nnoremap gO i<Esc>:<C-u>%s/\v\n{3,}/\r\r/ge<CR>`^zv{O<Esc>:let @/ = ''<CR>o
nnoremap go i<Esc>:<C-u>%s/\v\n{3,}/\r\r/ge<CR>`^zv}O<Esc>:let @/ = ''<CR>o
nnoremap S dhi
nnoremap ~ "ayl:execute @a =~ '\a'?'normal! ~':'let @+ = @a'<CR>
xnoremap <C-t> <Esc>`.``gvp``:execute 'normal! '.((&virtualedit =~ 'onemore' && col('.') ==# col('$') - 1)?'p':'P')<CR>
cnoremap <M-q> <C-u>visual<CR>
nnoremap g. :<C-u>execute v:count?v:count.'go':''<CR><C-g>
xnoremap g. go
nnoremap g: <Bar>
xnoremap g: <Bar>
nnoremap gG g<C-g>
xnoremap gG g<C-g>
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
" Cursormodify {{{4 "
nnoremap <BS> yl
nnoremap <S-BS> yh
" 4}}} Cursormodify "
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
xnoremap gn <Esc>gn
xnoremap gN <Esc>gN
onoremap gn gn
onoremap gN gN
nnoremap zn gn<Esc>
nnoremap zN gN<Esc>
xnoremap zn gn
xnoremap zN gN
onoremap zn vgn
onoremap zN vgN
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
"nnoremap [z [z
"nnoremap ]z ]z
nnoremap [Z 99[z
nnoremap ]Z 99]z
nnoremap [c [c
nnoremap ]c ]c
nnoremap [C 99[c
nnoremap ]C 99]c
nnoremap [s [s
nnoremap ]s ]s
nnoremap [S 99[s
nnoremap ]S 99]s
"xnoremap [z [z
"xnoremap ]z ]z
xnoremap [Z 99[z
xnoremap ]Z 99]z
xnoremap [c [c
xnoremap ]c ]c
xnoremap [C 99[c
xnoremap ]C 99]c
xnoremap [s [s
xnoremap ]s ]s
xnoremap [S 99[s
xnoremap ]S 99]s
"onoremap [z [z
"onoremap ]z ]z
onoremap [Z 99[z
onoremap ]Z 99]z
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
nnoremap <C-Tab> <C-w>w
nnoremap <C-S-Tab> <C-w>W
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-w>t <C-w>t
nnoremap <C-w>b <C-w>b
nnoremap <C-w>r <C-w>r
nnoremap <C-w>R <C-w>R
xnoremap <C-Tab> y<C-w>wp
xnoremap <C-S-Tab> y<C-w>Wp
xnoremap <C-j> y<C-w>jp
xnoremap <C-k> y<C-w>kp
xnoremap <C-h> y<C-w>hp
xnoremap <C-l> y<C-w>lp
xnoremap <C-w>t y<C-w>tp
xnoremap <C-w>b y<C-w>bp
xnoremap <C-w>r y<C-w>rp
xnoremap <C-w>R y<C-w>Rp
nnoremap <C-w>x <C-w>x
xnoremap <C-w>x <C-w>x
nnoremap <C-]> <C-]>
xnoremap <C-]> <C-]>
" 4}}} windowMoveCursor "
" cursorMoveWindow {{{4 "
nnoremap <M-j> <C-w>J
nnoremap <M-k> <C-w>K
nnoremap <M-h> <C-w>H
nnoremap <M-l> <C-w>L
xnoremap <M-j> <C-w>J
xnoremap <M-k> <C-w>K
xnoremap <M-h> <C-w>H
xnoremap <M-l> <C-w>L
" 4}}} cursorMoveWindow "
" windowModify {{{4 "
nnoremap <C-w>j <C-w>+
nnoremap <C-w>k <C-w>-
nnoremap <C-w>J 1<C-w>_
nnoremap <C-w>K <C-w>_
nnoremap <C-w>h <C-w><
nnoremap <C-w>l <C-w>>
nnoremap <C-w>H 1<C-w><Bar>
nnoremap <C-w>L <C-w><Bar>
nnoremap <C-w>= <C-w>=
xnoremap <C-w>j <C-w>+
xnoremap <C-w>k <C-w>-
xnoremap <C-w>J 1<C-w>_
xnoremap <C-w>K <C-w>_
xnoremap <C-w>h <C-w><
xnoremap <C-w>l <C-w>>
xnoremap <C-w>H 1<C-w><Bar>
xnoremap <C-w>L <C-w><Bar>
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
nnoremap <C-w>f <C-w>f
nnoremap <C-w>F <C-w>F
nnoremap <C-w>i <C-w>i
nnoremap <C-w>d <C-w>d
xnoremap <C-w>f <C-w>f
xnoremap <C-w>F <C-w>F
xnoremap <C-w>i <C-w>i
xnoremap <C-w>d <C-w>d
" 4}}} windowOpen "
" windowClose {{{4 "
nnoremap <C-q> :<C-u>xit<CR>
nnoremap <M-q> :<C-u>quit!<CR>
nnoremap <C-s> :<C-u>write<CR>
xnoremap <C-q> y:xit<CR>
xnoremap <M-q> y:quit!<CR>
xnoremap <C-s> y:write<CR>
nnoremap <C-w>c <C-w>c
nnoremap <C-w>o <C-w>o
nnoremap <C-w>q <C-w>q
xnoremap <C-w>c <C-w>c
xnoremap <C-w>o <C-w>o
xnoremap <C-w>q <C-w>q
nnoremap <C-w>u :hide<CR>
xnoremap <C-w>u :<C-u>hide<CR>
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
nnoremap g[ g<C-]>
xnoremap gf gf
xnoremap gF gF
xnoremap g] g]
xnoremap g[ g<C-]>
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
xnoremap gA g<C-a>
xnoremap gX g<C-x>
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
" 4}}} edit "
" keymap {{{4 "
nnoremap <Leader>k1 :set keymap=pinyin<CR>
nnoremap <Leader>k2 :set keymap=accents<CR>
nnoremap <Leader>kaa :set keymap=arabic<CR>
nnoremap <Leader>kae :set keymap=armenian-eastern<CR>
nnoremap <Leader>kaw :set keymap=armenian-western<CR>
nnoremap <Leader>kbj :set keymap=belarusian-jcuken<CR>
nnoremap <Leader>kbb :set keymap=bulgarian-bds<CR>
nnoremap <Leader>kbp :set keymap=bulgarian-phonetic<CR>
nnoremap <Leader>kcw :set keymap=canfr-win<CR>
nnoremap <Leader>kcz :set keymap=czech<CR>
nnoremap <Leader>kcc :set keymap=croatian<CR>
nnoremap <Leader>ke :set keymap=esperanto<CR>
nnoremap <Leader>kd :set keymap=dvorak<CR>
nnoremap <Leader>kg :set keymap=greek<CR>
nnoremap <Leader>khh :set keymap=hebrew<CR>
nnoremap <Leader>khp :set keymap=hebrewp<CR>
nnoremap <Leader>kka :set keymap=kana<CR>
nnoremap <Leader>kkj :set keymap=kazakh-jcuken<CR>
nnoremap <Leader>klb :set keymap=lithuanian-baltic<CR>
nnoremap <Leader>kma :set keymap=magyar<CR>
nnoremap <Leader>kmo :set keymap=mongolian<CR>
nnoremap <Leader>koo :set keymap=oldturkic-orkhon<CR>
nnoremap <Leader>koy :set keymap=oldturkic-yenisei<CR>
nnoremap <Leader>kpi :set keymap=persian-iranian<CR>
nnoremap <Leader>kpp :set keymap=persian<CR>
nnoremap <Leader>kps :set keymap=polish-slash<CR>
nnoremap <Leader>krd :set keymap=russian-dvorak<CR>
nnoremap <Leader>krj :set keymap=russian-jcuken<CR>
nnoremap <Leader>krm :set keymap=russian-jcukenmac<CR>
nnoremap <Leader>krw :set keymap=russian-jcukenwin<CR>
nnoremap <Leader>krt :set keymap=russian-jcukenwintype<CR>
nnoremap <Leader>kry :set keymap=russian-yawerty<CR>
nnoremap <Leader>ksl :set keymap=serbian-latin<CR>
nnoremap <Leader>kss :set keymap=serbian<CR>
nnoremap <Leader>ksp :set keymap=sinhala-phonetic<CR>
nnoremap <Leader>ksi :set keymap=sinhala<CR>
nnoremap <Leader>ksl :set keymap=slovak<CR>
nnoremap <Leader>ktt :set keymap=tamil_tscii<CR>
nnoremap <Leader>ktp :set keymap=thaana-phonetic<CR>
nnoremap <Leader>kth :set keymap=thaana<CR>
nnoremap <Leader>kud :set keymap=ukrainian-dvorak<CR>
nnoremap <Leader>kuj :set keymap=ukrainian-jcuken<CR>
nnoremap <Leader>kvt :set keymap=vietnamese-telex<CR>
nnoremap <Leader>kvv :set keymap=vietnamese-viqr<CR>
nnoremap <Leader>kvn :set keymap=vietnamese-vni<CR>
" 4}}} keymap "
" vimL {{{4 "
nnoremap <Leader>vx :<C-u>X<CR>
nnoremap <Leader>v= :<C-u>redir @
nnoremap <Leader>v+ :<C-u>redir END<CR>
nnoremap <Leader>vR :<C-u>recover<CR>
nnoremap <Leader>vc :<C-u>cd %:p:h<CR>
nnoremap <Leader>vC :<C-u>cd <cfile><CR>
xnoremap <Leader>vc y:cd <C-r>0<CR>
nnoremap <Leader>vo :<C-u>options<CR>
nnoremap <Leader>vp :hardcopy<CR>
xnoremap <Leader>vp :hardcopy<CR>
nnoremap <Leader>vm :<C-u>setlocal makeprg&<CR>
nnoremap <Leader>vv :<C-u>execute 'split $VIMCONFIG/ftplugin/'.split(&filetype, '\.')[0].'.vim'<CR>
nnoremap <Leader>vg :<C-u>execute 'vim //gj '.expand('<cfile>')<CR><S-Left>
xnoremap <Leader>vg y:execute 'vim //gj '.@0<CR><S-Left>
nnoremap <Leader>vd :<C-u>diffsplit<Space>
xnoremap <Leader>vd y:diffsplit <C-r>0<CR>
" 4}}} vimL "
nnoremap <Leader>vh :TOhtml<CR>
xnoremap <Leader>vh :TOhtml<CR>
nnoremap <Leader>vn /<C-r>*<CR>
xnoremap <Leader>vn y/<C-r>0<CR>
nnoremap <Leader>vN ?<C-r>*<CR>
xnoremap <Leader>vN y?<C-r>0<CR>
" substitute {{{4 "
nnoremap <Leader>rr :%s///gc<Left><Left><Left><Left>
xnoremap <Leader>rr :s///gc<Left><Left><Left><Left>
nnoremap <Leader>rc :%s///gn<Left><Left><Left><Left>
xnoremap <Leader>rc :s///gn<Left><Left><Left><Left>
nnoremap <Leader>rd :%s/\v\n{2,}/\r\r/g<CR>
xnoremap <Leader>rd :%s/\v\n\{2,}/\r\r/g<CR>
nnoremap <Leader>r/ :s=\\=\/=g<CR>
xnoremap <Leader>r/ :s=\\=\/=g<CR>
if has('win32')
	nnoremap <Leader>r? :s=\/=\\=g<CR>
	xnoremap <Leader>r? :s=\/=\\=g<CR>
else
	nnoremap <Leader>r\ :s=\/=\\=g<CR>
	xnoremap <Leader>r\ :s=\/=\\=g<CR>
endif
nnoremap <Leader>r\ :s=\/=\\=g<CR>
xnoremap <Leader>r\ :s=\/=\\=g<CR>
nnoremap <Leader>r<Bar> :s=\\\\=\\=gc<CR>
xnoremap <Leader>r<Bar> :s=\\\\=\\gc<CR>
nnoremap <Leader>r<Tab> :s=\\=\\\\=gc<CR>
xnoremap <Leader>r<Tab> :s=\\=\\\\=gc<CR>
nnoremap <Leader>rs :s/\v \|　//gc<CR>
xnoremap <Leader>rs :s/\v \|　//gc<CR>
nnoremap <Leader>rz :<C-u>call init#substitute#main('%', [g:zhdict], 'ce')<CR>
nnoremap <Leader>re :<C-u>call init#substitute#main('%', [g:endict], 'ce')<CR>
nnoremap <Leader>rt :<C-u>call init#substitute#main('%', g:texdicts, 'ce')<CR>
nnoremap <Leader>rl :<C-u>call init#substitute#main('%', [g:listdict], 'ce')<CR>
xnoremap <Leader>rz :<C-u>call init#substitute#main('*', [g:zhdict], 'ce')<CR>
xnoremap <Leader>re :<C-u>call init#substitute#main('*', [g:endict], 'ce')<CR>
xnoremap <Leader>rt :<C-u>call init#substitute#main('*', g:texdicts, 'ce')<CR>
xnoremap <Leader>rl :<C-u>call init#substitute#main('*', [g:listdict], 'ce')<CR>
let g:zhdict = {
			\ ',': '，',
			\ '\v\.': '。',
			\ ';': '；',
			\ '!': '！',
			\ '\v\?': '？',
			\ '%': '％',
			\ }
let g:endict = {
			\ '\s*,\s*': ', ',
			\ '\v\s*\.\s*': '.',
			\ '\s*-\s*': ' - ',
			\ '\v\s*\+\s*': ' + ',
			\ '\v\s*\/\s*': ' / ',
			\ '\v\s*=\s*': ' = ',
			\ '\v\s*<\s*': ' < ',
			\ '\v\s*>\s*': ' > ',
			\ }
let g:texdict_blackslash = {
			\ '\\': '\\blackslash',
			\ }
let g:texdict_math = {
			\ '\v^\d(\.|．)\s*': '\t\\item ',
			\ '%': '\\%',
			\ '\V&': '\\\&',
			\ '\V~': '\\sim',
			\ '\V≈': '\\approx',
			\ '\V^': '\\^',
			\ '\V$': '\\$',
			\ '_': '\\_',
			\ '@': '\\@',
			\ '#': '\\#',
			\ '\V[': '\\[',
			\ '\V]': '\\]',
			\ '\v\{': '\\{',
			\ '\v\}': '\\}',
			\ }
let g:texdict_quote = {
			\ '“': '\\enquote{',
			\ '”': '}',
			\ '‘': '\\enquote{',
			\ '’': '}',
			\ }
let g:texdicts = [g:texdict_blackslash, g:texdict_math, g:texdict_quote]
let g:listdict = {
			\ ',': ''', ''',
			\ '{': '{''',
			\ '}': '''}',
			\ }
" 4}}} substitute "
" shell {{{4 "
nnoremap <Leader>hv :<C-u>silent !gvim -u $VIMCONFIG/test.vim<CR>
nnoremap <Leader>he :<C-u>call pandoc#hypertext#OpenSystem(expand('%'))<CR>
" 4}}} shell "
" 3}}}  "
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
let s:quickui_color_schemes_path = split(glob($GITHUBWORKSPACE.'/skywind3000/vim-quickui/colors/quickui/*.vim'))
let g:quickui_color_schemes = []
for s:quickui_color_scheme_path in s:quickui_color_schemes_path
	let s:quickui_color_scheme = split(split(s:quickui_color_scheme_path, expand('/'))[-1], '\.')[0]
	execute 'nnoremap <Leader>q'.len(g:quickui_color_schemes).' :<C-u>call QuickThemeChange("'.s:quickui_color_scheme.'")<CR>'
	let g:quickui_color_schemes += [s:quickui_color_scheme]
endfor
let g:quickui_color_scheme = g:quickui_color_schemes[rand()%len(g:quickui_color_schemes)]
nnoremap <Leader>qq :<C-u>call quickui#menu#open()<CR>
nnoremap <Leader>qf :<C-u>call quickui#tools#list_function()<CR>
nnoremap <Leader>qt :<C-u>call quickui#tools#preview_tag('')<CR>
nnoremap <Leader>q` :<C-u>call QuickThemeChange(g:quickui_color_schemes[rand()%len(g:quickui_color_schemes)])<CR>
" 3}}} skywind3000/vim-quickui "
" tpope/vim-unimpaired {{{3 "
nmap y<Space> <Plug>unimpairedBlankUp<Plug>unimpairedBlankDown
" 3}}} tpope/vim-unimpaired "
" tpope/vim-rsi {{{3 "
inoremap <expr><C-q> pumvisible()?"\<C-y>": "\<C-q>"
inoremap <expr><M-q> pumvisible()?"\<C-e>": "\<M-q>"
inoremap <expr><C-p> pumvisible()?"\<C-p>": "\<Up>"
inoremap <expr><C-n> pumvisible()?"\<C-n>": "\<Down>"
inoremap <expr><C-v> pumvisible()?"\<PageDown>": "\<C-v>"
inoremap <expr><M-v> pumvisible()?"\<PageUp>": "\<M-v>"
inoremap <S-CR> <C-o>O
inoremap <C-CR> <C-o>o
inoremap <C-BS> <C-k>
inoremap <S-BS> <C-r>
inoremap <S-space> <C-v>
cnoremap <C-BS> <C-k>
cnoremap <S-BS> <C-r>
cnoremap <S-space> <C-v>
cnoremap <S-CR> <C-f>
cnoremap <C-TAB> <C-d>
inoremap <C-k> <C-o>:<C-u>set virtualedit +=onemore<CR><C-o>d$<C-o>:set virtualedit -=onemore<CR>
cnoremap <C-k> <C-f>i<C-o>:<C-u>set virtualedit +=onemore<CR><C-o>d$<C-o>:set virtualedit -=onemore<CR><C-c>
inoremap <C-v> <PageDown>
if has('win32')
	inoremap ö <PageUp>
else
	inoremap <M-v> <PageUp>
endif
inoremap <C-z> <C-o>dd
inoremap <C-s> <C-o>/
inoremap <C-r> <C-o>?
inoremap <C-y> <C-o>P
imap <M-y> <C-o>p<C-p>
inoremap <M-,> <C-o>gg
if has('win32')
	inoremap <M-.>  <C-o>G
else
	inoremap <M-.> <C-o>G
endif
inoremap <M-j> <C-e>
inoremap <M-k> <C-y>
snoremap <C-b> <Left>
snoremap <C-f> <Right>
snoremap <C-n> <Down>
snoremap <C-p> <Up>
snoremap <C-a> <Home>
snoremap <C-e> <End>
snoremap <C-y> <C-g>pgv<C-g>
snoremap <M-b> <S-left>
snoremap <M-f> <S-right>
snoremap <M-v> <PageUp>
snoremap <C-v> <PageDown>
snoremap <M-a> <C-Home>
snoremap <M-e> <C-End>
snoremap <M-x> <Esc>:
" 3}}} tpope/vim-rsi "
" 2}}} HotkeyManage "

" KeyMap {{{2 "
" vim-scripts/VimIM {{{3 "
set imdisable
let g:Vimim_punctuation = 3
let g:Vimim_cloud = 'sogou,google,baidu,qq'
let g:Vimim_map = ['no-gi', 'no-search']
nnoremap zi a<C-R>=g:Vimim_gi()<CR>
nnoremap <Leader>zn :<C-u>call g:Vimim_search()<CR>n
let g:Vimim_mode = 'dynamic'
let g:Vimim_mycloud = 1
let g:Vimim_plugin = $VIMCONFIG.'/.VimIM'
let g:Vimim_shuangpin = 'ms'
let g:Vimim_toggle = 'pinyin'
nnoremap <Leader>zv :<C-u>ViMiM<CR>
nnoremap <C-Space> i<C-R>=g:Vimim_chinese()<CR><Esc>
inoremap <C-Space> <C-R>=g:Vimim_chinese()<CR>
cnoremap <C-Space> <C-F>i<C-R>=g:Vimim_chinese()<CR>
" 3}}} vim-scripts/VimIM "
" gu-fan/mathematic.vim {{{3 "
nnoremap <Leader>k<Tab> :KeyHelper<CR>
" 3}}} gu-fan/mathematic.vim "
" 2}}} KeyMap "

" MacroExplore {{{2 "
" vim-scripts/marvim {{{3 "
let g:marvim_store = $VIMCONFIG.'/.marvim'
let g:marvim_find_key = 'q'''
let g:marvim_store_key = 'q`'
let g:marvim_register = 'q'
" 3}}} vim-scripts/marvim "
" dohsimpson/vim-macroeditor {{{3 "
nnoremap q= :MacroEdit<Space>
" 3}}} dohsimpson/vim-macroeditor "
" 2}}} MacroExplore "
" 1}}} Key "

" Appearance {{{1 "
" Colorscheme {{{2 "
"  {{{3 "
nnoremap <Leader>uh :source $VIMRUNTIME/syntax/hitest.vim<CR>
nnoremap <Leader>ue :colorscheme\| AirlineTheme\| set guifont\| echo g:quickui_color_scheme\| echo g:Lf_StlColorscheme<CR>
let g:available_colorschemes = ['random']
let g:available_colorschemes += ['eclipse']
let g:available_colorschemes += ['darkeclipse']
let g:available_colorschemes += ['molokai']
let g:available_colorschemes += ['solarized']
let g:available_colorschemes += ['pencil']
let g:available_colorschemes += ['bubblegum']
let g:available_colorschemes += ['gruvbox']
let g:available_colorschemes += ['space-vim-dark']
let g:available_colorschemes += ['spacemacs-theme']
let g:available_airline_themes = ['random']
let g:available_airline_themes += ['ouo']
let g:available_airline_themes += ['qwq']
let g:available_airline_themes += ['solarized_flood']
let g:available_airline_themes += ['badwolf']
let g:available_airline_themes += ['molokai']
let g:available_airline_themes += ['solarized']
let g:available_airline_themes += ['light']
let g:available_airline_themes += ['bubblegum']
let g:available_airline_themes += ['badcat']
let g:which_key_map_leader = {}
for s:indexColorscheme in range(min([len(g:available_colorschemes), 10]))
	let g:which_key_map_leader[s:indexColorscheme] = {'name': '+'.g:available_colorschemes[s:indexColorscheme]}
	for s:indexAirline in range(min([len(g:available_airline_themes), 10]))
		execute 'nnoremap <Leader>'.s:indexColorscheme.s:indexAirline.' :colorscheme '.g:available_colorschemes[s:indexColorscheme].'\| AirlineTheme '.g:available_airline_themes[s:indexAirline].'<CR>'
		let g:which_key_map_leader[s:indexColorscheme][''.s:indexAirline] = g:available_airline_themes[s:indexAirline]
	endfor
endfor
for s:indexColorscheme in range(min([len(g:available_colorschemes), 10]))
	execute 'nnoremap <Leader>'.s:indexColorscheme.'` :colorscheme '.g:available_colorschemes[s:indexColorscheme].'<CR>'
endfor
let g:which_key_map_leader['`'] = {
			\ 'name': '+vim-airline-themes&vim-colorschemes',
			\ '`': 'split colorscheme',
			\ 'e': 'split AirlineTheme',
			\ }
for s:indexAirline in range(min([len(g:available_airline_themes), 10]))
	execute 'nnoremap <Leader>`'.s:indexAirline.' :AirlineTheme '.g:available_airline_themes[s:indexAirline].'<CR>'
	let g:which_key_map_leader['`'][s:indexAirline] = g:available_airline_themes[s:indexAirline]
endfor
" 3}}}  "
" flazz/vim-colorschemes {{{3 "
nnoremap <Leader>`` :execute 'split '.$GITHUBWORKSPACE.'/flazz/vim-colorschemes/colors/'.g:colors_name.'.vim'<CR>
" 3}}} flazz/vim-colorschemes "
" vim-airline/vim-airline-themes {{{3 "
nnoremap <Leader>`e :execute 'split '.$GITHUBWORKSPACE.'/vim-airline/vim-airline-themes/autoload/airline/themes/'.g:airline_theme.'.vim'<CR>
" 3}}} vim-airline/vim-airline-themes "
" reedes/vim-thematic {{{3 "
let g:thematic#themes = {
			\ 'random' :{
			\ 'colorscheme': 'random',
			\ 'background': 'dark',
			\ },
			\ 'molokai' :{
			\ 'colorscheme': 'molokai',
			\ 'airline-theme': 'molokai',
			\ 'background': 'dark',
			\ },
			\ 'solarized_flood' :{
			\ 'colorscheme': 'solarized',
			\ 'airline-theme': 'solarized_flood',
			\ 'background': 'dark',
			\ },
			\ 'bubblegum' :{
			\ 'colorscheme': 'bubblegum',
			\ 'airline-theme': 'bubblegum',
			\ 'background': 'dark',
			\ },
			\ 'pencil' :{
			\ 'colorscheme': 'pencil',
			\ 'airline-theme': 'dark',
			\ 'background': 'dark',
			\ },
			\ 'darkeclipse' :{
			\ 'colorscheme': 'darkeclipse',
			\ 'airline-theme': 'dark',
			\ 'background': 'dark',
			\ },
			\ 'space-vim-dark' :{
			\ 'colorscheme': 'space-vim-dark',
			\ 'airline-theme': 'dark',
			\ 'background': 'dark',
			\ },
			\ 'spacemacs-theme' :{
			\ 'colorscheme': 'spacemacs-theme',
			\ 'airline-theme': 'badwolf',
			\ 'background': 'dark',
			\ },
			\ 'gruvbox' :{
			\ 'colorscheme': 'gruvbox',
			\ 'airline-theme': 'badwolf',
			\ 'background': 'dark',
			\ },
			\ }
augroup init_ThematicRandom "{{{
	autocmd!
	autocmd VimEnter * ThematicRandom
				\| highlight Conceal guibg=NONE
	autocmd ColorScheme * highlight Conceal guibg=NONE
augroup END "}}}
nnoremap <Leader>uU :Thematic<Space>
nnoremap <Leader>uu :ThematicRandom<CR>:AirlineTheme random<CR>
nnoremap <Leader>u` :ThematicRandom<CR>
nnoremap <Leader>`u :AirlineTheme random<CR>
nnoremap [X :ThematicPrevious<CR>
nnoremap ]X :ThematicNext<CR>
nnoremap [Y :ThematicFirst<CR>
nnoremap ]Y :ThematicFirst<CR>:ThematicPrevious<CR>
" 3}}} reedes/vim-thematic "
" 2}}} Colorscheme "

" Highlight {{{2 "
" luochen1990/rainbow {{{3 "
let g:rainbow_active = 1
nnoremap <Leader>or :RainbowToggle<CR>
" 3}}} luochen1990/rainbow "
if has('python') || has('python3')
	" jaxbot/semantic-highlight.vim {{{3 "
	nnoremap <Leader>os :SemanticHighlightToggle<CR>
	let g:semanticPersistCacheLocation = $VIMDATA.'/.semantic-highlight.vim/.semantic-highlight-cache'
	" 3}}} jaxbot/semantic-highlight.vim "
endif
" nathanaelkane/vim-indent-guides {{{3 "
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_exclude_filetypes = ['calendar', 'help', 'duzzle', 'marksbuffer', 'startify', 'defx']
nmap <Leader>oi <Plug>IndentGuidesToggle
" 3}}} nathanaelkane/vim-indent-guides "
" dbmrq/vim-redacted {{{3 "
nmap <leader>dd <Plug>Redact
vmap <leader>dd <Plug>Redact
nnoremap <leader>dr :Redact!<CR>
nnoremap <leader>dw :RedactedW<CR>
" 3}}} dbmrq/vim-redacted "
" vim-utils/vim-troll-stopper {{{3 "
nnoremap <Leader>ot :<C-u>TrollStop<CR>
" 3}}} vim-utils/vim-troll-stopper "
" Soares/longline.vim {{{3 "
nmap [J <Plug>longline#next
nmap ]J <Plug>longline#prev
nmap <Leader>oJ <Plug>longline#toggle
" 3}}} Soares/longline.vim "
" 2}}} Highlight "

" Conceal {{{2 "
" ryanoasis/vim-devicons {{{3 "
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {
			\ 'patch': '',
			\ 'aap': '',
			\ 'tex': '',
			\ 'latex': '',
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
			\ 'jar': '',
			\ 'snippets': '',
			\ 'fountain': '',
			\ 'txt': '',
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
			\ 'sql': '',
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
			\ 'pmx': '',
			\ 'pygtex': '',
			\ 'pygstyle': '',
			\ 'aux': '',
			\ 'bbl': '',
			\ 'blg': '',
			\ 'idx': '',
			\ 'ind': '',
			\ 'ilg': '',
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
			\ '\.github$': '',
			\ '.*_history': '',
			\ '\.viminfo': '',
			\ }
" 3}}} ryanoasis/vim-devicons "
" 2}}} Conceal "

" StatusBar {{{2 "
" bling/vim-airline {{{3 "
set showtabline=2
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
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
nnoremap <Leader>oa :<C-u>AirlineToggle<CR>
nnoremap <Leader>oA :<C-u>AirlineExtensions<CR>
nmap z1 <Plug>AirlineSelectTab1
nmap z2 <Plug>AirlineSelectTab2
nmap z3 <Plug>AirlineSelectTab3
nmap z4 <Plug>AirlineSelectTab4
nmap z5 <Plug>AirlineSelectTab5
nmap z6 <Plug>AirlineSelectTab6
nmap z7 <Plug>AirlineSelectTab7
nmap z8 <Plug>AirlineSelectTab8
nmap z9 <Plug>AirlineSelectTab9
nmap [<Tab> <Plug>AirlineSelectPrevTab
nmap ]<Tab> <Plug>AirlineSelectNextTab
" ale {{{ "
let g:airline#extensions#ale#error_symbol = '✗'
let g:airline#extensions#ale#warning_symbol = ''
let g:airline#extensions#ale#open_lnum_symbol = 'Ξ'
let g:airline#extensions#ale#close_lnum_symbol = ''
" }}} ale "
" quickfix {{{ "
let g:airline#extensions#quickfix#quickfix_text = ''
let g:airline#extensions#quickfix#location_text = ''
" }}} quickfix "
" vimtex {{{ "
let g:airline#extensions#vimtex#left = get(g:, 'airline_alt_left_sep', '')
let g:airline#extensions#vimtex#right = get(g:, 'airline_alt_right_sep', '')
let g:airline#extensions#vimtex#main = ''
let g:airline#extensions#vimtex#sub_main = ''
let g:airline#extensions#vimtex#sub_local = ''
let g:airline#extensions#vimtex#compiled = '✔'
let g:airline#extensions#vimtex#continuous = ''
let g:airline#extensions#vimtex#viewer = ''
" }}} vimtex "
" tabline {{{ "
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
" }}} tabline "
" wordcount {{{ "
let g:airline#extensions#wordcount#filetypes =['all']
" }}} wordcount "
" capslock {{{ "
let g:airline#extensions#capslock#symbol = '隷'
" }}} capslock "
" whitespace {{{ "
let g:airline#extensions#whitespace#trailing_format = '█%s'
let g:airline#extensions#whitespace#mixed_indent_format =
			\ '~%s'
let g:airline#extensions#whitespace#long_format = '+%s'
let g:airline#extensions#whitespace#mixed_indent_file_format =
			\ '=%s'
let g:airline#extensions#whitespace#conflicts_format = '%s'
" }}} whitespace "
" 3}}} bling/vim-airline "
" Wildog/airline-weather.vim {{{3 "
let g:weather#appid = readfile($VIMCONFIG.'/.airline-weather.vim/airline-weather.txt')[0]
let g:weather#area = readfile($VIMCONFIG.'/.airline-weather.vim/airline-weather.txt')[1]
" 3}}} Wildog/airline-weather.vim "
" Zuckonit/vim-airline-todo {{{3 "
let g:todo#directory = $VIMDATA.'/.vim-airline-todo'
let g:todo#remind = ''
let g:todo#suffix = ''
" 3}}} Zuckonit/vim-airline-todo "
" 2}}} StatusBar "

" UI {{{2 "
"  {{{3 "
set columns=999
if has('gui_running') && has('win32')
	augroup init_simalt "{{{
		autocmd!
		autocmd VimEnter * simalt ~x
	augroup END "}}}
endif
set lines=99
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
if exists(':checkhealth')
	nnoremap <Leader>pH :checkhealth<CR>
endif
augroup init_vim "{{{
	autocmd!
	autocmd VimResized * wincmd =
	autocmd BufRead * call init#locate()
	autocmd BufWrite * cclose
augroup END "}}}
function! init#locate() "{{{
	if line("'\"") > 1 && line("'\"") <= line('$')
		execute 'normal! g`"'
	endif
endfunction "}}}
" 3}}}  "
" junegunn/goyo.vim {{{3 "
nnoremap <Leader>og :Goyo<CR>
" 3}}} junegunn/goyo.vim "
" junegunn/limelight.vim {{{3  "
augroup init_Goyo "{{{
	autocmd!
	autocmd! User GoyoEnter Limelight
	autocmd! User GoyoLeave Limelight!
augroup END "}}}
nnoremap <Leader>ol :Limelight!!<CR>
" 3}}} junegunn/limelight.vim "
" thinca/vim-splash {{{3 "
let g:splash#path = $VIMCONFIG.'/vim-splash/Yoda.txt'
nnoremap <Leader>sq :<C-u>call init#quickui#splash#main()<CR>
nnoremap <Leader>sp :<C-u>Splash<CR>
" 3}}} thinca/vim-splash "
" mhinz/vim-startify {{{3 "
let g:startify_session_dir = $VIMDATA.'/.vim-startify'
let g:startify_enable_special = 0
let g:startify_change_to_dir = 1
let g:startify_change_to_vcs_root = 1
let g:startify_custom_indices = []
for s:num in range(0, 9)
	let g:startify_custom_indices += [g:maplocalleader . nr2char(s:num + 48)]
endfor
for s:num in range(0, 9)
	let g:startify_custom_indices += ['.' . nr2char(s:num + 48)]
endfor
let g:startify_bookmarks = [
			\ {g:maplocalleader.'s': '/etc/profile.d/user.sh'},
			\ {g:maplocalleader.'v': $MYVIMRC},
			\ {g:maplocalleader.'z': expand('$HOME/.zshrc')},
			\ {g:maplocalleader.'m': '/etc/portage/make.conf'},
			\ {g:maplocalleader.'a': expand('$HOME/.local/share/applications/defaults.list')},
			\ {g:maplocalleader.'x': expand('$HOME/.ssh/id_rsa.pub')},
			\ ]
augroup init_Startify "{{{
	autocmd!
	autocmd VimEnter * call s:cowsay()
augroup END "}}}
function! s:cowsay() "{{{
	if &filetype ==# ''
		let g:startify_custom_header = cowsay#cowsay(fortune#fortune(), 'dragon-and-cow')
	endif
endfunction "}}}
let g:startify_lists = [
			\ { 'type': 'sessions', 'header': ['    Sessions']},
			\ { 'type': 'files', 'header': ['    Most Recently Used']},
			\ { 'type': 'dir', 'header': ['    Most Recently Used @ ' . getcwd()] },
			\ { 'type': 'commands', 'header': ['    Commands']},
			\ { 'type': 'bookmarks', 'header': ['    Bookmarks']},
			\ ]
for s:item in g:startify_lists
	let s:item['header'][0] = s:item['header'][0] . ' (press ''<F1>'' to get help)'
endfor
nnoremap <Leader>sl :SLoad<CR>
nnoremap <Leader>sv :SSave<CR>
nnoremap <Leader>sd :SDelete<CR>
nnoremap <Leader>sc :SClose<CR>
nnoremap <Leader>ss :<C-u>call init#startify#main()<CR>
" 3}}} mhinz/vim-startify "
" 2}}} UI "

" SyntaxMarkUp {{{2 "
"  {{{3 "
command! -nargs=1 Help call init#help#main(<q-args>)
set keywordprg=:Man
let g:tex_flavor = 'latex'
let g:filetype_m = 'octave'
let g:asmsyntax = 'masm'
let g:load_doxygen_syntax=1
nnoremap <Leader>oy :let g:load_doxygen_syntax = !g:load_doxygen_syntax\| syntax on<CR>
" 3}}}  "
" sheerun/vim-polyglot {{{3 "
let g:polyglot_disabled = ['latex', 'markdown']
" 3}}} sheerun/vim-polyglot "
" vim-pandoc/vim-pandoc-syntax {{{3 "
let g:pandoc#syntax#codeblocks#embeds#langs = ['octave', 'tex']
" 3}}} vim-pandoc/vim-pandoc-syntax "
" 2}}} SyntaxMarkUp "

" SyntaxScript {{{2 "
" 2}}} SyntaxScript "

" SyntaxCompile {{{2 "
" 2}}} SyntaxCompile "

" Fold {{{2 "
"  {{{3 "
let g:javaScript_fold = 1 " JavaScript
let g:perl_fold = 1 " Perl
let g:php_folding = 1 " PHP
let g:r_syntax_folding = 1 " R
let g:ruby_fold = 1 " Ruby
let g:sh_fold_enabled = 1 " sh
let g:vimsyn_folding = 'af' " Vim script
let g:xml_syntax_folding = 1 " XML
set foldmethod=syntax
" 3}}}  "
" dbmrq/vim-chalk {{{3 "
let g:chalk_align = 0
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
" 3}}} Konfekt/FastFold "
" 2}}} Fold "
" 1}}} Appearance "

" File {{{1 "
" FileExplore {{{2 "
"  {{{3 "
set directory=$VIMDATA/swap
let g:netrw_home = $VIMDATA
let g:netrw_nogx = 1
let g:netrw_altfile = 1
augroup init_text "{{{
	autocmd!
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
" Shougo/defx.nvim {{{3 "
nnoremap <Leader>jj :<C-u>Defx `expand('%:p:h')[0] ==# '!'? getcwd(): expand('%:p:h')`<CR>
nnoremap <Leader>jJ :<C-u>Defx `getcwd()`<CR>
nnoremap <Leader>jk :<C-u>Defx<Space>
nnoremap <Leader>jz :<C-u>Defx `$HOME`/.local/share/Trash/files<CR>
nnoremap <Leader>jd :<C-u>Defx `$HOME`/Documents<CR>
nnoremap <Leader>jq :<C-u>Defx `$QQWORKSPACE`<CR>
nnoremap <Leader>ju :<C-u>Defx `$UDISK`<CR>
nnoremap <Leader>jU :<C-u>Defx /mnt/cdrom<CR>
nnoremap <Leader>jv :<C-u>Defx `$VIMCONFIG`<CR>
nnoremap <Leader>jp :<C-u>Defx /etc/portage/package.use<CR>
nnoremap <Leader>jr :<C-u>Defx `$GITHUBWORKSPACE`/`$GITNAME`<CR>
nnoremap <Leader>jR :<C-u>Defx `$GITWORKSPACE`/.cache/init.vim/.dein<CR>
nnoremap <Leader>jt :<C-u>Defx `$HOME`/.texlive/texmf-var/tex/latex<CR>
nnoremap <Leader>jf :<C-u>Defx `$HOME`/.local/share/fonts<CR>
nnoremap <Leader>jF :<C-u>Defx `$FONTS`<CR>
nnoremap <Leader>ja :<C-u>Defx `$HOME`/.local/share/applications<CR>
nnoremap <Leader>jA :<C-u>Defx `$APPLICATIONS`<CR>
nnoremap <Leader>jx :<C-u>Defx `$HOME`/.local/share/gnome-shell/extensions<CR>
" 3}}} Shougo/defx.nvim "
" linjiX/vim-defx-vista {{{3 "
nnoremap <Leader>xd :<C-u>ToggleDefxVista<CR>
" 3}}} linjiX/vim-defx-vista "
" 2}}} FileExplore "

" FileEdit {{{2 "
" airblade/vim-rooter {{{3 "
let g:rooter_change_directory_for_non_project_files = 'current'
let g:rooter_targets = '*'
let g:rooter_patterns = [
			\ 'README.mkd', 'README.md', 'README.txt',
			\ '.git/', '.svn/',
			\ '.vs/', '.vscode/', '.idea/',
			\ '.project', '.sublime-project',
			\ '.latexmkrc', '.latexmain',
			\ ]
let g:rooter_silent_chdir = 1
let g:rooter_use_lcd = 1
let g:rooter_resolve_links = 1
nnoremap <Leader>bb :Rooter<CR>
" 3}}} airblade/vim-rooter "
" mhinz/vim-hugefile {{{3 "
nnoremap <Leader>oh :HugefileToggle<CR>
let g:hugefile_trigger_size = 5
" 3}}} mhinz/vim-hugefile "
" tpope/vim-eunuch {{{3 "
nnoremap <Leader>bc :<C-u>Chmod<Space>
nnoremap <Leader>br :<C-u>Rename<Space>
nnoremap <Leader>bX :<C-u>Delete<CR>
nnoremap <Leader>bm :<C-u>Mkdir<Space>
nnoremap <Leader>bq :<C-u>Cfind<Space>
nnoremap <Leader>bl :<C-u>Lfind<Space>
nnoremap <Leader>bq :<C-u>Clocate<Space>
nnoremap <Leader>bl :<C-u>Llocate<Space>
nnoremap <Leader>bE :<C-u>SudoEdit<Space>
nnoremap <Leader>bW :<C-u>SudoWrite<CR>
nnoremap <Leader>bw :<C-u>Wall<CR>
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
nnoremap <Leader>gC :call init#clean#main(g:clean)<CR>
let g:clean = ['.git', '.svn']
nnoremap <Leader>gD :call init#clean#main(get(b:, 'clean', []))<CR>
nnoremap <Leader>gX :call init#clean#main(get(b:, 'clean_temp', []))<CR>
" 3}}}  "
" tpope/vim-fugitive {{{3 "
nnoremap <Leader>gg :G<CR>
nnoremap <Leader>gi :<C-u>!git init<CR>
nnoremap <Leader>gc :<C-u>!git clone git@github.com:Freed-Wu/.git<Left><Left><Left><Left>
nnoremap <Leader>gs :<C-u>!svn checkout https://github.com/Freed-Wu/trunk/<Left><Left><Left><Left><Left><Left>
" 3}}} tpope/vim-fugitive "
" tpope/vim-rhubarb {{{3 "
nnoremap <Leader>gx :Gbrowse<CR>
xnoremap <Leader>gx :Gbrowse<CR>
" 3}}} tpope/vim-rhubarb "
" junegunn/gv.vim {{{3 "
nnoremap <Leader>gv :GV<CR>
xnoremap <Leader>gv :GV<CR>
nnoremap <Leader>g1 :GV!<CR>
nnoremap <Leader>g2 :GV?<CR>
xnoremap <Leader>g2 :GV?<CR>
" 3}}} junegunn/gv.vim "
" junegunn/vim-github-dashboard {{{3 "
let g:github_dashboard = {
			\ 'username': $GITNAME,
			\ 'password': readfile($VIMCONFIG.'/.vim-github-dashboard/password.txt')[0]
			\ }
nnoremap <Leader>gd :GHDashboard! Freed-Wu
nnoremap <Leader>ga :GHActivity! Freed-Wu
xnoremap <Leader>gd y:GHDashboard! <C-r>0<CR>
xnoremap <Leader>ga y:GHActivity! <C-r>0<CR>
" 3}}} junegunn/vim-github-dashboard "
" mhinz/vim-signify {{{3 "
let g:signify_vcs_list = [ 'git', 'hg' ]
nmap [g <plug>(signify-prev-hunk)
nmap ]g <plug>(signify-next-hunk)
nmap [G 9999<plug>(signify-prev-hunk)
nmap ]G 9999<plug>(signify-next-hunk)
omap ig <plug>(signify-motion-inner-pending)
xmap ig <plug>(signify-motion-inner-visual)
omap ag <plug>(signify-motion-outer-pending)
xmap ag <plug>(signify-motion-outer-visual)
nnoremap <Leader>gy :<C-u>SignifyToggle<CR>
nnoremap <Leader>gY :<C-u>SignifyToggleHighlight<CR>
" 3}}} mhinz/vim-signify "
" cohama/agit.vim {{{3 "
nnoremap <Leader>gt :Agit<CR>
" 3}}} cohama/agit.vim "
" jaxbot/github-issues.vim {{{3 "
let g:github_access_token = readfile($VIMCONFIG.'/.github-issues.vim/github_access_token.txt')[0]
let g:gissues_lazy_load = 1
nnoremap <Leader>gs :Gissues<CR>
nnoremap <Leader>gp :Giadd<CR>
" 3}}} jaxbot/github-issues.vim "
" mbbill/undotree {{{3 "
let g:undotree_HelpLine = 0
let g:undotree_CustomUndotreeCmd = 'botright vertical '.'30'.' new'
let g:undotree_CustomDiffpanelCmd = 'topleft 5 new'
nnoremap <Leader>xu :<C-u>UndotreeToggle\| UndotreeFocus<CR>
set undofile
set undodir=$VIMDATA/undo
let g:undotree_HighlightChangedText  = 1
let g:undotree_DiffAutoOpen = 1
let g:undotree_RelativeTimestamp = 1
let g:undotree_HighlightSyntaxAdd = 'ShowMarksHLl'
let g:undotree_HighlightSyntaxChange = 'ShowMarksHLl'
" 3}}} mbbill/undotree "
" 2}}} VCS "
" 1}}} File "

" CursorMove {{{1 "
" TagExplore {{{2 "
" ludovicchabant/vim-gutentags {{{3 "
let g:gutentags_ctags_tagfile = '.tags'
let g:gutentags_cache_dir = $VIMDATA.'/.vim-gutentags'
let g:gutentags_modules = ['ctags', 'cscope']
" 3}}} ludovicchabant/vim-gutentags "
" skywind3000/gutentags_plus {{{3 "
let g:gutentags_plus_nomap = 1
noremap <Leader>ls :GscopeFind s <C-R><C-W><CR>
noremap <Leader>lg :GscopeFind g <C-R><C-W><CR>
noremap <Leader>lc :GscopeFind c <C-R><C-W><CR>
noremap <Leader>lt :GscopeFind t <C-R><C-W><CR>
noremap <Leader>le :GscopeFind e <C-R><C-W><CR>
noremap <Leader>lf :GscopeFind f <C-R>=expand("<cfile>")<CR><CR>
noremap <Leader>li :GscopeFind i <C-R>=expand("<cfile>")<CR><CR>
noremap <Leader>ld :GscopeFind d <C-R><C-W><CR>
noremap <Leader>la :GscopeFind a <C-R><C-W><CR>
noremap <Leader>lx :GscopeKill<CR>
" 3}}} skywind3000/gutentags_plus "
" liuchengxu/vista.vim {{{3 "
let g:vista_sidebar_width = &columns / 4
let g:vista_fold_toggle_icons = ['', '']
let g:vista_close_on_jump = 1
nnoremap <Leader>xv :Vista<CR>
" 3}}} liuchengxu/vista.vim "
" dirn/TODO.vim {{{3 "
nnoremap <Leader>lo :TODO<CR>
" 3}}} dirn/TODO.vim "
" 2}}} TagExplore "

" FuzzyFind {{{2 "
if has('python') || has('python3')
	" Yggdroot/LeaderF {{{3 "
	let g:Lf_StlSeparator = {
				\ 'left': get(g:, 'airline_left_sep', ''),
				\ 'right': get(g:, 'airline_right_sep', ''),
				\ }
	let g:Lf_RootMarkers = g:rooter_patterns
	let g:Lf_ShortcutF = '<Leader>ff'
	let g:Lf_ShortcutB = '<Leader>fb'
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
				\ '<Esc>': ['<C-q>','<Esc>'],
				\ '<C-f>': ['<C-s>'],
				\ '<S-Insert>': ['<C-y>'],
				\ '<Up>': ['<C-p>', '<Up>'],
				\ '<Down>': ['<C-n>', '<Down>'],
				\ '<C-x>': ['<C-CR>'],
				\ '<C-]>': ['<S-CR>'],
				\ '<C-t>': ['<C-S-CR>'],
				\ '<F5>': ['<C-z>'],
				\ '<C-a>': ['<C-x>'],
				\ '<BS>': ['<C-h>', '<BS>'],
				\ '<Del>': ['<C-d>', '<Del>'],
				\ '<Home>': ['<C-a>', '<Home>'],
				\ '<End>': ['<C-e>', '<End>'],
				\ '<Left>': ['<C-b>', '<Left>'],
				\ '<Right>': ['<C-f>', '<Right>'],
				\ '<C-p>': ['<C-o>'],
				\ '<C-o>': ['<C-c>'],
				\ '<C-Up>': ['<C-t>'],
				\ '<C-Down>': ['<C-v>'],
				\ }
	let g:Lf_NormalMap = {
				\ 'File': [
				\ ['i', ':exec g:Lf_py b:Lf_AnyExplManager."accept(''h'')"<CR>'],
				\ ['<F6>', ':exec g:Lf_py "bufExplManager.quit()"<CR>'],
				\ ['I', ':exec g:Lf_py b:Lf_AnyExplManager."accept(''v'')"<CR>'],
				\ ['O', ':exec g:Lf_py b:Lf_AnyExplManager."accept(''t'')"<CR>'],
				\ ['o', ':exec g:Lf_py b:Lf_AnyExplManager."accept()"<CR>'],
				\ ],
				\ 'Buffer': [[]],
				\ 'Mru': [[]],
				\ 'Tag': [],
				\ 'BufTag': [],
				\ 'Function': [],
				\ 'Line': [],
				\ 'History': [],
				\ 'Help': [],
				\ 'Self': [],
				\ 'Colorscheme': []
				\ }
	nnoremap <Leader>f<Tab> :<C-u>Leaderf self<CR>
	nnoremap <Leader>ff :<C-u>Leaderf file<CR>
	nnoremap <Leader>ft :<C-u>Leaderf filetype<CR>
	nnoremap <Leader>fw :<C-u>Leaderf window<CR>
	nnoremap <Leader>fb :<C-u>Leaderf buffer<CR>
	nnoremap <Leader>fB :<C-u>Leaderf buffer --all<CR>
	nnoremap <Leader>fa :<C-u>Leaderf buffer --tabpage<CR>
	nnoremap <Leader>fA :<C-u>Leaderf buffer --tabpage --all<CR>
	nnoremap <Leader>fm :<C-u>Leaderf mru<CR>
	nnoremap <Leader>fM :<C-u>Leaderf mru --cwd<CR>
	nnoremap <Leader>fg :<C-u>Leaderf tag<CR>
	nnoremap <Leader>fG :<C-u>Leaderf gtag<CR>
	nnoremap <Leader>f] :<C-u>Leaderf bufTag<CR>
	nnoremap <Leader>f} :<C-u>Leaderf bufTag --all<CR>
	nnoremap <Leader>fs :<C-u>Leaderf function<CR>
	nnoremap <Leader>fS :<C-u>Leaderf function --all<CR>
	nnoremap <Leader>fl :<C-u>Leaderf line<CR>
	nnoremap <Leader>fL :<C-u>Leaderf line --all<CR>
	nnoremap <Leader>f: :<C-u>Leaderf cmdHistory<CR>
	nnoremap <Leader>f/ :<C-u>Leaderf searchHistory<CR>
	nnoremap <Leader>fh :<C-u>Leaderf help<CR>
	nnoremap <Leader>fc :<C-u>Leaderf colorscheme<CR>
	nnoremap <Leader>fv :<C-u>execute 'Leaderf file '.$VIM.' --input '.split(&filetype, '\.')[0].'.vim'<CR>
	nnoremap <Leader>fV :<C-u>execute 'Leaderf file '.$GITHUBWORKSPACE.' --input '.split(&filetype, '\.')[0].'.vim'<CR>
	nnoremap <Leader>fz :<C-u>execute 'Leaderf file '.$GITHUBWORKSPACE.'/sbdchd/neoformat/autoload/neoformat/formatters --input '.split(&filetype, '\.')[0].'.vim'<CR>
	nnoremap <Leader>fZ :<C-u>execute 'Leaderf file '.$GITHUBWORKSPACE.'/w0rp/ale/ale_linters/'.split(&filetype, '\.')[0]<CR>
	nnoremap <Leader>f; :Leaderf file<Space>
	" 3}}} Yggdroot/LeaderF "
endif
" 2}}} FuzzyFind "

" MarkExplore {{{2 "
" kshenoy/vim-signature {{{3 "
nmap m<Tab> dm
" 3}}} kshenoy/vim-signature "
" 2}}} MarkExplore "

" Move {{{2 "
" easymotion/vim-easymotion {{{3 "
map <Nop> <Plug>(easymotion-prefix)
xmap <Leader><Leader>f <Plug>(easymotion-bd-f)
nmap <Leader><Leader>f <Plug>(easymotion-overwin-f)
xmap <Leader><Leader>- <Plug>(easymotion-bd-f2)
nmap <Leader><Leader>- <Plug>(easymotion-overwin-f2)
xmap <Leader><Leader>g <Plug>(easymotion-bd-jk)
nmap <Leader><Leader>g <Plug>(easymotion-overwin-line)
xmap <Leader><Leader>w <Plug>(easymotion-bd-w)
nmap <Leader><Leader>w <Plug>(easymotion-overwin-w)
" 3}}} easymotion/vim-easymotion "
" psliwka/vim-smoothie {{{3 "
nnoremap <C-D> :<C-U>call smoothie#downwards()<CR>
nnoremap <C-U> :<C-U>call smoothie#upwards()<CR>
nnoremap <C-F> :<C-U>call smoothie#forwards()<CR>
nnoremap <C-B> :<C-U>call smoothie#backwards()<CR>
" 3}}} psliwka/vim-smoothie "
" reedes/vim-wheel {{{3 "
nmap [E <Plug>(WheelUp)
xmap [E <Plug>(WheelUp)
nmap ]E <Plug>(WheelDown)
xmap ]E <Plug>(WheelDown)
nmap [F <Plug>(WheelLeft)
xmap [F <Plug>(WheelLeft)
nmap ]F <Plug>(WheelRight)
xmap ]F <Plug>(WheelRight)
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
"set incsearch " 开启实时搜索功能 sensible
set hlsearch
set ignorecase " 搜索时大小写不敏感
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
nmap \ <Plug>Sneak_s
xmap \ <Plug>Sneak_s
omap \ <Plug>Sneak_s
nmap <Bar> <Plug>Sneak_S
xmap <Bar> <Plug>Sneak_S
omap <Bar> <Plug>Sneak_S
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
nmap z\ <Plug>SneakLabel_s
nmap z<Bar> <Plug>SneakLabel_S
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
nmap / <Plug>(incsearch-easymotion-/)
nmap ? <Plug>(incsearch-easymotion-?)
xmap / <Plug>(incsearch-easymotion-/)
xmap ? <Plug>(incsearch-easymotion-?)
omap / <Plug>(incsearch-easymotion-/)
omap ? <Plug>(incsearch-easymotion-?)
nmap Q <Plug>(incsearch-easymotion-stay)
xmap Q <Plug>(incsearch-easymotion-stay)
" 3}}} haya14busa/incsearch-easymotion.vim "
" haya14busa/incsearch-fuzzy.vim {{{3 "
noremap <expr> z/ incsearch#go(init#fuzzymotion#main())
noremap <expr> z? incsearch#go(init#fuzzymotion#main({'command': '?'}))
noremap <expr> zQ incsearch#go(init#fuzzymotion#main({'is_stay': 1}))
" 3}}} haya14busa/incsearch-fuzzy.vim "
" haya14busa/incsearch-migemo.vim {{{3 "
map <Leader>z/ <Plug>(incsearch-migemo-/)
map <Leader>z? <Plug>(incsearch-migemo-?)
map <Leader>zQ <Plug>(incsearch-migemo-stay)
" 3}}} haya14busa/incsearch-migemo.vim "
" embear/vim-foldsearch {{{3 "
let g:foldsearch_disable_mappings = 1
nnoremap z<Tab>w :<C-u>Fw<CR>
nnoremap z<Tab>s :<C-u>Fs<CR>
nnoremap z<Tab>S :<C-u>FS<CR>
nnoremap z<Tab>l :<C-u>Fl<CR>
nnoremap z<Tab>i :<C-u>Fi<CR>
nnoremap z<Tab>d :<C-u>Fd<CR>
nnoremap z<Tab>e :<C-u>Fe<CR>
" 3}}} embear/vim-foldsearch "
" 2}}} Search "

" Swap {{{2 "
" kurkale6ka/vim-swap {{{3 "
xmap <Leader>rx <plug>SwapSwapOperands
xmap <Leader>rX <plug>SwapSwapPivotOperands
nmap <Leader>rk <plug>SwapSwapWithR_WORD
nmap <Leader>rj <plug>SwapSwapWithL_WORD
" 3}}} kurkale6ka/vim-swap "

" mjbrownie/swapit {{{3 "
let g:swap_no_default_key_mappings = 1
nmap <Leader>rw <Plug>(swap-interactive)
xmap <Leader>rw <Plug>(swap-interactive)
nmap <Leader>rJ <Plug>(swap-prev)
nmap <Leader>rK <Plug>(swap-next)
" 3}}} mjbrownie/swapit "
" 2}}} Swap "
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
xmap iA <Plug>(textobj-path-prev_path-i)
xmap aA <Plug>(textobj-path-prev_path-a)
xmap IA <Plug>(textobj-path-next_path-i)
xmap AA <Plug>(textobj-path-next_path-a)
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
" vim-scripts/DrawIt {{{3 "
nnoremap <Leader>da :<C-u>DIstart<CR>
" 3}}} vim-scripts/DrawIt "
" vim-scripts/sketch.vim {{{3 "
nnoremap <Leader>dt :<C-u>call ToggleSketch()<CR>
" 3}}} vim-scripts/sketch.vim "
" iwataka/cowsay.vim {{{3 "
nnoremap <Leader>d1 0d$i<C-r><C-O>=cowsay#cowsay([@"], 'milk')<CR><Esc>
nnoremap <Leader>d2 0d$i<C-r><C-O>=cowsay#cowsay([@"], 'bunny')<CR><Esc>
nnoremap <Leader>d3 0d$i<C-r><C-O>=cowsay#cowsay([@"], 'elephant')<CR><Esc>
nnoremap <Leader>d4 0d$i<C-r><C-O>=cowsay#cowsay([@"], 'eyes')<CR><Esc>
nnoremap <Leader>d5 0d$i<C-r><C-O>=cowsay#cowsay([@"], 'hellokitty')<CR><Esc>
nnoremap <Leader>d6 0d$i<C-r><C-O>=cowsay#cowsay([@"], 'daemon')<CR><Esc>
nnoremap <Leader>d7 0d$i<C-r><C-O>=cowsay#cowsay([@"], 'squirrel')<CR><Esc>
nnoremap <Leader>d8 0d$i<C-r><C-O>=cowsay#cowsay([@"], 'tux')<CR><Esc>
nnoremap <Leader>d9 0d$i<C-r><C-O>=cowsay#cowsay([@"], 'moose')<CR><Esc>
nnoremap <Leader>d0 0d$i<C-r><C-O>=cowsay#cowsay([@"], 'default')<CR><Esc>
xnoremap <Leader>d1 di<C-r><C-O>=cowsay#cowsay([@"], 'milk')<CR><Esc>
xnoremap <Leader>d2 di<C-r><C-O>=cowsay#cowsay([@"], 'bunny')<CR><Esc>
xnoremap <Leader>d3 di<C-r><C-O>=cowsay#cowsay([@"], 'elephant')<CR><Esc>
xnoremap <Leader>d4 di<C-r><C-O>=cowsay#cowsay([@"], 'eyes')<CR><Esc>
xnoremap <Leader>d5 di<C-r><C-O>=cowsay#cowsay([@"], 'hellokitty')<CR><Esc>
xnoremap <Leader>d6 di<C-r><C-O>=cowsay#cowsay([@"], 'daemon')<CR><Esc>
xnoremap <Leader>d7 di<C-r><C-O>=cowsay#cowsay([@"], 'squirrel')<CR><Esc>
xnoremap <Leader>d8 di<C-r><C-O>=cowsay#cowsay([@"], 'tux')<CR><Esc>
xnoremap <Leader>d9 di<C-r><C-O>=cowsay#cowsay([@"], 'moose')<CR><Esc>
xnoremap <Leader>d0 di<C-r><C-O>=cowsay#cowsay([@"], 'default')<CR><Esc>
" 3}}} iwataka/cowsay.vim "
" iwataka/fortune.vim {{{3 "
nnoremap <Leader>df i<C-r><C-O>=fortune#fortune()<CR><Esc>
" 3}}} iwataka/fortune.vim "
" 2}}} Draw "

" Banner {{{2 "
" pocke/vanner {{{3 "
nnoremap <Leader>dv 0d$i<C-r><C-O>=vanner#string(@", {'font': 1})<CR><Esc>
" 3}}} pocke/vanner "
" LiquidFun/vim-comment-banners {{{3 "
nnoremap <Leader>d- :<C-u>call init#banner#main('-')<CR>
nnoremap <Leader>d_ :<C-u>call init#banner#main('_')<CR>
nnoremap <Leader>d= :<C-u>call init#banner#main('=')<CR>
nnoremap <Leader>d+ :<C-u>call init#banner#main('+')<CR>
nnoremap <Leader>d* :<C-u>call init#banner#main('*')<CR>
" 3}}} LiquidFun/vim-comment-banners "
" 2}}} Banner "

" Compose {{{2 "
" junegunn/vim-easy-align {{{3 "
xmap gy <Plug>(EasyAlign)
nmap gy <Plug>(EasyAlign)
" 3}}} junegunn/vim-easy-align "
" JikkuJose/vim-VisIncr {{{3 "
xnoremap <Leader>ii :I<CR>
xnoremap <Leader>ia :IA<CR>
xnoremap <Leader>ib :IB<CR>
xnoremap <Leader>io :IO<CR>
xnoremap <Leader>ix :IX<CR>
xnoremap <Leader>id :ID<CR>
xnoremap <Leader>im :IM<CR>
xnoremap <Leader>iD :IDMY<CR>
xnoremap <Leader>iM :IMDY<CR>
xnoremap <Leader>iY :IYMD<CR>
xnoremap <Leader>iI :II<CR>
xnoremap <Leader>iA :IIA<CR>
xnoremap <Leader>iB :IIB<CR>
xnoremap <Leader>iO :IIO<CR>
xnoremap <Leader>iX :IIX<CR>
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
" 2}}} Compose "

" Format {{{2 "
"  {{{3 "
set textwidth=77
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
nmap <Leader>oj <Plug>trailguide#toggle
nmap <Leader>rf <Plug>trailguide#fix
xnoremap <Leader>rf :TrailGuide fix<CR>
" 3}}} Soares/trailguide.vim "
" sbdchd/neoformat {{{3 "
let g:neoformat_basic_format_align = 1
let g:neoformat_basic_format_retab = 1
let g:neoformat_basic_format_trim = 1
let g:neoformat_try_formatprg = 1
nnoremap gz :<C-u>set operatorfunc=init#format#main<CR>g@
nnoremap <LocalLeader>zz :.Neoformat<CR>
xnoremap <LocalLeader>zz :Neoformat<CR>
" 3}}} sbdchd/neoformat "
" svermeulen/vim-subversive {{{3 "
nmap , <plug>(SubversiveSubstitute)
xmap p <plug>(SubversiveSubstitute)
nmap q, <plug>(SubversiveSubstituteToEndOfLine)
nmap <Leader>rv <plug>(SubversiveSubstituteRange)
xmap <Leader>rv <plug>(SubversiveSubstituteRange)
nmap <Leader>rV <plug>(SubversiveSubstituteWordRange)
nmap <leader>rc <plug>(SubversiveSubstituteRangeConfirm)
xmap <leader>rc <plug>(SubversiveSubstituteRangeConfirm)
nmap <leader>rC <plug>(SubversiveSubstituteWordRangeConfirm)
" 3}}} svermeulen/vim-subversive "
" editorconfig/editorconfig-vim {{{3 "
nnoremap <Leader>ze :<C-u>EditorConfigReload<CR>
" 3}}} editorconfig/editorconfig-vim "
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
nmap gc <Plug>(caw:prefix)
xmap gc <Plug>(caw:prefix)
nmap gcc <Plug>(caw:hatpos:toggle:operator)
xmap gcc <Plug>(caw:hatpos:toggle:operator)
" 3}}} tyru/caw.vim "
" 2}}} Comment "

" Abbreviate {{{2 "
" 2}}} Abbreviate "

" Insert {{{2 "
"  {{{3 "
inoremap , ,<C-g>u<Space>
inoremap ; ;<C-g>u
inoremap : :<C-g>u
inoremap ! !<C-g>u<Space>
inoremap ? ?<C-g>u<Space>
inoremap + <Space>+<Space>
inoremap ++ ++
inoremap += <Space>+=<Space>
inoremap - <Space>-<Space>
inoremap -- --
inoremap -= <Space>-=<Space>
inoremap = <Space>=<Space>
inoremap == <Space>==<Space>
inoremap != <Space>!=<Space>
inoremap > <Space>><Space>
inoremap >=  <Space>>=<Space>
inoremap < <Space><<Space>
inoremap <=  <Space><=<Space>
inoremap * <Space>*<Space>
inoremap ** <Space>**<Space>
inoremap *. *.
inoremap & <Space>&<Space>
inoremap && <Space>&&<Space>
inoremap <Bar> <Space><Bar><Space>
inoremap <Bar><Bar> <Space><Bar><Bar><Space>
inoremap （ （）<Left>
inoremap 《 《》<Left>
inoremap 【 【】<Left>
inoremap 〖 〖〗<Left>
inoremap ‘ ‘’<Left>
inoremap “ “”<Left>
" 3}}}  "
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
execute 'set thesaurus=' . substitute(glob($VIMCONFIG.'/.thesaurus/*'), '\n', ',', 'g')
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
nnoremap <Leader>rj :%s/:\([^:]\+\):/\=emoji#for(submatch(1), submatch(0))/ge<CR>
" 3}}} junegunn/vim-emoji "
" rhysd/github-complete.vim {{{3 "
let g:github_complete_enable_omni_completion = 0
" 3}}} rhysd/github-complete.vim "
if has('python') || has('python3')
	" Shougo/deoplete.nvim {{{3 "
	if exists('&pyxversion')
		set pyxversion =3
		let g:deoplete#enable_at_startup = 1
	else
		let g:loaded_python_provider=0
	endif
	" 3}}} Shougo/deoplete.nvim "
endif
" ararslan/license-to-vim {{{3 "
let g:license_email = $GITNAME
let g:license_author = $EMAIL
nnoremap <Leader>el :<C-u>call init#quickui#license#main()<CR>
" 3}}} ararslan/license-to-vim "
" 2}}} Complete "

" Snippet {{{2 "
if has('python') || has('python3')
	" SirVer/UltiSnips {{{3 "
	let g:UltiSnipsExpandTrigger = '<Tab>'
	let g:UltiSnipsJumpForwardTrigger = '<Tab>'
	let g:UltiSnipsJumpBackwardTrigger = '<S-Tab>'
	let g:vim_snippetsUltiSnips = $GITHUBWORKSPACE.'/honza/vim-snippets/UltiSnips'
	let g:vim_snippetsSnippets = $GITHUBWORKSPACE.'/honza/vim-snippets/snippets'
	let g:UltiSnips_config = $VIMCONFIG.'/UltiSnips'
	let g:UltiSnipsSnippetDirectories = [g:UltiSnips_config, g:vim_snippetsUltiSnips]
	nnoremap <Leader>na :<C-u>UltiSnipsAddFiletypes<Space>
	nnoremap <Leader>ne :<C-u>UltiSnipsEdit<Space>
	" 3}}} SirVer/UltiSnips "
endif
" honza/vim-snippets {{{3 "
let g:snips_author = $GITNAME
let g:snips_github = $GITNAME
let g:snips_email = $EMAIL
nnoremap <Leader>nn :<C-u>execute 'split '.g:UltiSnips_config.'/'.&filetype.'.snippets'<CR>
nnoremap <Leader>nN :<C-u>execute 'split '.g:UltiSnips_config.'/all.snippets'<CR>
nnoremap <Leader>nu :<C-u>execute 'split '.g:vim_snippetsUltiSnips.'/'.&filetype.'.snippets'<CR>
nnoremap <Leader>nU :<C-u>execute 'split '.g:vim_snippetsUltiSnips.'/all.snippets'<CR>
nnoremap <Leader>ns :<C-u>execute 'split '.g:vim_snippetsSnippets.'/'.&filetype.'.snippets'<CR>
nnoremap <Leader>nS :<C-u>execute 'split '.g:vim_snippetsSnippets.'/_.snippets'<CR>
" 3}}} honza/vim-snippets "
" aperezdc/vim-template {{{3 "
let g:templates_global_name_prefix = ''
let g:templates_directory = [$VIMCONFIG.'/vim-template']
nnoremap <Leader>eV :<C-u>sfind $GITHUBWORKSPACE/aperezdc/vim-template/templates/=template=.%:e<CR>
nnoremap <Leader>ev :<C-u>execute 'Template =template=.'.expand('%:e')<CR>
nnoremap <Leader>e0 :<C-u>execute 'Leaderf file '.g:templates_directory[0].' --input='.expand('%:e')<CR>
nnoremap <Leader>ee :Template<CR>
nnoremap <Leader>eE :Template<Space>
nnoremap <Leader>eh :TemplateHere<CR>
nnoremap <Leader>eH :TemplateHere<Space>
" 3}}} aperezdc/vim-template "
" 2}}} Snippet "

" LSP {{{2 "
" neoclide/coc.nvim {{{3 "
nnoremap <Leader>po :CocInstall coc-
nnoremap <Leader>pO :CocList extensions<CR>
" 3}}} neoclide/coc.nvim "
" 2}}} LSP "

" Check {{{2 "
"  {{{3 "
set spelllang=en_us,cjk
inoremap <C-j> <C-g>u<Esc>[s1z=`]a<C-g>u
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
nnoremap <Leader>oz :<C-u>ALEToggle<CR>
nnoremap <Leader>oZ :<C-u>ALEDetail<CR>
nnoremap [k :<C-u>ALEPrevious<CR>
nnoremap ]k :<C-u>ALENext<CR>
nnoremap [K :<C-u>ALEFirst<CR>
nnoremap ]K :<C-u>ALELast<CR>
" 3}}} w0rp/ale "
" wsdjeg/ChineseLinter.vim {{{3 "
nnoremap <Leader>lz :CheckChinese<CR>
" 3}}} wsdjeg/ChineseLinter.vim "
" hotoo/pangu.vim {{{3 "
nnoremap <Leader>zp :Pangu<CR>
" 3}}} hotoo/pangu.vim "
" dbmrq/vim-ditto {{{3 "
let s:vim_ditto_config = $VIMCONFIG.'/.vim-ditto'
let g:ditto_dir = s:vim_ditto_config
nmap [w <Plug>DittoPrev
nmap ]w <Plug>DittoNext
nmap zy <Plug>DittoGood
nmap zuy <Plug>DittoBad
nmap [W <Plug>DittoLess
nmap ]W <Plug>DittoMore
nmap <Leader>zd <Plug>ToggleDitto
" 3}}} dbmrq/vim-ditto "
" reedes/vim-wordy {{{3 "
nnoremap <Leader>zw :Wordy<Space>
nnoremap <Leader>zW :NoWordy<CR>
nnoremap [U :PrevWordy<CR>
nnoremap ]U :NextWordy<CR>
" 3}}} reedes/vim-wordy "
" 2}}} Check "
" 1}}} Edit "

" Program {{{1 "
" Document {{{2 "
" 2}}} Document "

" MarkUp {{{2 "
" lervag/vimtex {{{3 "
let g:vimtex_imaps_enabled = 0
let g:vimtex_mappings_disable = {
			\ 'n': ['ds$', 'cs$', 'tsc', 'tse', 'tsd', 'tsD', '<F7>', 'K'],
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
			\ 'split_width': &columns / 4,
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
let g:vimtex_compiler_latexmk_engines = {
			\ '_': '-lualatex',
			\ }
" 3}}} lervag/vimtex "
" vimwiki/vimwiki {{{3 "
let g:vimwiki_use_mouse = 1
let g:vimwiki_valid_html_tags = 'a,img,b,i,s,u,sub,sup,br,hr,div,del,code,red,center,left,right,h1,h2,h3,h4,h5,h6,pre,script,style'
let g:vimwiki_list = [
			\ {
			\ 'path': expand('$GITHUBWORKSPACE/$GITNAME/vimwiki'),
			\ 'path_html': expand('$GITHUBWORKSPACE/$GITNAME/vimwiki/_site'),
			\ 'template_path': expand('$GITHUBWORKSPACE/$GITNAME/vimwiki/_layouts'),
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
" vim-pandoc/vim-pandoc-after {{{3 "
let g:pandoc#after#modules#enabled = ['ultisnips']
" 3}}} vim-pandoc/vim-pandoc-after "
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
let g:dbext_default_user = readfile($VIMCONFIG.'/.dbext/'.g:dbext_default_type.'.txt')[0]
let g:dbext_default_passwd = readfile($VIMCONFIG.'/.dbext/'.g:dbext_default_type.'.txt')[1]
let g:dbext_default_history_file = $VIMCONFIG.'/.dbext/dbext_sql_history.txt'
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
" 1}}} Program "

" SpecialFunction {{{1 "
" Terminal {{{2 "
" Shougo/deol.nvim {{{3 "
if exists('##TerminalOpen')
	augroup init_deol "{{{
		autocmd!
		autocmd TerminalOpen * setfiletype deol
	augroup END "}}}
endif
let g:deol#custom_map = {
			\ 'edit': 'O',
			\ 'quit': '<M-q>',
			\ }
let g:deol#extra_options = {
			\ 'term_finish': 'close',
			\ 'curwin': 0,
			\ }
execute 'nnoremap <Leader>hh :Deol '. &shell .'<CR>'
nnoremap <Leader>hd :Deol<Space>
nnoremap <Leader>ho :Deol octave<CR>
nnoremap <Leader>hp :Deol python<CR>
nnoremap <Leader>hj :Deol node<CR>
nnoremap <Leader>hn :Deol nethack<CR>
" 3}}} Shougo/deol.nvim "
" sillybun/vim-repl {{{3 "
let g:repl_program = {
			\ 'default': &shell,
			\ 'sh': executable('sh')? 'sh': &shell,
			\ 'bash': executable('bash')? 'bash': &shell,
			\ 'csh': executable('csh')? 'csh': &shell,
			\ 'ksh': executable('ksh')? 'ksh': &shell,
			\ 'wsh': executable('wsh')? 'wsh': &shell,
			\ 'mash': executable('mash')? 'mash': &shell,
			\ 'tcsh': executable('tcsh')? 'tcsh': &shell,
			\ 'gnash': executable('gnash')? 'gnash': &shell,
			\ 'fish': executable('fish')? 'fish': &shell,
			\ 'zsh': executable('zsh')? 'zsh': &shell,
			\ 'dosbatch': executable('cmd')? 'cmd': &shell,
			\ 'ps1': executable('powershell')? 'powershell': &shell,
			\ 'octave': 'octave',
			\ 'matlab': 'matlab',
			\ 'gnuplot': 'gnuplot',
			\ 'spice': 'spice',
			\ 'pdf': 'pdftk -',
			\ 'pandoc': 'pandoc -f markdown -',
			\ 'markdown': 'pandoc -f markdown_strict -',
			\ 'gfimarkdown': 'pandoc -f markdown_github -',
			\ 'commonmark': 'pandoc -f commonmark -',
			\ 'docbook': 'pandoc -f docbook -',
			\ 'docx': 'pandoc -f docx -',
			\ 'epub': 'pandoc -f epub -',
			\ 'haddock': 'pandoc -f haddock -',
			\ 'html': 'pandoc -f html -',
			\ 'json': 'pandoc -f json -',
			\ 'markdown_mmd': 'pandoc -f markdown_mmd -',
			\ 'markdown_phpextra': 'pandoc -f markdown_phpextra -',
			\ 'vimwiki': 'pandoc -f mediawiki -',
			\ 'text': 'pandoc -f native -',
			\ 'txt': 'pandoc -f native -',
			\ 'odt': 'pandoc -f odt -',
			\ 'opml': 'pandoc -f opml -',
			\ 'org': 'pandoc -f org -',
			\ 'rst': 'pandoc -f rst -',
			\ 't2t': 'pandoc -f t2t -',
			\ 'textile': 'pandoc -f textile -',
			\ 'twiki': 'pandoc -f twiki -',
			\ 'tex': 'lualatex -shell-escape',
			\ 'plaintex': 'luatex -shell-escape',
			\ 'context': 'context -shell-escape',
			\ 'c': 'gcc -x c -',
			\ 'cpp': 'gcc -x c++ -',
			\ 'ada': 'gcc -x ada -',
			\ 'objc': 'gcc -x objective-c -',
			\ 'objcpp': 'gcc -x objective-c++ -',
			\ 'f75': 'gcc -x f75 -',
			\ 'f95': 'gcc -x f95 -',
			\ 'go': 'gcc -x go -',
			\ 'java': 'gcc -x java -',
			\ 'asm': 'gcc -x asm -',
			\ 'brig': 'gcc -x brig -',
			\ }
let g:repl_python_automerge = 1
let g:repl_position = 1
nnoremap <Leader>h<Tab> :<C-u>REPLToggle<CR>
let g:sendtorepl_invoke_key = '<C-CR>'
" 3}}} sillybun/vim-repl "
" 2}}} Terminal "

" Tool {{{2 "
" itchyny/calendar.vim {{{3 "
let g:calendar_cyclic_view = 1
let g:calendar_cache_directory = $VIMDATA.'/.calendar.vim'
nnoremap <Leader>xc :Calendar -split=horizontal<CR>
nnoremap <Leader>xC :Calendar -split=horizontal<Space>
" 3}}} itchyny/calendar.vim "
" tyru/open-browser.vim {{{3 "
nmap g/ <Plug>(openbrowser-smart-search)
xmap g/ <Plug>(openbrowser-smart-search)
nnoremap <Leader>xx :<C-u>OpenBrowserSmartSearch<Space>
nnoremap <Leader>xX :<C-u>OpenBrowserSmartSearch -github<Space>
" 3}}} tyru/open-browser.vim "
" ianding1/leetcode.vim {{{3 "
let g:leetcode_username = readfile($VIMCONFIG.'/.leetcode.vim/leetcode.txt')[0]
let g:leetcode_password = readfile($VIMCONFIG.'/.leetcode.vim/leetcode.txt')[1]
let g:leetcode_china = 1
" 3}}} ianding1/leetcode.vim "
" 2}}} Tool "

" Game {{{2 "
" johngrib/vim-game-code-break {{{3 "
nnoremap <Leader>yc :<C-u>VimGameCodeBreak<CR>
" 3}}} johngrib/vim-game-code-break "
" johngrib/vim-game-snake {{{3 "
nnoremap <Leader>ys :<C-u>VimGameSnake<CR>
" 3}}} johngrib/vim-game-snake "
" deris/vim-duzzle {{{3 "
augroup init_duzzle "{{{
	autocmd!
	autocmd SourcePre duzzle.vim language message en_US
augroup END "}}}
nnoremap <Leader>yd :<C-u>call init#quickui#duzzle#main()<CR>
" 3}}} deris/vim-duzzle "
" jmanoel7/vim-games {{{3 "
nnoremap <Leader>ys :<C-u>call init#quickui#sokoban#main()<CR>
if has('python')
	nnoremap <Leader>y1 :<C-u>SudokuEasy<CR>
	nnoremap <Leader>y2 :<C-u>SudokuMedium<CR>
	nnoremap <Leader>y3 :<C-u>SudokuHard<CR>
	nnoremap <Leader>y4 :<C-u>SudokuVeryHard<CR>
	nnoremap <Leader>y0 :<C-u>SudokuCustom<Space>
endif
" 3}}} jmanoel7/vim-games "
" AshyIsMe/2048.vim {{{3 "
nnoremap <Leader>yy :<C-u>NewGame2048<CR>
" 3}}} AshyIsMe/2048.vim "
" rbtnn/mario.vim {{{3 "
nnoremap <Leader>ym :<C-u>Mario<CR>
" 3}}} rbtnn/mario.vim "
" rbtnn/puyo.vim {{{3 "
nnoremap <Leader>yp :<C-u>Puyo<CR>
" 3}}} rbtnn/puyo.vim "
" vim/killersheep {{{3 "
nnoremap <Leader>yk :<C-u>KillKillKill<CR>
" 3}}} vim/killersheep "
" 2}}} Game "
" 1}}} SpecialFunction "

