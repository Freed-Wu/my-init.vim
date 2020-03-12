" Plugin {{{1 "
"  {{{2 "
"  {{{3 "
"  vim: fdm=marker
scriptencoding utf-8
let $MYVIMRC = expand('<sfile>:p')
let $USER = 'Freed-Wu'
let g:mapleader = ' '
let g:maplocalleader = ';'
cd $VIMWORKSPACE
set runtimepath+=$VIMCONFIG
" 3}}}  "
" 2}}}  "

" PluginManage {{{2 "
" Shougo/dein.vim {{{3 "
if !isdirectory($GITHUBWORKSPACE.'/Shougo')
	if !executable('git')
		echohl WarningMsg
		echom "No git, please install git first!"
		echohl None
		finish
	elseif !executable('robocopy') && has('win32')
		echohl WarningMsg
		echom "No robocopy, please add robocopy to your $PATH!"
		echohl None
		finish
	endif
	call mkdir($GITHUBWORKSPACE . '/Shougo', 'p')
	cd $GITHUBWORKSPACE/Shougo
	!git clone git@github.com:Shougo/dein.vim.git
endif
if executable('Snarl_CMD') && executable('Snarl')
	let g:dein#enable_notification = 1
endif
if has('nvim')
	let g:dein#install_progress_type = 'title'
endif
let s:dein_vim_data = $VIMDATA.'/.dein.vim'
if !isdirectory(s:dein_vim_data)
	call mkdir(s:dein_vim_data, 'p')
endif
let g:dein_vim#install_log_filename = s:dein_vim_data . '/dein.log'
"let g:dein#auto_recache = 1
set runtimepath+=$GITHUBWORKSPACE/Shougo/dein.vim
if dein#load_state($GITWORKSPACE) && !v:vim_did_enter
	call dein#begin($GITWORKSPACE)

	" Plugin {{{4 "
	" PluginManage {{{5 "
	call dein#add('Shougo/dein.vim')
	call dein#add('haya14busa/dein-command.vim', {
				\ 'on_cmd': 'Dein',
				\ })
	call dein#add('wsdjeg/dein-ui.vim', {
				\ 'on_cmd': ['DeinUpdate', 'SPreinstall'],
				\ })
	" 5}}} PluginManage "
	" PluginDetect {{{5 "
	call dein#add('tweekmonster/startuptime.vim', {
				\ 'on_cmd': 'StartupTime',
				\ })
	call dein#add('tpope/vim-scriptease', {
				\ 'on_cmd': ['PP', 'PPmsg', 'Runtime', 'Time', 'Verbose', 'Vedit', 'Vopen', 'Vread', 'Vsplit', 'Vvsplit', 'Vtabedit', 'Vpedit', 'Messages', 'Scriptnames', 'Breakadd', 'Breakdel', 'Disarm'],
				\ 'on_map': ['<Plug>ScripteaseHelp','<Plug>ScripteaseFilter', '<Plug>ScripteaseSynnames']
				\ })
	" 5}}} PluginDetect "
	" 4}}} Plugin "

	" Default {{{4 "
	"  {{{5 "
	call dein#add('tpope/vim-sensible')
	" 5}}}  "

	" Encoding {{{5 "
	call dein#add('vimchina/vim-fencview', {
				\ 'if': has('iconv'),
				\ 'on_if': executable('tellenc'),
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
	call dein#add('liuchengxu/vim-which-key')
				"\ 'on_cmd': ['WhichKey', 'WhichKeyVisual'],
				"\ 'on_func': 'which_key#register',
	call dein#add('tpope/vim-unimpaired', {
				\ 'on_map': {'n': ['<Plug>', 'yo', '[o', ']o']},
				\ })
	call dein#add('tpope/vim-capslock', {
				\ 'hook_post_source': join([
				\ 'iunmap <C-l>',
				\ 'iunmap <C-g>c',
				\ 'nunmap gC',
				\ ], "\n"),
				\ })
	call dein#add('tpope/vim-rsi', {
				\ 'on_if': !exists('g:rsi_no_meta'),
				\ 'hook_post_source': join([
				\ 'inoremap ð <C-o>(',
				\ 'inoremap î <C-o>)',
				\ 'inoremap <C-f> <Right>',
				\ 'cnoremap <C-y> <C-r>+',
				\ ], "\n"),
				\ })
	call dein#add('Raimondi/vim-transpose-words', {
				\ 'on_map': '<Plug>TransposeWords',
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
				\ 'on_func': ['Marvim_macro_store', 'Marvim_template_store', 'Marvim_search'],
				\ })
	call dein#add('dohsimpson/vim-macroeditor', {
				\ 'on_cmd': 'MacroEdit',
				\ })
	call dein#add('mattn/redir-vim')
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
				\ 'if': !has("gui_running"),
				\ })
	" 5}}} Colorscheme "

	" Highlight {{{5 "
	call dein#add('luochen1990/rainbow')
	call dein#add('vheon/vim-cursormode', {
				\ })
				"\ 'on_if': !has('gui_running'),
	call dein#add('ap/vim-css-color')
	call dein#add('jaxbot/semantic-highlight.vim', {
				\ 'on_cmd': ['SemanticHighlight', 'SemanticHighlightRevert', 'SemanticHighlightToggle'],
				\ })
	call dein#add('nathanaelkane/vim-indent-guides', {
				\ 'on_cmd': ['IndentGuidesToggle', 'IndentGuidesEnable', 'IndentGuidesDisable'],
				\ 'on_if': !&expandtab
				\ })
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
	call dein#add('Yggdroot/indentLine', {
				\ 'on_cmd': ['IndentLinesReset', 'IndentLinesToggle', 'IndentLinesEnable', 'IndentLinesDisable', 'LeadingSpaceEnable', 'LeadingSpaceDisable', 'LeadingSpaceToggle'],
				\ 'on_if': &expandtab
				\ })
	call dein#add('KeitaNakamura/tex-conceal.vim', {
				\ 'on_ft': ['tex', 'plaintex', 'markdown', 'pandoc'],
				\ })
	" 5}}} Conceal "

	" StatusBar {{{5 "
	call dein#add('bling/vim-airline', {
				\ 'if': &encoding == 'utf-8',
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
	call dein#add('lambdalisue/vim-fullscreen', {
				\ 'on_cmd': ['FullscreenToggle', 'FullscreenStart', 'FullscreenStop'],
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
	call dein#add('calon/txt', {
				\ 'build': 'dos2unix syntax/txt.vim',
				\ })
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
	call dein#add('masukomi/vim-markdown-folding')
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

	" FileEdit {{{5 "
	call dein#add('airblade/vim-rooter')
	call dein#add('mhinz/vim-hugefile')
	call dein#add('derekwyatt/vim-fswitch', {
				\ 'on_cmd': ['FSHere', 'FSLeft', 'FSSplitLeft', 'FSRight', 'FSSplitRight', 'FSBelow', 'FSSplitBelow', 'FSAbove', 'FSSplitAbove'],
				\ })
	call dein#add('danro/rename.vim', {
				\ 'on_cmd': 'Rename',
				\ })
	call dein#add('pbrisbin/vim-mkdir')
	call dein#add('907th/vim-auto-save', {
				\ 'on_cmd': 'AutoSaveToggle',
				\ })
	" 5}}} FileEdit "

	" BufferExplore {{{5 "
	call dein#add('jlanzarotta/bufexplorer', {
				\ 'on_cmd': ['BufExplorer', 'ToggleBufExplorer', 'BufExplorerHorizontalSplit', 'BufExplorerVerticalSplit'],
				\ })
	" 5}}} BufferExplore "

	" Compress {{{5 "
	call dein#add('lbrayner/vim-rzip', {
				\ 'on_ft': 'tar',
				\ })
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
	call dein#add('liuchengxu/vista.vim', {
				\ 'on_source': 'vim-defx-vista',
				\ 'on_cmd': 'Vista',
				\ })
	call dein#add('dirn/TODO.vim', {
				\ 'on_cmd': 'TODO',
				\ })
	" 5}}} TagExplore "

	" FuzzyFind {{{5 "
	call dein#add('Yggdroot/LeaderF', {
				\ 'if': has('python3'),
				\ 'on_event': ['BufRead', 'BufNewFile'],
				\ })
				"\ 'on_cmd': ['LeaderfSelf', 'LeaderfFile', 'LeaderfFileFullScreen', 'LeaderfBuffer', 'LeaderfBufferAll', 'LeaderfTabBuffer', 'LeaderfTabBufferAll', 'LeaderfMru', 'LeaderfMruCwd', 'LeaderfTag', 'LeaderfBufTag', 'LeaderfBufTagAll', 'LeaderfFunction', 'LeaderfFunctionAll', 'LeaderfLine', 'LeaderfLineAll', 'LeaderfHistoryCmd', 'LeaderfHistorySearch', 'LeaderfHelp', 'LeaderfColorscheme'],
	" 5}}} FuzzyFind "

	" MarkExplore {{{5 "
	call dein#add('kshenoy/vim-signature')
	call dein#add('vim-scripts/Marks-Browser', {
				\ 'on_cmd': 'MarksBrowser',
				\ })
	" 5}}} MarkExplore "

	" Move {{{5 "
	call dein#add('easymotion/vim-easymotion', {
				\ 'on_map': '<Plug>',
				\ 'on_source': 'incsearch-easymotion.vim',
				\ 'hook_post_source': join([
				\ 'nunmap <Leader><Leader>',
				\ ], "\n"),
				\ })
	call dein#add('psliwka/vim-smoothie', {
				\ 'on_func': ['smoothie#upwards', 'smoothie#downwards', 'smoothie#forwards', 'smoothie#backwards'],
				\ })
	call dein#add('reedes/vim-wheel', {
				\ 'on_map': '<Plug>(Wheel',
				\ })
	call dein#add('andymass/vim-matchup', {
				\ 'on_map': '<Plug>',
				\ 'on_func': ['matchup#motion#insert_mode', 'matchup#motion#find_matching_pair', 'matchup#motion#op', 'matchup#motion#jump_inside'],
				\ })
	call dein#add('takac/vim-hardtime', {
				\ 'on_cmd': ['HardTimeOff', 'HardTimeOn', 'HardTimeToggle'],
				\ })
	call dein#add('wesQ3/vim-windowswap', {
				\ })
				"\ 'on_func': ['WindowSwap#MarkWindowSwap', 'WindowSwap#DoWindowSwap', 'WindowSwap#EasyWindowSwap'],
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
	" 4}}} CursorMove "

	" CursorVisual {{{4 "
	" Select {{{5 "
	call dein#add('terryma/vim-expand-region', {
				\ 'on_map': '<Plug>',
				\ })
	call dein#add('mg979/vim-visual-multi', {
				\ 'on_map': ['<Plug>VM', '<Leader>m'],
				\ })
	" 5}}} Select "

	" TextObjChar {{{5 "
	call dein#add('wellle/targets.vim', {
				\ 'on_func': 'targes#e',
				\ })
	call dein#add('kana/vim-textobj-user')
	call dein#add('beloglazov/vim-textobj-punctuation', {
				\ 'on_map': {'o': '<Plug>', 'x': '<Plug>'},
				\ })
	call dein#add('thinca/vim-textobj-between', {
				\ 'on_map': {'o': '<Plug>', 'x': '<Plug>'},
				\ })
	call dein#add('kana/vim-textobj-jabraces', {
				\ 'on_map': {'o': '<Plug>', 'x': '<Plug>'},
				\ })
	call dein#add('reedes/vim-textobj-quote', {
				\ 'on_map': {'o': ['i', 'a'], 'x': ['i', 'a'], 'n': ['S', 's', 'ys', 'yS']},
				\ 'on_func': 'textobj#quote#init',
				\ 'hook_post_source': join([
				\ 'call textobj#quote#init({"educate": 0})',
				\ ], "\n"),
				\ })
	call dein#add('reedes/vim-textobj-sentence', {
				\ 'on_map': {'o': ['i', 'a'], 'x': ['i', 'a',], 'n': 'g'},
				\ 'on_func': 'textobj#sentence#init',
				\ 'hook_post_source': join([
				\ 'call textobj#sentence#init()',
				\ ], "\n"),
				\ })
	call dein#add('ctholho/vim-textobj-sentence-line', {
				\ 'on_map': {'n': '<Plug>(textobj-fsent', 'o': '<Plug>(textobj-fsent', 'x': '<Plug>(textobj-fsent'},
				\ })
	call dein#add('saihoooooooo/vim-textobj-space', {
				\ 'on_map': {'o': '<Plug>', 'x': '<Plug>'},
				\ })
	call dein#add('deathlyfrantic/vim-textobj-blanklines', {
				\ 'on_map': {'o': '<Plug>', 'x': '<Plug>'},
				\ })
	call dein#add('whatyouhide/vim-textobj-xmlattr', {
				\ 'on_map': {'n': '<Plug>', 'o': '<Plug>', 'x': '<Plug>'},
				\ })
	" 5}}} TextObjChar "

	" TextObjSymbol {{{5 "
	call dein#add('kana/vim-textobj-entire', {
				\ 'on_map': {'o': '<Plug>', 'x': '<Plug>'},
				\ })
	call dein#add('kana/vim-textobj-indent', {
				\ 'on_map': {'o': '<Plug>', 'x': '<Plug>'},
				\ })
	call dein#add('glts/vim-textobj-indblock', {
				\ 'on_map': {'o': '<Plug>', 'x': '<Plug>'},
				\ })
	call dein#add('kana/vim-textobj-line', {
				\ 'on_map': {'o': '<Plug>', 'x': '<Plug>'},
				\ })
	call dein#add('rhysd/vim-textobj-continuous-line', {
				\ 'on_map': {'o': '<Plug>textobj-continuous', 'x': '<Plug>textobj-continuous'},
				\ })
	call dein#add('coderifous/textobj-word-column.vim', {
				\ 'on_func': 'TextObjWordBasedColumn',
				\ })
	call dein#add('saaguero/vim-textobj-pastedtext', {
				\ 'on_map': {'o': '<Plug>(textobj-pastedtext-text)', 'x': '<Plug>(textobj-pastedtext-text)'},
				\ })
	" 5}}} TextObjSymbol "

	" TextObjSyntax {{{5 "
	call dein#add('somini/vim-textobj-fold', {
				\ 'on_map': {'o': '<Plug>', 'x': '<Plug>'},
				\ })
	call dein#add('kana/vim-textobj-syntax', {
				\ 'on_map': {'o': '<Plug>', 'x': '<Plug>'},
				\ })
	call dein#add('glts/vim-textobj-comment', {
				\ 'on_map': {'o': '<Plug>', 'x': '<Plug>'},
				\ })
	" 5}}} TextObjSyntax "

	" TextObjContent {{{5 "
	call dein#add('Julian/vim-textobj-variable-segment', {
				\ 'on_map': {'o': '<Plug>(textobj-variable', 'x': '<Plug>(textobj-variable'},
				\ })
	call dein#add('Chun-Yang/vim-textobj-chunk', {
				\ 'on_map': {'o': '<Plug>', 'x': '<Plug>'},
				\ })
	call dein#add('rsrchboy/vim-textobj-heredocs', {
				\ 'on_map': {'o': '<Plug>', 'x': '<Plug>'},
				\ })
	call dein#add('vimtaku/vim-textobj-keyvalue', {
				\ 'on_map': {'o': ['<Plug>textobj-key', 'textobj-value'], 'x': ['<Plug>textobj-key', 'textobj-value']},
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
				\ 'on_map': {'o': '<Plug>', 'x': '<Plug>'},
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
				\ 'on_ft': 'haskell',
				\ 'on_map': '<Plug>',
				\ 'if': has('python'),
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
	call dein#add('vim-scripts/YankRing.vim')
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
				\ 'on_ft': 'org',
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
	call dein#add('editorconfig/editorconfig-vim', {
				\ 'on_cmd': 'EditorConfigReload',
				\ })
	call dein#add('Freed-Wu/masmIndent.vim')
	" 5}}} Format "

	" Comment {{{5 "
	call dein#add('scrooloose/nerdcommenter', {
				\ 'on_map': '<Plug>NERDCommenter',
				\ })
	call dein#add('tpope/vim-commentary', {
				\ 'on_map': '<Plug>Commentary',
				\ })
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
				\ 'on_ft': ['coq', 'elm', 'haskell', 'python', 'rust', 'vim'],
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
				\ })
				"\ 'on_cmd': ['UnicodeName', 'UnicodeSearch', 'UnicodeTable', 'DownloadUnicode', 'UnicodeCache', 'Digraphs'],
				"\ 'on_map': ['<C-X><C-G>', '<C-X><C-Z>', '<F4>'],
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
	call dein#add('w0rp/ale', {
				\ })
				"\ 'on_ft': split(substitute(glob($GITHUBWORKSPACE .'/w0rp/ale/ale_linters/*'), substitute($GITHUBWORKSPACE .'/w0rp/ale/ale_linters/', '\\', '\\\\', 'g'), ' ', 'g')),
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
	call dein#add('lervag/vimtex', {
				\ })
				"\ 'on_ft': ['tex', 'bibtex'],
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
				"\ 'on_map': '<Plug>Vimwiki',
	call dein#add('freitass/todo.txt-vim')
	call dein#add('greyblake/vim-preview', {
				\ 'if': has('ruby') && has('--enable-rubyinterp'),
				\ 'on_cmd': ['Preview', 'PreviewMarkdown', 'PreviewTextile', 'PreviewRdoc', 'PreviewHtml', 'PreviewRonn', 'PreviewRst'],
				\ 'on_ft': ['markdown', 'pandoc', 'gfimarkdown', 'rst', 'rdoc', 'textile', 'html'],
				\ })
	call dein#add('szymonmaszke/vimpyter', {
				\ 'if': executable('notedown'),
				\ 'on_ft': 'ipynb',
				\ })
	call dein#add('jceb/vim-orgmode')
	call dein#add('liuchengxu/graphviz.vim')
	" 5}}} MarkUp "

	" Office {{{5 "
	call dein#add('chrisbra/csv.vim', {
				\ })
				"\ 'on_ft': 'csv',
	call dein#add('mattn/excelview-vim', {
				\ 'on_cmd': 'ExcelView',
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
	call dein#add('daeyun/vim-matlab', {
				\ 'if': !has('win32'),
				\ 'on_ft': ['matlab', 'octave'],
				\ })
	call dein#add('JeroenMulkers/matvim', {
				\ 'if': has('python'),
				\ 'on_ft': ['matlab', 'octave'],
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
				\ 'build': 'pip3 install -r .ci/requirements.txt',
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
	call dein#add('voldikss/vim-browser-search', {
				\ 'on_map': ['<Plug>SearchNormal', '<Plug>SearchVisual'],
				\ 'on_cmd': ['Search', 'SearchCurrentText', 'SearchVisualText'],
				\ })
	call dein#add('vim-scripts/utl.vim', {
				\ 'on_cmd': 'Utl',
				\ })
	call dein#add('ianding1/leetcode.vim', {
				\ 'on_cmd': ['LeetCodeList', 'LeetCodeTest', 'LeetCodeSubmit', 'LeetCodeSignIn', 'LeetCodeReset'],
				\ })
	call dein#add('kpron/vim-dpaste', {
				\ 'on_cmd': 'Dpaste',
				\ })
	" 5}}} Tool "

	" Social {{{5 "
	call dein#add('vim-scripts/vimmailr.zip', {
				\ 'if': has('win32'),
				\ 'on_func': ['VimMailrSend', 'VimMailrMakeHeader', 'VimMailrQuickMessage', 'VimMailrMailFile'],
				\ 'hook_post_source': join([
				\ 'unmap _vms',
				\ 'unmap _vmh',
				\ 'unmap _vmm',
				\ 'unmap _vmf',
				\ ], "\n"),
				\ })
	call dein#add('twitvim/twitvim', {
				\ 'if': has('python') || has('perl') || has('ruby') || has('tcl') || executable('openssl'),
				\ 'on_cmd': ['FriendsTwitter', 'MentionsTwitter', 'DMTwitter', 'ListTwitter', 'ProfileTwitter', 'FollowingTwitter', 'FollowersTwitter', 'FollowersTwitter', 'OwnedListsTwitter', 'PosttoTwitter', 'CPosttoTwitter', 'BPosttoTwitter', 'SendDMTwitter', 'UserTwitter', 'RepliesTwitter', 'DMSentTwitter', 'RetweetedToMeTwitter', 'RetweetedByMeTwitter', 'FavTwitter', 'FollowingTwitter', 'FollowersTwitter', 'ListInfoTwitter', 'MembersOfListTwitter', 'SubsOfListTwitter', 'MemberListsTwitter', 'FollowListTwitter', 'UnfollowListTwitter', 'BackTwitter', 'BackInfoTwitter', 'ForwardTwitter', 'ForwardInfoTwitter', 'RefreshTwitter', 'RefreshInfoTwitter', 'NextTwitter', 'NextInfoTwitter', 'PreviousTwitter', 'PreviousInfoTwitter', 'SetLoginTwitter', 'SwitchLoginTwitter', 'DeleteLoginTwitter', 'ResetLoginTwitter', 'FollowTwitter', 'UnfollowTwitter', 'BlockTwitter', 'UnblockTwitter', 'MuteTwitter', 'UnmuteTwitter', 'ReportSpamTwitter', 'EnableRetweetsTwitter', 'DisableRetweetsTwitter', 'AddToListTwitter', 'RemoveFromListTwitter'],
				\ })
	call dein#add('PotHix/Vimpress', {
				\ 'if': has('python'),
				\ 'on_cmd': ['BlogList', 'BlogNew', 'BlogOpen', 'BlogSend', 'BlogDefault', 'BlogPreviewUrl'],
				\ })
	call dein#add('qianlifeng/vbo', {
				\ 'if': has('python'),
				\ 'on_cmd': 'WB',
				\ })
	call dein#add('vim-scripts/weibo.vim', {
				\ 'if': has('python'),
				\ 'on_cmd': 'AddT',
				\ 'hook_post_source': join([
				\ 'unmap ,at',
				\ ], "\n"),
				\ })
	" 5}}} Social "

	" Cypher {{{5 "
	call dein#add('retorillo/md5.vim', {
				\ 'on_cmd': ['MD5File', 'MD5Line', 'MD5String', 'MD5Test'],
				\ })
	call dein#add('vim-scripts/sha1.vim', {
				\ 'on_func': 'sha1#sha1',
				\ })
	call dein#add('claperius/random-vim', {
				\ 'on_cmd': 'Random',
				\ })
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
if has('gui_running')
	call delete('/home/wzy/.vim/cache_gvim')
else
	call delete('/home/wzy/.vim/cache_vim')
endif
nnoremap <Leader>px :call delete($HOME.'/.vim/cache_gvim')<CR>:call delete($HOME.'/.vim/cache_vim')<CR>
" 3}}} Shougo/dein.vim "
" haya14busa/dein-command.vim {{{3 "
nnoremap <Leader>pc :<C-u>Dein clean<CR>
nnoremap <Leader>pr :<C-u>Dein recache_runtimepath<CR>
nnoremap <Leader>pi :<C-u>Dein install<CR>
nnoremap <Leader>pI :<C-u>Dein install<Space>
nnoremap <Leader>pu :<C-u>Dein update<CR>
nnoremap <Leader>pU :<C-u>Dein update<Space>
" 3}}} haya14busa/dein-command.vim "
" wsdjeg/dein-ui.vim {{{3 "
nnoremap <Leader>pd :DeinUpdate<CR>
nnoremap <Leader>pD :DeinUpdate<Space>
" 3}}} wsdjeg/dein-ui.vim "
" 2}}} PluginManage "

" PluginDetect {{{2 "
"  {{{3 "
nnoremap <Leader>lq :copen<CR>
nnoremap <Leader>ll :lopen<CR>
nnoremap <Leader>l0 :make\| copen<CR>
nnoremap <Leader>l1 :make clean\| copen<CR>
nnoremap <Leader>l2 :make cleanall\| copen<CR>
" 3}}}  "
" tweekmonster/startuptime.vim {{{3 "
nnoremap <Leader>pT :language message en.US<CR>:StartupTime<CR>
" 3}}} tweekmonster/startuptime.vim "
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
set makeencoding=char
set fileencodings+=cp936
" 3}}}  "
if has('iconv') && executable('tellenc')
	" vimchina/vim-fencview {{{3 "
	let g:fencview_autodetect = 1
	let g:fencview_auto_patterns='*.txt,*.md,*.org,*.htm{l\=}'
	nnoremap <Leader>jf :<C-u>FencView<CR>
	"let $FENCVIEW_TELLENC = 'tellenc'
endif
" 3}}} vimchina/vim-fencview "
" 2}}} Encoding "

" Help {{{2 "
" yianwillis/vimcdoc {{{3 "
if &helplang != 'cn'
	set helplang=cn
endif
" 3}}} yianwillis/vimcdoc "
" Shougo/echodoc.vim {{{3 "
"let g:echodoc#type = "echo" " Default value
" To use echodoc, you must increase 'cmdheight' value.
"set cmdheight=2 " 设置命令行的高度
set noshowmode
let g:echodoc_enable_at_startup = 1
" 3}}} Shougo/echodoc.vim "
" 2}}} Help "

" Log {{{2 "
" AD7six/vim-activity-log {{{3 "
let s:vim_activity_log_data = $VIMDATA.'/.vim-activity-log'
if !isdirectory(s:vim_activity_log_data)
	call mkdir(s:vim_activity_log_data, 'p')
endif
let g:activity_log_location = s:vim_activity_log_data.expand('/%Y/%m/%d.log')
" 3}}} AD7six/vim-activity-log "
" 2}}} Log "

" Language {{{2 "
if has('python3')
	" voldikss/vim-translator {{{3 "
	let g:translator_default_mapping = 0
	let g:translator_default_to_lang = &helplang
	let g:translator_default_engines = ['bing', 'google', 'youdao', 'ciba']
	let g:translator_enable_history = 1
	let g:translator_max_history_count = 500
	let s:vim_translator_data = $VIMDATA.'/.vim-translator'
	if !isdirectory(s:vim_translator_data)
		call mkdir(s:vim_translator_data, 'p')
	endif
	let g:translator_history_dir = s:vim_translator_data.'/data'
	" <Leader>t 翻译光标下的文本，在命令行回显
	nmap <Leader>tt <Plug>Translate
	xmap <Leader>tt <Plug>TranslateV
	nnoremap <Leader>tT :Translate -w<Space>
	" <Leader>w 翻译光标下的文本，在窗口中显示
	nmap <Leader>tw <Plug>TranslateW
	xmap <Leader>tw <Plug>TranslateWV
	nnoremap <Leader>tW :TranslateW -w<Space>
	" <Leader>r 替换光标下的文本为翻译内容
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
"nnoremap <expr> j line('.') == line('$') ? 'gg' : 'j'
"nnoremap <expr> k line('.') == 1 ? 'G' : 'k'
nnoremap gO i<Esc>:<C-u>%s/\v\n{3,}/\r\r/ge<CR>`^zv{O<Esc>:let @/ = ''<CR>o
nnoremap go i<Esc>:<C-u>%s/\v\n{3,}/\r\r/ge<CR>`^zv}O<Esc>:let @/ = ''<CR>o
nnoremap S dhi
nnoremap , "ayl:execute @a =~ '\a'?'normal! ~':'let @+ = @a'<CR>
xnoremap , ~
xnoremap p pgvy
xnoremap <C-t> <Esc>`.``gvp``:execute 'normal! '.((&virtualedit =~ 'onemore' && col('.') == col('$') - 1)?'p':'P')<CR>
nnoremap gK :<C-u>help<Space>
cnoremap <M-q> <C-u>visual<CR>
nnoremap g. :<C-u>execute v:count?v:count.'go':''<CR><C-g>
xnoremap g. go
nnoremap g> g<C-g>
xnoremap g> g<C-g>
nnoremap g: :<C-u>pwd<CR>
nnoremap g{ :left<CR>
nnoremap gM :center<CR>
nnoremap g} :right<CR>
xnoremap g{ :left<CR>
xnoremap gM :center<CR>
xnoremap g} :right<CR>
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
nnoremap gH ^
xnoremap gH ^
onoremap gH ^
nnoremap gL $
xnoremap gL $h
onoremap gL $
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
"nnoremap zj zj
"nnoremap zk zk
nnoremap zJ zjzx
nnoremap zK zkzx
"xnoremap zj zj
"xnoremap zk zk
xnoremap zJ zjzx
xnoremap zK zkzx
"onoremap zj zj
"onoremap zk zk
onoremap zJ zjzx
onoremap zK zkzx
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
nnoremap gz :tabfirst<CR>
nnoremap gZ :tablast<CR>
xnoremap gz y:tabfirst<CR>p
xnoremap gZ y:tablast<CR>p
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
nnoremap <C-q> :xit<CR>
nnoremap <M-q> :quit!<CR>
nnoremap <C-s> :write<CR>
nnoremap <M-s> :saveas<Space>
xnoremap <C-q> :xit<CR>
xnoremap <M-q> :quit!<CR>
xnoremap <C-s> :<C-u>write<CR>
xnoremap <M-s> :<C-u>saveas<Space>
nnoremap <C-w>c <C-w>c
nnoremap <C-w>o <C-w>o
nnoremap <C-w>q <C-w>q
xnoremap <C-w>c <C-w>c
xnoremap <C-w>o <C-w>o
xnoremap <C-w>q <C-w>q
nnoremap <C-w>u :hide<CR>
xnoremap <C-w>u :<C-u>hide<CR>
nnoremap <C-w>a :qall<CR>
xnoremap <C-w>a :<C-u>qall<CR>
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
"nnoremap zo zo
"nnoremap zc zc
"nnoremap za za
"nnoremap zO zO
"nnoremap zC zC
"nnoremap zA zA
"nnoremap zm zxzm
"nnoremap zM zxzM
"nnoremap zr zxzr
"nnoremap zR zxzR
"nnoremap zX zxzX
"nnoremap zx zxzx
"nnoremap zv zxzv
nnoremap zV zxzMzvzc
"xnoremap zo zo
"xnoremap zc zc
"xnoremap za za
"xnoremap zO zO
"xnoremap zC zC
"xnoremap zA zA
"xnoremap zm zxzm
"xnoremap zM zxzM
"xnoremap zr zxzr
"xnoremap zR zxzR
"xnoremap zX zxzX
"xnoremap zx zxzx
"xnoremap zv zxzv
xnoremap zV zxzMzvzc
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
nnoremap gA g8
nnoremap gB 8g8
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
nnoremap <Leader>k0 :set keymap=<CR>
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
nnoremap <Leader>vX :<C-u>X<CR>
nnoremap <Leader>vR :<C-u>recover<CR>
nnoremap <Leader>vc :<C-u>execute 'cd '.expand('<cfile>')<CR>
xnoremap <Leader>vc y:cd p<CR>
nnoremap <Leader>vC :<C-u>cd<Space>
nnoremap <Leader>vx :<C-u>execute ''<Left>
nnoremap <Leader>v<Bar> :vertical<Space>
nnoremap <Leader>v<Tab> :tab<Space>
nnoremap <Leader>vo :<C-u>options<CR>
nnoremap <Leader>vp :hardcopy<CR>
xnoremap <Leader>vp :hardcopy<CR>
nnoremap <Leader>vF :split makefile<CR>
nnoremap <Leader>vM :<C-u>setlocal makeprg&<CR>
nnoremap <Leader>vv :<C-u>execute 'split $VIMCONFIG/ftplugin/'.split(&filetype, '\.')[0].'.vim'<CR>
nnoremap <Leader>vV :<C-u>execute 'split $VIMCONFIG/ftplugin/'.split(&filetype, '\.')[1].'.vim'<CR>
nnoremap <Leader>vs :<C-u>execute 'split '.$GITHUBWORKSPACE.'/syntax/'.&filetype.'.vim'<CR>
nnoremap <Leader>vS :<C-u>execute 'split $VIMRUNTIME/syntax/'.&filetype.'.vim'<CR>
nnoremap <Leader>vi :<C-u>execute 'split '.$GITHUBWORKSPACE.'/indent/'.&filetype.'.vim'<CR>
nnoremap <Leader>vI :<C-u>execute 'split $VIMRUNTIME/indent/'.&filetype.'.vim'<CR>
nnoremap <Leader>vt :<C-u>set<Space>
xnoremap <Leader>vt y:set <C-r>0<CR>
nnoremap <Leader>ve :<C-u>echo<Space>
xnoremap <Leader>ve y:echo <C-r>0<CR>
nnoremap <Leader>vE :<C-u>echom<Space>
xnoremap <Leader>vE y:echom <C-r>0<CR>
nnoremap <Leader>vf :<C-u>set filetype=
xnoremap <Leader>vf y:set filetype=<C-r>0<CR>
nnoremap <Leader>vg :<C-u>execute 'vim //gj '.expand('<cfile>')<CR><S-Left>
xnoremap <Leader>vg y:execute 'vim //gj '.@0<CR><S-Left>
nnoremap <Leader>vd :<C-u>diffsplit<Space>
xnoremap <Leader>vd y:diffsplit <C-r>0<CR>
nnoremap <Leader>vD :<C-u>vertical diffsplit<Space>
xnoremap <Leader>vD y:vertical diffsplit <C-r>0<CR>
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
xnoremap <Leader>rz :<C-u>call init#substitute#main('''<, ''>', [g:zhdict], 'ce')<CR>
xnoremap <Leader>re :<C-u>call init#substitute#main('''<, ''>', [g:endict], 'ce')<CR>
xnoremap <Leader>rt :<C-u>call init#substitute#main('''<, ''>', g:texdicts, 'ce')<CR>
xnoremap <Leader>rl :<C-u>call init#substitute#main('''<, ''>', [g:listdict], 'ce')<CR>
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
nnoremap <Leader>hs :<C-u>shell<CR>
nnoremap <Leader>hv :<C-u>silent !gvim<CR>
nnoremap <Leader>hV :<C-u>silent !gvim -u $VIMCONFIG/test.vim<CR>
nnoremap <Leader>hz :<C-u>silent !7z a ../%:h.7z %:p:h<CR>
nnoremap <Leader>hZ :<C-u>silent !7z a %<.7z %<CR>
nnoremap <Leader>hO :<C-u>silent !octave-gui<CR>
nnoremap <Leader>hm :<C-u>silent !matlab -nodesktop -nosplash<CR>
nnoremap <Leader>hM :<C-u>silent !matlab -nosplash<CR>
if has('win32')
	nnoremap <Leader>hk :<C-u>silent !mklink %.lnk %:p\| move %.lnk VIMWORKSPACE<CR>
	nnoremap <Leader>hK :<C-u>silent !mklink %:h.lnk %:p:h\| move %.lnk $VIMWORKSPACE<CR>
	nnoremap <Leader>he :<C-u>execute 'silent !start '.getcwd()<CR>
	nnoremap <Leader>hE :<C-u>silent !start %:p:h<CR>
elseif has('unix')
	nnoremap <Leader>hk :<C-u>!ln -s %:p $VIMWORKSPACE/%:t<CR>
	nnoremap <Leader>hK :<C-u>!ln -s %:p:h $VIMWORKSPACE/%:t<CR>
	nnoremap <Leader>he :<C-u>execute 'silent !xdg-open'.substitute(expand('%:p:h'), ' ', '\\ ', 'g')<CR>
	nnoremap <Leader>hE :<C-u>execute 'silent !xdg-open '.substitute(getcwd(), ' ', '\\ ', 'g')<CR>
elseif has('mac')
	nnoremap <Leader>he :<C-u>execute 'silent !open'.substitute(expand('%:p:h'), ' ', '\\ ', 'g')<CR>
	nnoremap <Leader>hE :<C-u>execute 'silent !open '.substitute(getcwd(), ' ', '\\ ', 'g')<CR>
endif
" 4}}} shell "
" 3}}}  "
" liuchengxu/vim-which-key {{{3 "
if has('nvim')
	let g:which_key_use_floating_win = 1
endif
let g:which_key_display_names = {' ': '█', '<CR>': '↵', '<TAB>': '⇆'}
"let g:which_key_vertical = 1
"let g:which_key_position = 'botright'
"let g:which_key_hspace = 5
" <Leader> {{{ "
nnoremap <nowait> <Leader> :<C-u>WhichKey '<Leader>'<CR>
xnoremap <nowait> <Leader> :<C-u>WhichKeyVisual '<Leader>'<CR>
let g:which_key_map_leader = {
			\ 'name': "choose a key about global map",
			\ ' ':{
			\ 'name': '+motion',
			\ },
			\ 'a':{
			\ 'name': '+social',
			\ },
			\ 'b':{
			\ 'name': '+options',
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
			\ 'name': '+guioption',
			\ },
			\ 'p':{
			\ 'name': "+plugin",
			\ },
			\ 'q':{
			\ 'name': '+crypt',
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
			\ 'name': "+vim-translate-me",
			\ },
			\ 'u':{
			\ 'name': "+vim-search-me",
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
			\ }
call which_key#register('<Space>', "g:which_key_map_leader")
" }}} <Leader> "
" <LocalLeader> {{{ "
nnoremap <nowait> <LocalLeader> :<C-u>WhichKey '<LocalLeader>'<CR>
xnoremap <nowait> <LocalLeader> :<C-u>WhichKeyVisual '<LocalLeader>'<CR>
augroup init_text "{{{
	autocmd!
	autocmd FileType * call which_key#register(g:maplocalleader, (exists('b:which_key_map_localleader')?'b':'g').':which_key_map_localleader')
	autocmd VimEnter * autocmd BufRead,BufNewFile,BufEnter * execute &filetype == ''?'setfiletype text':''
augroup END "}}}
let g:which_key_map_localleader = {
			\ 'name': 'choose a key about local map',
			\ }
" }}} <LocalLeader> "
" z {{{ "
nnoremap <nowait> z :<C-u>WhichKey 'z'<CR>
xnoremap <nowait> z :<C-u>WhichKeyVisual 'z'<CR>
let g:which_key_map_z = {
			\ 'name': "choose a key about fold&wrap&spell",
			\ 'u':{
			\ 'name': '+spell',
			\ },
			\ }
call which_key#register('z', "g:which_key_map_z")
" }}} z "
" g {{{ "
nnoremap <nowait> g :<C-u>WhichKey 'g'<CR>
xnoremap <nowait> g :<C-u>WhichKeyVisual 'g'<CR>
let g:which_key_map_g = {
			\ 'name': "choose a key about go&get",
			\ }
call which_key#register('g', "g:which_key_map_g")
" }}} g "
" [ {{{ "
nnoremap <nowait> [ :<C-u>WhichKey '['<CR>
xnoremap <nowait> [ :<C-u>WhichKeyVisual '['<CR>
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
nnoremap <nowait> ] :<C-u>WhichKey ']'<CR>
xnoremap <nowait> ] :<C-u>WhichKeyVisual ']'<CR>
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
nnoremap <nowait> <C-w> :WhichKey '<lt>C-w>'<CR>
xnoremap <nowait> <C-w> :WhichKeyVisual '<lt>C-w>'<CR>
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
xnoremap <nowait> i :<C-u>WhichKeyVisual 'i'<CR>
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
xnoremap <nowait> a :<C-u>WhichKeyVisual 'a'<CR>
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
xnoremap <nowait> I :<C-u>WhichKeyVisual 'I'<CR>
let g:which_key_map_I = {
			\ 'name': "choose a key about Inner text object",
			\ }
call which_key#register('I', "g:which_key_map_I")
" }}} I "
" A {{{ "
xnoremap <nowait> A :<C-u>WhichKeyVisual 'A'<CR>
let g:which_key_map_A = {
			\ 'name': "choose a key about Around text object",
			\ }
call which_key#register('A', "g:which_key_map_A")
" }}} I "
" 3}}} liuchengxu/vim-which-key "
" tpope/vim-unimpaired {{{3 "
xmap [e <Plug>unimpairedMoveSelectionUp
xmap ]e <Plug>unimpairedMoveSelectionDown
nmap [e <Plug>unimpairedMoveUp
nmap ]e <Plug>unimpairedMoveDown
nmap [f <Plug>unimpairedDirectoryPrevious
nmap ]f <Plug>unimpairedDirectoryNext
nmap [<C-L> <Plug>unimpairedLPFile
nmap ]<C-L> <Plug>unimpairedLNFile
nmap [<C-Q> <Plug>unimpairedQPFile
nmap ]<C-Q> <Plug>unimpairedQNFile
nmap [<C-T> <Plug>unimpairedTPPrevious
nmap ]<C-T> <Plug>unimpairedTPNext
nmap [a <Plug>unimpairedAPrevious
nmap ]a <Plug>unimpairedANext
nmap [A <Plug>unimpairedAFirst
nmap ]A <Plug>unimpairedALast
nmap [b <Plug>unimpairedBPrevious
nmap ]b <Plug>unimpairedBNext
nmap [B <Plug>unimpairedBFirst
nmap ]B <Plug>unimpairedBLast
nmap [l <Plug>unimpairedLPrevious
nmap ]l <Plug>unimpairedLNext
nmap [L <Plug>unimpairedLFirst
nmap ]L <Plug>unimpairedLLast
nmap [q <Plug>unimpairedQPrevious
nmap ]q <Plug>unimpairedQNext
nmap [Q <Plug>unimpairedQFirst
nmap ]Q <Plug>unimpairedQLast
nmap [t <Plug>unimpairedTPrevious
nmap ]t <Plug>unimpairedTNext
nmap [T <Plug>unimpairedTFirst
nmap ]T <Plug>unimpairedTLast
nmap [n <Plug>unimpairedContextPrevious
nmap ]n <Plug>unimpairedContextNext
xmap [n <Plug>unimpairedContextPrevious
xmap ]n <Plug>unimpairedContextNext
omap [n <Plug>unimpairedContextPrevious
omap ]n <Plug>unimpairedContextNext
nmap [<Space> <Plug>unimpairedBlankUp
nmap ]<Space> <Plug>unimpairedBlankDown
nmap y<Space> <Plug>unimpairedBlankUp<Plug>unimpairedBlankDown
nmap [xx <Plug>unimpaired_line_xml_encode
nmap [x <Plug>unimpaired_xml_encode
omap [x <Plug>unimpaired_xml_encode
nmap ]xx <Plug>unimpaired_line_xml_decode
nmap ]x <Plug>unimpaired_xml_decode
omap ]x <Plug>unimpaired_xml_decode
nmap [uu <Plug>unimpaired_line_url_encode
nmap [u <Plug>unimpaired_url_encode
omap [u <Plug>unimpaired_url_encode
nmap ]uu <Plug>unimpaired_line_url_decode
nmap ]u <Plug>unimpaired_url_decode
omap ]u <Plug>unimpaired_url_decode
nmap [yy <Plug>unimpaired_line_string_encode
nmap [y <Plug>unimpaired_string_encode
omap [y <Plug>unimpaired_string_encode
nmap ]yy <Plug>unimpaired_line_string_decode
nmap ]y <Plug>unimpaired_string_decode
omap ]y <Plug>unimpaired_string_decode
" 3}}} tpope/vim-unimpaired "
" tpope/vim-capslock {{{3 "
imap <nowait> <C-\> <Plug>CapsLockToggle
nmap <nowait> <C-\> <Plug>CapsLockToggle
cmap <nowait> <C-\> <C-f><Plug>CapsLockToggle
" 3}}}  tpope/vim-capslock "
" tpope/vim-rsi {{{3 "
set winaltkeys=no
" pumvisible {{{4 "
inoremap <expr><C-q> pumvisible()?"\<C-y>": "\<C-q>"
inoremap <expr><M-q> pumvisible()?"\<C-e>": "\<M-q>"
inoremap <expr><C-p> pumvisible()?"\<C-p>": "\<Up>"
inoremap <expr><C-n> pumvisible()?"\<C-n>": "\<Down>"
inoremap <expr><C-v> pumvisible()?"\<PageDown>": "\<C-v>"
inoremap <expr><M-v> pumvisible()?"\<PageUp>": "\<M-v>"
" 4}}} pumvisible "
" <CR> {{{4 "
inoremap <S-CR> <C-o>O
inoremap <C-CR> <C-o>o
" 4}}} <CR> "
" vimL {{{4 "
inoremap <C-BS> <C-k>
inoremap <S-BS> <C-r>
inoremap <S-space> <C-v>
cnoremap <C-BS> <C-k>
cnoremap <S-BS> <C-r>
cnoremap <S-space> <C-v>
cnoremap <S-CR> <C-f>
cnoremap <C-TAB> <C-d>
" 4}}} vimL "
" readline {{{4 "
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
" 4}}} readline "
" 3}}} tpope/vim-rsi "
" Raimondi/vim-transpose-words {{{3 "
imap <M-t> <Esc><Plug>TransposeWordsi
" 3}}} Raimondi/vim-transpose-words "
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
let s:VimIM_config = $VIMCONFIG.'/.VimIM'
if !isdirectory(s:VimIM_config)
	call mkdir(s:VimIM_config, 'p')
endif
let g:Vimim_plugin = s:VimIM_config
let g:Vimim_shuangpin = 'ms'
let g:Vimim_toggle = 'pinyin'
nnoremap <Leader>zv :<C-u>ViMiM<CR>
nnoremap <C-g> i<C-R>=g:Vimim_chinese()<CR><Esc>
inoremap <C-g> <C-R>=g:Vimim_chinese()<CR>
cnoremap <C-g> <C-F>i<C-R>=g:Vimim_chinese()<CR>
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
let s:marvim_config = $VIMCONFIG.'/.marvim'
if !isdirectory(s:marvim_config)
	call mkdir(s:marvim_config, 'p')
endif
let g:marvim_store = s:marvim_config
let g:marvim_find_key = 'q'''
let g:marvim_store_key = 'q`'
let g:marvim_register = 'q'
execute 'nnoremap '.g:marvim_store_key.' :call Marvim_macro_store()<CR>'
execute 'vnoremap '.g:marvim_store_key.' y:call Marvim_template_store()<CR>'
execute 'nnoremap '.g:marvim_find_key.' :call Marvim_search()<CR>'
execute 'vnoremap '.g:marvim_find_key.' :norm@'.g:marvim_register.'<CR>'
" 3}}} vim-scripts/marvim "
" dohsimpson/vim-macroeditor {{{3 "
nnoremap q= :MacroEdit<Space>
" 3}}} dohsimpson/vim-macroeditor "
" mattn/redir-vim {{{3 "
nnoremap Q :call init#redir#main()<CR>
" 3}}} mattn/redir-vim "
" 2}}} MacroExplore "
" 1}}} Key "

" Appearance {{{1 "
" Colorscheme {{{2 "
"  {{{3 "
nnoremap <Leader>oi :source $VIMRUNTIME/syntax/hitest.vim<CR>
nnoremap <Leader>op :colorscheme\| AirlineTheme\| set guifont<CR>
augroup init_ColorScheme "{{{
	autocmd!
	autocmd ColorScheme * highlight Conceal guibg=NONE
augroup END "}}}
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
for s:indexColorscheme in range(min([len(g:available_colorschemes), 10]))
	let g:which_key_map_leader[s:indexColorscheme] = {'name': "+".g:available_colorschemes[s:indexColorscheme]}
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
set t_Co=256
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
augroup END "}}}
nnoremap <Leader>oO :Thematic<Space>
nnoremap <Leader>oo :ThematicRandom<CR>:AirlineTheme random<CR>
nnoremap <Leader>o` :ThematicRandom<CR>
nnoremap <Leader>`o :AirlineTheme random<CR>
nnoremap [h :ThematicPrevious<CR>
nnoremap ]h :ThematicNext<CR>
nnoremap [H :ThematicFirst<CR>
nnoremap ]H :ThematicFirst\| ThematicPrevious<CR>
" 3}}} reedes/vim-thematic "
" 2}}} Colorscheme "

" Highlight {{{2 "
" luochen1990/rainbow {{{3 "
let g:rainbow_active = 1
"0 if you want to enable it later via :RainbowToggle
nnoremap <Leader>br :RainbowToggle<CR>
" 3}}} luochen1990/rainbow "
if has('python') || has('python3')
	" jaxbot/semantic-highlight.vim {{{3 "
	nnoremap <Leader>bs :SemanticHighlightToggle<CR>
	let s:semantic_highlight_vim_data = $VIMDATA.'/.semantic-highlight.vim'
	if !isdirectory(s:semantic_highlight_vim_data)
		call mkdir(s:semantic_highlight_vim_data, 'p')
	endif
	let g:semanticPersistCacheLocation = s:semantic_highlight_vim_data . '/.semantic-highlight-cache'
	" 3}}} jaxbot/semantic-highlight.vim "
endif
" nathanaelkane/vim-indent-guides {{{3 "
let g:indent_guides_exclude_filetypes = ['calendar', 'help', 'duzzle', 'marksbuffer', 'startify', 'defx']
"let g:indent_guides_enable_on_vim_startup = 1
"let g:indent_guides_default_mapping = 0
"let g:indent_guides_guide_size = 1
"let g:indent_guides_auto_colors = 1
"hi IndentGuidesOdd  ctermbg=black
"hi IndentGuidesEven ctermbg=darkgrey
nmap <Leader>b<Tab> <Plug>IndentGuidesToggle
augroup init_indentguide "{{{
	autocmd!
	autocmd VimEnter * IndentGuidesEnable
augroup END "}}}
" 3}}} nathanaelkane/vim-indent-guides "
" dbmrq/vim-redacted {{{3 "
nmap <leader>dd <Plug>Redact
vmap <leader>dd <Plug>Redact
nnoremap <leader>dr :Redact!<CR>
nnoremap <leader>dw :RedactedW<CR>
" 3}}} dbmrq/vim-redacted "
" vim-utils/vim-troll-stopper {{{3 "
nnoremap <Leader>bT :<C-u>TrollStop<CR>
" 3}}} vim-utils/vim-troll-stopper "
" Soares/longline.vim {{{3 "
nmap [\ <Plug>longline#next
nmap ]\ <Plug>longline#prev
nmap <leader>b\ <Plug>longline#toggle
" 3}}} Soares/longline.vim "
" 2}}} Highlight "

" Conceal {{{2 "
" ryanoasis/vim-devicons {{{3 "
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols_ = {
			\ 'patch': '',
			\ 'tex': '',
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
			\ 'vcf': '',
			\ 'log': '',
			\ 'rpt': '',
			\ 'backup': '',
			\ 'bin': '',
			\ 'rst': '',
			\ 'm': '',
			\ 'matlab': '',
			\ 'oct': '',
			\ 'octaverc': '',
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
			\ 'bash_profile': '',
			\ 'profile': '',
			\ 'inputrc': '',
			\ 'bat': '',
			\ 'cfg': '',
			\ 'gitignore': '',
			\ 'github': '',
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
			\ 'apk': '',
			\ 'lib': '',
			\ 'dll': '',
			\ 'vb': '',
			\ 'f': '',
			\ 'pas': '',
			\ 'yml': '',
			\ 'yaml': '',
			\ 'toml': '',
			\ 'desktop': 'ﯶ',
			\ 'theme': 'ﯶ',
			\ 'list': 'ﯶ',
			\ 'directory': 'ﯶ',
			\ 'e': '易',
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
			\ 'editorconfig': '',
			\ }
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {
			\ 'todo.txt': '',
			\ 'dia.autosave': '',
			\ 'paf.exe': '',
			\ 'search-ms': '',
			\ 'ms14 (Security copy)': '',
			\ 'synctex(busy)': '',
			\ }
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = extend(
			\ g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols,
			\ g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols_
			\ )
" 3}}} ryanoasis/vim-devicons "
" Yggdroot/indentLine {{{3 "
let g:indentLine_fileTypeExclude = g:indent_guides_exclude_filetypes
let g:indentLine_bufTypeExclude = ['help', 'terminal', 'nofile']
"let g:indentLine_char = '┊' "设置对齐线的字符
let g:indentLine_char_list = ['|', '¦', '┆', '┊'] "设置对齐线的首字符
let g:indentLine_showFirstIndentLevel = 1 "显示对齐线首字符
"let g:indentLine_color_term = 239 "设置对齐线颜色
nnoremap <Leader>bi :IndentLinesToggle<cr>
nnoremap <Leader>bI :LeadingSpaceToggle<cr>
" 3}}} Yggdroot/indentLine "
" 2}}} Conceal "

" StatusBar {{{2 "
" bling/vim-airline {{{3 "
"set ambiwidth=single
"set laststatus=2 sensible
" 隐藏Tab栏
set showtabline=2
"set tabpagemax=15
let g:airline_powerline_fonts = 1
"let g:airline#extensions#disable_rtp_load = 1
" unicode symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = 'Ξ'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.crypt = ''
let g:airline_symbols.paste = ''
let g:airline_symbols.spell = ''
let g:airline_symbols.whitespace = '█'
let g:airline_symbols.notexists = 'Ø'
let &titlestring = '%<%F%=%P' . g:airline_symbols.linenr . '%l/%L' . g:airline_symbols.maxlinenr
nnoremap <Leader>ba :<C-u>AirlineToggle<CR>
nnoremap <Leader>bA :<C-u>AirlineExtensions<CR>
nmap g1 <Plug>AirlineSelectTab1
nmap g2 <Plug>AirlineSelectTab2
nmap g3 <Plug>AirlineSelectTab3
nmap g4 <Plug>AirlineSelectTab4
nmap g5 <Plug>AirlineSelectTab5
nmap g6 <Plug>AirlineSelectTab6
nmap g7 <Plug>AirlineSelectTab7
nmap g8 <Plug>AirlineSelectTab8
nmap g9 <Plug>AirlineSelectTab9
nmap gt <Plug>AirlineSelectPrevTab
nmap gT <Plug>AirlineSelectNextTab
nmap z1 <Plug>AirlineSelectTab1<C-^>:bdelete #<CR>
nmap z2 <Plug>AirlineSelectTab2<C-^>:bdelete #<CR>
nmap z3 <Plug>AirlineSelectTab3<C-^>:bdelete #<CR>
nmap z4 <Plug>AirlineSelectTab4<C-^>:bdelete #<CR>
nmap z5 <Plug>AirlineSelectTab5<C-^>:bdelete #<CR>
nmap z6 <Plug>AirlineSelectTab6<C-^>:bdelete #<CR>
nmap z7 <Plug>AirlineSelectTab7<C-^>:bdelete #<CR>
nmap z8 <Plug>AirlineSelectTab8<C-^>:bdelete #<CR>
nmap z9 <Plug>AirlineSelectTab9<C-^>:bdelete #<CR>
nmap z[ <Plug>AirlineSelectPrevTab<C-^>:bdelete #<CR>
nmap z] <Plug>AirlineSelectNextTab<C-^>:bdelete #<CR>
" ale {{{ "
let g:airline#extensions#ale#error_symbol = '✗:'
let g:airline#extensions#ale#warning_symbol = '⚡:'
let g:airline#extensions#ale#show_line_numbers = 1
let g:airline#extensions#ale#open_lnum_symbol = 'Ξ'
let g:airline#extensions#ale#close_lnum_symbol = ''
" }}} ale "
" quickfix {{{ "
let g:airline#extensions#quickfix#quickfix_text = 'Quickfix'
let g:airline#extensions#quickfix#location_text = 'Location'
" }}} quickfix "
" vimtex {{{ "
let g:airline#extensions#vimtex#left = ""
let g:airline#extensions#vimtex#right = ""
let g:airline#extensions#vimtex#main = ""
let g:airline#extensions#vimtex#sub_main = ""
let g:airline#extensions#vimtex#sub_local = ""
let g:airline#extensions#vimtex#compiled = "✔"
let g:airline#extensions#vimtex#continuous = ""
let g:airline#extensions#vimtex#viewer = ""
" }}} vimtex "
" tabline {{{ "
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#show_close_button = 1
let g:airline#extensions#tabline#close_symbol = '✗'
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
" 3}}} bling/vim-airline "
" Wildog/airline-weather.vim {{{3 "
let g:weather#unit = 'metric'
let s:airline_weather_vim_config = $VIMCONFIG.'/.airline-weather.vim'
if !isdirectory(s:airline_weather_vim_config)
	call mkdir(s:airline_weather_vim_config, 'p')
endif
let g:weather#appid = readfile(s:airline_weather_vim_config.'/APIID.txt')[0]
let g:weather#area = readfile(s:airline_weather_vim_config.'/city.txt')[0]
let s:airline_weather_vim_data = $VIMDATA.'/.airline-weather.vim'
if !isdirectory(s:airline_weather_vim_data)
	call mkdir(s:airline_weather_vim_data, 'p')
endif
let g:weather#cache_file = s:airline_weather_vim_data.'/weather.json'
" 3}}} Wildog/airline-weather.vim "
" Zuckonit/vim-airline-todo {{{3 "
let s:vim_airline_todo_data = $VIMDATA.'/.vim-airline-todo'
if !isdirectory(s:vim_airline_todo_data)
	call mkdir(s:vim_airline_todo_data, 'p')
endif
let g:todo#directory = s:vim_airline_todo_data
let g:todo#remind = ''
let g:todo#suffix = ''
" 3}}} Zuckonit/vim-airline-todo "
" 2}}} StatusBar "

" UI {{{2 "
"  {{{3 "
if !has('gui_running')
	set columns=168
	augroup init_curosr "{{{
		autocmd!
		autocmd InsertEnter * silent !gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape ibeam
		autocmd InsertLeave * silent !gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape block
	augroup END "}}}
else
	set columns=170
endif
if !v:vim_did_enter
	let g:columns = (&columns - 3) / 4
endif
let &columns = &columns / 2 + 1
set lines=99
set lazyredraw
set cursorcolumn
set cursorline
winpos 0 0
set number
set relativenumber
set listchars=tab:>-,extends:→,precedes:←,nbsp:+
"eol:$,trail:~
set fillchars=vert:\|,fold:.
set display=uhex
set mouse=a
"set ruler " 总是显示光标位置 sensible
set whichwrap+=<,>,h,l   " 设置光标键跨行
set virtualedit=block
",onemore   " 允许光标出现在最后一个字符的后面
" 使回格键（backspace）正常处理indent, eol, start等
"set backspace=2 sensitive
set scrolloff=3
set noscrollbind
set showcmd " select模式下显示选中的行数
if exists(':checkhealth')
	nnoremap <Leader>pH :checkhealth<CR>
endif
nnoremap yo0 :execute 'winpos '.(getwinposx() == 0?950:0).' 0'<CR>
nnoremap [o0 :winpos 0 0<CR>
nnoremap ]o0 :winpos 950 0<CR>
augroup init_vim "{{{
	autocmd!
	autocmd VimResized * wincmd =
	" 打开文件自动定位到最后编辑的位置
	autocmd BufRead * call init#locate()
	autocmd BufWrite * cclose
augroup END "}}}
function! init#locate() "{{{
	if line("'\"") > 1 && line("'\"") <= line("$")
		execute 'normal! g`"'
	endif
endfunction "}}}
" 3}}}  "
" junegunn/goyo.vim {{{3 "
let g:goyo_width = 75
let g:goyo_height = 40
let g:goyo_linenr = 0
nnoremap <Leader>bo :Goyo<CR>
" 3}}} junegunn/goyo.vim "
" junegunn/limelight.vim {{{3  "
" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240
" Color name (:help gui-colors) or RGB color
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'
" Default: 0.5
let g:limelight_default_coefficient = 0.7
" Number of preceding/following paragraphs to include (default: 0)
let g:limelight_paragraph_span = 1
" Beginning/end of paragraph
"   When there's no empty line between the paragraphs
"   and each paragraph starts with indentation
let g:limelight_bop = '^\s'
let g:limelight_eop = '\ze\n^\s'
" Highlighting priority (default: 10)
"   Set it to -1 not to overrule hlsearch
let g:limelight_priority = -1
augroup init_Goyo "{{{
	autocmd!
	autocmd! User GoyoEnter Limelight
	autocmd! User GoyoLeave Limelight!
augroup END "}}}
nnoremap <Leader>bl :Limelight!!<CR>
" 3}}} junegunn/limelight.vim "
" lambdalisue/vim-fullscreen {{{3 "
let g:fullscreen#enable_default_keymap = 0
nnoremap yog :<C-u>FullscreenToggle<CR>
nnoremap [og :<C-u>FullscreenStart<CR>
nnoremap ]og :<C-u>FullscreenStop<CR>
if exists('*rpcnotify')
	let g:fullscreen#stop_command = "call rpcnotify(0, 'Gui', 'WindowFullScreen', 0)"
	let g:fullscreen#start_command = "call rpcnotify(0, 'Gui', 'WindowFullscreen', 1)"
endif
augroup init_fullscreen "{{{
	autocmd!
	autocmd VimEnter * FullscreenToggle
augroup END "}}}
" 3}}} lambdalisue/vim-fullscreen "
" thinca/vim-splash {{{3 "
let g:vim_splash_config = $VIMCONFIG.'/vim-splash'
if !isdirectory(g:vim_splash_config)
	call mkdir(g:vim_splash_config, 'p')
endif
let g:splash#path = g:vim_splash_config.'/Yoda.txt'
nnoremap <Leader>s0 :<C-u>Splash $GITHUBWORKSPACE/thinca/vim-splash/sample/vimgirl.txt<CR>
nnoremap <Leader>s1 :<C-u>Splash $VIMCONFIG/vim-splash/Yoda.txt'<CR>
nnoremap <Leader>s2 :<C-u>Splash $VIMCONFIG/vim-splash/catgirl.txt'<CR>
nnoremap <Leader>s3 :<C-u>Splash $VIMCONFIG/vim-splash/live2D.txt'<CR>
nnoremap <Leader>sp :<C-u>Splash<CR>
" 3}}} thinca/vim-splash "
" mhinz/vim-startify {{{3 "
let s:vim_startify_data = $VIMDATA.'/.vim-startify'
if !isdirectory(s:vim_startify_data)
	call mkdir(s:vim_startify_data, 'p')
endif
let g:startify_session_dir = s:vim_startify_data
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
let g:startify_commands = [
			\ {'..': 'Defx -auto-cd -new ' . $VIMWORKSPACE},
			\ {'.,': 'Defx -auto-cd -new ' . $UDISK},
			\ {'.;': 'Defx -auto-cd -new ' . $HOME . '/.local/share/Trash/files'},
			\ {'.v': 'Defx -auto-cd -new ' . $VIMCONFIG},
			\ {'.V': 'Defx -auto-cd -new ' . $VIMRUNTIME},
			\ {'.r': 'Defx -auto-cd -new ' . expand('$GITHUBWORKSPACE/$USER')},
			\ {'.R': 'Defx -auto-cd -new ' . expand('$GITWORKSPACE/.cache/init.vim/.dein')},
			\ {'.t': 'Defx -auto-cd -new ' . $TEXWORKSPACE},
			\ {'.T': 'Defx -auto-cd -new ' . $TEXRUNTIME},
			\ {'.p': 'Defx -auto-cd -new ' . $HOME.'/.pandoc'},
			\ {'.P': 'Defx -auto-cd -new ' . $PANDOCRUNTIME},
			\ {'.f': 'Defx -auto-cd -new ' . $HOME . '/.local/share/fonts'},
			\ {'.F': 'Defx -auto-cd -new ' . $FONTS},
			\ {'.a': 'Defx -auto-cd -new ' . $HOME . '/.local/share/applications'},
			\ {'.A': 'Defx -auto-cd -new ' . $APPLICATIONS},
			\ {'.x': 'Defx -auto-cd -new ' . $HOME . '/.local/share/gnome-shell/extensions'},
			\ {'.z': 'Defx -auto-cd -new ' . $HOME . '/.zinit/plugins'},
			\ {'.o': 'Defx -auto-cd -new ' . $OCTAVEWORKSPACE},
			\ {'.d': 'Defx -auto-cd -new ' . $DOCUMENTS},
			\ {'.q': 'Defx -auto-cd -new ' . $QQWORKSPACE},
			\ {'.b': 'Utl openLink http://127.0.0.1:4000/'},
			\ {'.B': 'Utl openLink https://'.$USER.'.github.io/'},
			\ {'.g': 'Utl openLink https://github.com/'},
			\ {'.w': 'Utl openLink https://wakatime.com/dashboard/'},
			\ {'.j': 'Utl openLink http://m.njust.edu.cn/'},
			\ ]
let g:startify_bookmarks = [
			\ {g:maplocalleader.'v': $MYVIMRC},
			\ {g:maplocalleader.g:maplocalleader: expand('$VIMCONFIG/etc/unix.sh')},
			\ {g:maplocalleader.'z': $VIMCONFIG.'/etc/.zshrc'},
			\ {g:maplocalleader.'m': expand('$HOME/.minttyrc')},
			\ {g:maplocalleader.'g': expand('$HOME/.gitconfig')},
			\ {g:maplocalleader.'x': expand('$HOME/.ssh/id_rsa.pub')},
			\ {g:maplocalleader.'o': $MYONIRC},
			\ {g:maplocalleader.'w': $MYWAKATIMESYNCRC},
			\ {g:maplocalleader.'j': expand('$HOME/.jupyter/jupyter_notebook_config.py')},
			\ {g:maplocalleader.'a': expand('$HOME/.local/share/applications/defaults.list')},
			\ {g:maplocalleader.'n': expand('$HOME/NetHack/.nethackrc')},
			\ ]
augroup init_Startify "{{{
	autocmd!
	autocmd VimEnter * let g:startify_custom_header = cowsay#cowsay(fortune#fortune(), 'dragon-and-cow')
	autocmd VimEnter * call init#startify#main()
	if exists('##TabNewEntered')
		autocmd TabNewEntered * Startify
		"else
		"autocmd BufWinEnter * call s:startify()
		"function! s:startify() "{{{
		"if !exists('t:startify_new_tab') && empty(expand('%')) && empty(&l:buftype) && &l:modifiable
		"let t:startify_new_tab = 1
		"Startify
		"endif
		"endfunction "}}}
	endif
augroup END "}}}
nnoremap <Leader>sl :SLoad<CR>
nnoremap <Leader>sv :SSave<CR>
nnoremap <Leader>sd :SDelete<CR>
nnoremap <Leader>sc :SClose<CR>
nnoremap <Leader>ss :call init#startify#main()<CR><C-w>n:Startify<CR>
" 3}}} mhinz/vim-startify "
" 2}}} UI "

" SyntaxMarkUp {{{2 "
"  {{{3 "
let g:load_doxygen_syntax=1
nnoremap <Leader>by :let g:load_doxygen_syntax = !g:load_doxygen_syntax\| syntax on<CR>
" 3}}}  "
" sheerun/vim-polyglot {{{3 "
let g:polyglot_disabled = ['latex']
" 3}}} sheerun/vim-polyglot "
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
set noerrorbells " 关闭错误的提示
set nobackup " 设置不备份
if &backup&&!has('nvim')
	let s:backup_data = $VIMDATA.'/backup'
	if !isdirectory(s:backup_data)
		call mkdir(s:backup_data, 'p')
	endif
	let &backupdir=s:backup_data
endif
if &backup
	set backupext=.temporary
endif
set swapfile " 禁止生成临时文件
if &swapfile&&!has('nvim')
	let s:swap_data = $VIMDATA.'/swap'
	if !isdirectory(s:swap_data)
		call mkdir(s:swap_data, 'p')
	endif
	let &dir=s:swap_data
endif
let g:netrw_home = $VIMDATA
if has('unix')
	let g:netrw_browsex_viewer = '-'
endif
let g:netrw_altfile = 1
" 3}}}  "
" Shougo/defx.nvim {{{3 "
nnoremap <Leader>jk :Defx -auto-cd<CR>
nnoremap <Leader>jK :Defx<CR>
nnoremap <Leader>jj :Defx -new `expand('%:p:h')`<CR><C-w>=
nnoremap <Leader>jJ :Rooter<CR>:Defx -new `getcwd()`<CR><C-w>=
nnoremap <Leader>je :Defx `expand('%:p:h')`<CR><C-w>=
nnoremap <Leader>jE :Rooter<CR>:Defx `getcwd()`<CR><C-w>=
" 3}}} Shougo/defx.nvim "
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
" 3}}} airblade/vim-rooter "
" mhinz/vim-hugefile {{{3 "
nnoremap <Leader>bH :HugefileToggle<CR>
let g:hugefile_trigger_size = 5
" 3}}} mhinz/vim-hugefile "
" danro/rename.vim {{{3 "
nnoremap <Leader>vr :<C-u>Rename<Space>
" 3}}} danro/rename.vim "
" 907th/vim-auto-save {{{3 "
nnoremap <Leader>bv :<C-u>AutoSaveToggle<CR>
"let g:auto_save = 1
" 3}}} 907th/vim-auto-save "
" 2}}} FileEdit "

" BufferExplore {{{2 "
" jlanzarotta/bufexplorer {{{3 "
let g:bufExplorerDefaultHelp = 0
let g:bufExplorerShowNoName = 1
let g:bufExplorerChgWin = 1
nnoremap <Leader>jb :<C-u>BufExplorerHorizontalSplit<CR>
" 3}}} jlanzarotta/bufexplorer "
" 2}}} BufferExplore "

" Compress {{{2 "
" 2}}} Compress "

" VCS {{{2 "
"  {{{3 "
"set history=100 "sensible
set sessionoptions="blank,buffers,globals,localoptions,tabpages,sesdir,folds,help,options,resize,winpos,winsize"
"set autoread " 文件在vim之外修改过，自动重新读入 sensible
set autowrite " 设置自动保存
set confirm " 在处理未保存或只读文件的时候，弹出确认
nnoremap <Leader>gC :call init#clean#main(g:clean)<CR>
let g:clean = ['.git', '.svn']
nnoremap <Leader>gD :call init#clean#main(get(b:, 'clean', []))<CR>
" 3}}}  "
" tpope/vim-fugitive {{{3 "
nnoremap <Leader>gg :G<CR>
nnoremap <Leader>gi :G init<CR>
nnoremap <Leader>gc :G clone git@github.com:Freed-Wu/.git<Left><Left><Left><Left>
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
let s:vim_github_dashboard_config = $VIMCONFIG.'/.vim-github-dashboard'
if !isdirectory(s:vim_github_dashboard_config)
	call mkdir(s:vim_github_dashboard_config, 'p')
endif
let s:vim_github_dashboard_config_txt = s:vim_github_dashboard_config.'/password.txt'
if filereadable(s:vim_github_dashboard_config_txt)
	let g:github_dashboard = { 'username': $USER, 'password': readfile(s:vim_github_dashboard_config_txt)[0] }
endif
nnoremap <Leader>gd :GHDashboard! Freed-Wu
nnoremap <Leader>ga :GHActivity! Freed-Wu
xnoremap <Leader>gd y:GHDashboard! <C-r>0<CR>
xnoremap <Leader>ga y:GHActivity! <C-r>0<CR>
" 3}}} junegunn/vim-github-dashboard "
" mhinz/vim-signify {{{3 "
" this first setting decides in which order try to guess your current vcs
" UPDATE it to reflect your preferences, it will speed up opening files
let g:signify_vcs_list = [ 'git', 'hg' ]
" mappings to jump to changed blocks
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
let s:github_issues_vim_config = $VIMCONFIG.'/.github-issues.vim'
if isdirectory(s:github_issues_vim_config)
	let s:github_access_token = s:github_issues_vim_config.'/github_access_token.txt'
	if !filereadable(s:github_access_token)
		call writefile([], s:github_access_token)
	endif
	let g:github_access_token = readfile(s:github_access_token)[0]
endif
let g:gissues_lazy_load = 1
nnoremap <Leader>gs :Gissues<CR>
nnoremap <Leader>gp :Giadd<CR>
" 3}}} jaxbot/github-issues.vim "
" mbbill/undotree {{{3 "
let g:undotree_HelpLine = 0
let g:undotree_CustomUndotreeCmd = 'botright vertical '.'30'.' new'
let g:undotree_CustomDiffpanelCmd = 'topleft 5 new'
nnoremap <Leader>ju :<C-u>UndotreeToggle\| UndotreeFocus<CR>
" 保存 undo 历史
set undofile
if &undofile&&!has('nvim')
	let s:undo_data = $VIMDATA.'/undo'
	if !isdirectory(s:undo_data)
		call mkdir(s:undo_data, 'p')
	endif
	let &undodir=s:undo_data
endif
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
"  {{{3 "
set cscopequickfix=s-,c-,d-,i-,t-,e-,a-
" 3}}}  "
" ludovicchabant/vim-gutentags {{{3 "
" gutentags搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归 "
"let g:gutentags_project_root =
" 所生成的数据文件的名称 "
let g:gutentags_ctags_tagfile = '.tags'
" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录 "
" 检测 ~/.cache/tags 不存在就新建 "
let s:vim_gutentags_data = $VIMDATA.'/.vim-gutentags'
if !isdirectory(s:vim_gutentags_data)
	call mkdir(s:vim_gutentags_data, 'p')
endif
let g:gutentags_cache_dir = s:vim_gutentags_data
" 配置 ctags 的参数 "
" enable gtags module
if executable('ctags')
	let g:gutentags_modules = ['ctags']
endif
if executable('cscope')
	let g:gutentags_modules += ['cscope']
endif
if executable('gtags-cscope')
	let g:gutentags_modules += ['gtags_cscope']
endif
" forbid gutentags adding gtags databases
"let g:gutentags_auto_add_gtags_cscope = 0
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
let g:vista_sidebar_width = g:columns
let g:vista_fold_toggle_icons = ['', '']
let g:vista_close_on_jump = 1
"let g:vista#renderer#icons =
nnoremap <Leader>jv :Vista<CR>
" 3}}} liuchengxu/vista.vim "
" dirn/TODO.vim {{{3 "
nnoremap <Leader>lo :TODO<CR>
" 3}}} dirn/TODO.vim "
" 2}}} TagExplore "

" FuzzyFind {{{2 "
if has('python3')
	" Yggdroot/LeaderF {{{3 "
	"let g:Lf_PythonVersion = 3
	let g:Lf_ShortcutF = '<Leader>ff'
	let g:Lf_ShortcutB = '<Leader>fb'
	let g:Lf_StlColorschemes = ['random']
	let g:Lf_StlColorschemes += ['powerline']
	let g:Lf_StlColorschemes += ['one']
	let g:Lf_StlColorschemes += ['default']
	for s:indexLfcolor in range(min([len(g:Lf_StlColorschemes), 10]))
		if g:Lf_StlColorschemes[s:indexLfcolor] == 'random'
			execute 'nnoremap <Leader>f'.s:indexLfcolor.' :<C-u>let g:Lf_StlColorscheme = g:Lf_StlColorschemes[Random(1, len(g:Lf_StlColorschemes) - 1)]<CR>'
		else
			execute 'nnoremap <Leader>f'.s:indexLfcolor.' :let g:Lf_StlColorscheme = '''.g:Lf_StlColorschemes[s:indexLfcolor].'''<CR>'
		endif
	endfor
	nnoremap <Leader>f<Tab> :LeaderfSelf<CR>
	nnoremap <Leader>ff :LeaderfFile<CR>
	nnoremap <Leader>fF :LeaderfFileFullScreen<CR>
	nnoremap <Leader>fb :LeaderfBuffer<CR>
	nnoremap <Leader>fB :LeaderfBufferAll<CR>
	nnoremap <Leader>fa :LeaderfTabBuffer<CR>
	nnoremap <Leader>fA :LeaderfTabBufferAll<CR>
	nnoremap <Leader>fm :LeaderfMru<CR>
	nnoremap <Leader>fM :LeaderfMruCwd<CR>
	nnoremap <Leader>fg :LeaderfTag<CR>
	nnoremap <Leader>ft :LeaderfBufTag<CR>
	nnoremap <Leader>fT :LeaderfBufTagAll<CR>
	nnoremap <Leader>fs :LeaderfFunction<CR>
	nnoremap <Leader>fS :LeaderfFunctionAll<CR>
	nnoremap <Leader>fl :LeaderfLine<CR>
	nnoremap <Leader>fL :LeaderfLineAll<CR>
	nnoremap <Leader>f: :LeaderfHistoryCmd<CR>
	nnoremap <Leader>f/ :LeaderfHistorySearch<CR>
	nnoremap <Leader>fh :LeaderfHelp<CR>
	nnoremap <Leader>fc :LeaderfColorscheme<CR>
	let g:Lf_StlSeparaor = { 'left': '', 'right': '' }
	"let g:Lf_WindowPosition = 'right'
	let g:Lf_HideHelp = 1
	let g:Lf_ShowHidden = 1
	let g:Lf_HistoryNumber = 300
	let g:Lf_MruMaxFiles = 300
	if !isdirectory($VIMDATA)
		call mkdir($VIMDATA, 'p')
	endif
	let g:Lf_CacheDirectory = $VIMDATA
	let g:Lf_ReverseOrder = 1
	let g:Lf_CommandMap = {
				\ '<Esc>': ['<C-q>','<Esc>'],
				\ '<C-r>': ['<C-\>'],
				\ '<C-f>': ['<C-s>'],
				\ '<Tab>':  ['<C-Tab>', '<Tab>'],
				\ '<S-Insert>': ['<C-y>', '<S-Insert>'],
				\ '<C-j>': ['<C-j>'],
				\ '<C-k>': ['<C-k>'],
				\ '<Up>': ['<C-p>', '<Up>'],
				\ '<Down>': ['<C-n>', '<Down>'],
				\ '<C-x>': ['<C-CR>', '<C-x>'],
				\ '<C-]>': ['<S-CR>', '<C-]>'],
				\ '<C-t>': ['<M-CR>', '<C-t>'],
				\ '<F5>': ['<C-r>', '<F5>'],
				\ '<C-leftmouse>': ['<M-leftmouse>', '<C-leftmouse>'],
				\ '<C-a>': ['<C-g>'],
				\ '<BS>': ['<C-h>', '<BS>'],
				\ '<Del>': ['<C-d>', '<Del>'],
				\ '<Home>': ['<C-a>', '<Home>'],
				\ '<End>': ['<C-e>', '<End>'],
				\ '<Left>': ['<C-b>', '<Left>'],
				\ '<Right>': ['<C-f>', '<Right>'],
				\ '<C-p>': ['<C-g>']
				\ }
	" 3}}} Yggdroot/LeaderF "
endif
" 2}}} FuzzyFind "

" MarkExplore {{{2 "
" kshenoy/vim-signature {{{3 "
let g:SignatureMap = {
			\ 'Leader': 'm',
			\ 'PlaceNextMark': 'm,',
			\ 'ToggleMarkAtLine': 'm;',
			\ 'PurgeMarksAtLine': 'm-',
			\ 'DeleteMark': 'm_ ',
			\ 'PurgeMarks': 'm=',
			\ 'PurgeMarkers': 'm+',
			\ 'GotoPrevLineAlpha': "'-",
			\ 'GotoNextLineAlpha': "'+",
			\ 'GotoPrevSpotAlpha': '`-',
			\ 'GotoNextSpotAlpha': '`+',
			\ 'GotoPrevLineByPos': "',",
			\ 'GotoNextLineByPos': "';",
			\ 'GotoPrevSpotByPos': '`,',
			\ 'GotoNextSpotByPos': '`;',
			\ 'GotoPrevMarker': '[;',
			\ 'GotoNextMarker': '];',
			\ 'GotoPrevMarkerAny': '[,',
			\ 'GotoNextMarkerAny': '],',
			\ 'ListBufferMarks': '<Leader>l;',
			\ 'ListBufferMarkers': '<Leader>l,',
			\ }
" 3}}} kshenoy/vim-signature "
" vim-scripts/MarksBrowser {{{3 "
nnoremap <Leader>jm :MarksBrowser<CR>
" 3}}} vim-scripts/MarksBrowser "
" 2}}} MarkExplore "

" Move {{{2 "
" easymotion/vim-easymotion {{{3 "
" map <Esc> <Plug>(easymotion-prefix)
" <Leader>f{char} to move to {char}
xmap <Leader><Leader>f <Plug>(easymotion-bd-f)
nmap <Leader><Leader>f <Plug>(easymotion-overwin-f)
" s{char}{char} to move to {char}{char}
xmap <Leader><Leader>- <Plug>(easymotion-bd-f2)
nmap <Leader><Leader>- <Plug>(easymotion-overwin-f2)
" Move to line
xmap <Leader><Leader>g <Plug>(easymotion-bd-jk)
nmap <Leader><Leader>g <Plug>(easymotion-overwin-line)
" Move to word
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
"let g:wheel#map#up = '[E'
"let g:wheel#map#down = ']E'
nmap [E <Plug>(WheelUp)
xmap [E <Plug>(WheelUp)
nmap ]E <Plug>(WheelDown)
xmap ]E <Plug>(WheelDown)
nmap [F <Plug>(WheelLeft)
xmap [F <Plug>(WheelLeft)
nmap ]F <Plug>(WheelRight)
xmap ]F <Plug>(WheelRight)
"let g:wheel#map#mouse = 1       " 1=natural, 0=disable, -1=reverse
"let g:wheel#line#threshold = 5      " lines from start or end
"let g:wheel#scroll_on_wrap = 1      " 0=disable, 1=enable (default)
" 3}}} reedes/vim-wheel "
" andymass/vim-matchup {{{3 "
set showmatch
"set matchtime=10
let g:matchup_motion_enabled = 0
inoremap <C-]> <c-o>:call matchup#motion#insert_mode()<CR>
nnoremap % :<C-u>call matchup#motion#find_matching_pair(0, 1)<CR>
onoremap % :<C-u>call matchup#motion#op('%')<CR>
xnoremap % :<c-u>call matchup#motion#find_matching_pair(1, 1)<CR>
nnoremap <S-Space> :<C-u>call matchup#motion#find_matching_pair(0, 1)<CR>
onoremap <S-Space> :<C-u>call matchup#motion#op('%')<CR>
xnoremap <S-Space> :<c-u>call matchup#motion#find_matching_pair(1, 1)<CR>
nnoremap [% :<C-u>call matchup#motion#find_unmatched(0, 0)<CR>
nnoremap ]% :<C-u>call matchup#motion#find_unmatched(0, 1)<CR>
xnoremap [% :<c-u>call matchup#motion#find_unmatched(1, 0)<CR>
xnoremap ]% :<c-u>call matchup#motion#find_unmatched(1, 1)<CR>
onoremap [% :<C-u>call matchup#motion#op('[%')<CR>
onoremap ]% :<C-u>call matchup#motion#op(']%')<CR>
nnoremap g% :<C-u>call matchup#motion#find_matching_pair(0, 0)<CR>
onoremap g% :<C-u>call matchup#motion#op('g%')<CR>
xnoremap g% :<c-u>call matchup#motion#find_matching_pair(1, 0)<CR>
nnoremap z% :<C-u>call matchup#motion#jump_inside(0)<CR>
xnoremap z% :<c-u>call matchup#motion#jump_inside(1)<CR>
onoremap z% :<C-u>call matchup#motion#op('z%')<CR>
let g:matchup_surround_enabled = 1
xmap ax <plug>(matchup-a%)
xmap ix <plug>(matchup-i%)
omap ax <plug>(matchup-a%)
omap ix <plug>(matchup-i%)
nmap dsx <plug>(matchup-ds%)
nmap csx <plug>(matchup-cs%)
" 3}}} andymass/vim-matchup "
" takac/vim-hardtime {{{3 "
nnoremap <Leader>bh :HardTimeToggle<CR>
" 3}}} takac/vim-hardtime "
" wesQ3/vim-windowswap {{{3 "
let g:windowswap_map_keys = 0 "prevent default bindings
"nnoremap <C-w>` :<C-u>call WindowSwap#MarkWindowSwap()<CR>
"nnoremap <C-w>' :<C-u>call WindowSwap#DoWindowSwap()<CR>
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
nmap _ <Plug>Sneak_S
xmap _ <Plug>Sneak_S
omap _ <Plug>Sneak_S
nmap - <Plug>Sneak_s
xmap - <Plug>Sneak_s
omap - <Plug>Sneak_s
nmap f <Plug>Sneak_f
nmap F <Plug>Sneak_F
" visual-mode
xmap f <Plug>Sneak_f
xmap F <Plug>Sneak_F
" operator-pending-mode
omap f <Plug>Sneak_f
omap F <Plug>Sneak_F
" 1-character enhanced 't'
nmap t <Plug>Sneak_t
nmap T <Plug>Sneak_T
" visual-mode
xmap t <Plug>Sneak_t
xmap T <Plug>Sneak_T
" operator-pending-mode
omap t <Plug>Sneak_t
omap T <Plug>Sneak_T
nmap z; <Plug>Sneak_;
xmap z; <Plug>Sneak_;
omap z; <Plug>Sneak_;
nmap z, <Plug>Sneak_,
xmap z, <Plug>Sneak_,
omap z, <Plug>Sneak_,
nmap z- <Plug>SneakLabel_s
nmap z_ <Plug>SneakLabel_S
" 3}}} justinmk/vim-sneak "
" haya14busa/incsearch.vim {{{3 "
let g:incsearch#auto_nohlsearch = 1
" 3}}} haya14busa/incsearch.vim "
" haya14busa/is.vim {{{3 "
"let g:is#do_default_mappings = 0
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
"map *  <Plug>(asterisk-z*)<Plug>(is-nohl-1)
"map g* <Plug>(asterisk-gz*)<Plug>(is-nohl-1)
"map #  <Plug>(asterisk-z#)<Plug>(is-nohl-1)
"map g# <Plug>(asterisk-gz#)<Plug>(is-nohl-1)
" 3}}} haya14busa/is.vim "
" haya14busa/incsearch-easymotion.vim {{{3 "
nmap / <Plug>(incsearch-easymotion-/)
nmap ? <Plug>(incsearch-easymotion-?)
xmap / <Plug>(incsearch-easymotion-/)
xmap ? <Plug>(incsearch-easymotion-?)
omap / <Plug>(incsearch-easymotion-/)
omap ? <Plug>(incsearch-easymotion-?)
nmap + <Plug>(incsearch-easymotion-stay)
xmap + <Plug>(incsearch-easymotion-stay)
" 3}}} haya14busa/incsearch-easymotion.vim "
" haya14busa/incsearch-fuzzy.vim {{{3 "
" incsearch.vim x fuzzy x vim-easymotion
noremap <expr> z/ incsearch#go(init#fuzzymotion#main())
noremap <expr> z? incsearch#go(init#fuzzymotion#main({'command': '?'}))
noremap <expr> z+ incsearch#go(init#fuzzymotion#main({'is_stay': 1}))
" 3}}} haya14busa/incsearch-fuzzy.vim "
" haya14busa/incsearch-migemo.vim {{{3 "
map <Leader>z/ <Plug>(incsearch-migemo-/)
map <Leader>z? <Plug>(incsearch-migemo-?)
map <Leader>z+ <Plug>(incsearch-migemo-stay)
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
" 1}}} CursorMove "

" CursorVisual {{{1 "
" Select {{{2 "
" terryma/vim-expand-region {{{3 "
xmap <C-p> <Plug>(expand_region_expand)
xmap <C-n> <Plug>(expand_region_shrink)
" 3}}} terryma/vim-expand-region "
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
" beloglazov/vim-textobj-punctuation {{{3 "
let g:textobj_punctuation_no_default_key_mappings = 1
xmap gp <Plug>(textobj-punctuation-a)
xmap gP <Plug>(textobj-punctuation-i)
" 3}}} beloglazov/vim-textobj-punctuation "
" thinca/vim-textobj-between {{{3 "
let g:textobj_between_no_default_key_mappings = 1
xmap x <Plug>(textobj-between-i)
xmap X <Plug>(textobj-between-a)
omap x <Plug>(textobj-between-i)
omap X <Plug>(textobj-between-a)
" 3}}} thinca/vim-textobj-between "
" kana/vim-textobj-jabraces {{{3 "
"let g:textobj_jabraces_no_default_key_mappings = 1
xmap ajb <Plug>(textobj-jabraces-parens-a)
xmap aj( <Plug>(textobj-jabraces-parens-a)
xmap aj) <Plug>(textobj-jabraces-parens-a)
xmap ajB <Plug>(textobj-jabraces-braces-a)
xmap aj{ <Plug>(textobj-jabraces-braces-a)
xmap aj} <Plug>(textobj-jabraces-braces-a)
xmap ajr <Plug>(textobj-jabraces-brackets-a)
xmap aj[ <Plug>(textobj-jabraces-brackets-a)
xmap aj] <Plug>(textobj-jabraces-brackets-a)
xmap aja <Plug>(textobj-jabraces-angles-a)
xmap aj< <Plug>(textobj-jabraces-angles-a)
xmap aj> <Plug>(textobj-jabraces-angles-a)
xmap ajA <Plug>(textobj-jabraces-double-angles-a)
xmap ajk <Plug>(textobj-jabraces-kakko-a)
xmap ajK <Plug>(textobj-jabraces-double-kakko-a)
xmap ajy <Plug>(textobj-jabraces-yama-kakko-a)
xmap ajY <Plug>(textobj-jabraces-double-yama-kakko-a)
xmap ajt <Plug>(textobj-jabraces-kikkou-kakko-a)
xmap ajs <Plug>(textobj-jabraces-sumi-kakko-a)
xmap ijb <Plug>(textobj-jabraces-parens-i)
xmap ij( <Plug>(textobj-jabraces-parens-i)
xmap ij) <Plug>(textobj-jabraces-parens-i)
xmap ijB <Plug>(textobj-jabraces-braces-i)
xmap ij{ <Plug>(textobj-jabraces-braces-i)
xmap ij} <Plug>(textobj-jabraces-braces-i)
xmap ijr <Plug>(textobj-jabraces-brackets-i)
xmap ij[ <Plug>(textobj-jabraces-brackets-i)
xmap ij] <Plug>(textobj-jabraces-brackets-i)
xmap ija <Plug>(textobj-jabraces-angles-i)
xmap ij< <Plug>(textobj-jabraces-angles-i)
xmap ij> <Plug>(textobj-jabraces-angles-i)
xmap ijA <Plug>(textobj-jabraces-double-angles-i)
xmap ijk <Plug>(textobj-jabraces-kakko-i)
xmap ijK <Plug>(textobj-jabraces-double-kakko-i)
xmap ijy <Plug>(textobj-jabraces-yama-kakko-i)
xmap ijY <Plug>(textobj-jabraces-double-yama-kakko-i)
xmap ijt <Plug>(textobj-jabraces-kikkou-kakko-i)
xmap ijs <Plug>(textobj-jabraces-sumi-kakko-i)
omap ajb <Plug>(textobj-jabraces-parens-a)
omap aj( <Plug>(textobj-jabraces-parens-a)
omap aj) <Plug>(textobj-jabraces-parens-a)
omap ajB <Plug>(textobj-jabraces-braces-a)
omap aj{ <Plug>(textobj-jabraces-braces-a)
omap aj} <Plug>(textobj-jabraces-braces-a)
omap ajr <Plug>(textobj-jabraces-brackets-a)
omap aj[ <Plug>(textobj-jabraces-brackets-a)
omap aj] <Plug>(textobj-jabraces-brackets-a)
omap aja <Plug>(textobj-jabraces-angles-a)
omap aj< <Plug>(textobj-jabraces-angles-a)
omap aj> <Plug>(textobj-jabraces-angles-a)
omap ajA <Plug>(textobj-jabraces-double-angles-a)
omap ajk <Plug>(textobj-jabraces-kakko-a)
omap ajK <Plug>(textobj-jabraces-double-kakko-a)
omap ajy <Plug>(textobj-jabraces-yama-kakko-a)
omap ajY <Plug>(textobj-jabraces-double-yama-kakko-a)
omap ajt <Plug>(textobj-jabraces-kikkou-kakko-a)
omap ajs <Plug>(textobj-jabraces-sumi-kakko-a)
omap ijb <Plug>(textobj-jabraces-parens-i)
omap ij( <Plug>(textobj-jabraces-parens-i)
omap ij) <Plug>(textobj-jabraces-parens-i)
omap ijB <Plug>(textobj-jabraces-braces-i)
omap ij{ <Plug>(textobj-jabraces-braces-i)
omap ij} <Plug>(textobj-jabraces-braces-i)
omap ijr <Plug>(textobj-jabraces-brackets-i)
omap ij[ <Plug>(textobj-jabraces-brackets-i)
omap ij] <Plug>(textobj-jabraces-brackets-i)
omap ija <Plug>(textobj-jabraces-angles-i)
omap ij< <Plug>(textobj-jabraces-angles-i)
omap ij> <Plug>(textobj-jabraces-angles-i)
omap ijA <Plug>(textobj-jabraces-double-angles-i)
omap ijk <Plug>(textobj-jabraces-kakko-i)
omap ijK <Plug>(textobj-jabraces-double-kakko-i)
omap ijy <Plug>(textobj-jabraces-yama-kakko-i)
omap ijY <Plug>(textobj-jabraces-double-yama-kakko-i)
omap ijt <Plug>(textobj-jabraces-kikkou-kakko-i)
omap ijs <Plug>(textobj-jabraces-sumi-kakko-i)
" 3}}} kana/vim-textobj-jabraces "
" reedes/vim-textobj-quote {{{3 "
"let g:textobj_quote_no_default_key_mappings = 1
" NOTE: remove these mappings if using the tpope/vim-surround plugin!
let g:textobj#quote#doubleMotion = 'K'
let g:textobj#quote#singleMotion = 'J'
" 3}}} reedes/vim-textobj-quote "
" reedes/vim-textobj-sentence {{{3 "
"let g:textobj_sentence_no_default_key_mappings = 1
let g:textobj#sentence#select = 'S'
let g:textobj#sentence#move_p = '('
let g:textobj#sentence#move_n = ')'
" 3}}} reedes/vim-textobj-sentence "
" ctholho/vim-textobj-sentence-line {{{3 "
" let g:textobj_fsent_no_default_key_mappings = 1
nmap z( <Plug>(textobj-fsent-move-p)
nmap z) <Plug>(textobj-fsent-move-n)
nmap z{ <Plug>(textobj-fsent-move-P)
nmap z} <Plug>(textobj-fsent-move-N)
xmap z( <Plug>(textobj-fsent-move-p)
xmap z) <Plug>(textobj-fsent-move-n)
xmap z{ <Plug>(textobj-fsent-move-P)
xmap z} <Plug>(textobj-fsent-move-N)
omap z( <Plug>(textobj-fsent-move-p)
omap z) <Plug>(textobj-fsent-move-n)
omap z{ <Plug>(textobj-fsent-move-p)
omap z} <Plug>(textobj-fsent-move-N)
xmap is <Plug>(textobj-fsent-select-i)
xmap as <Plug>(textobj-fsent-select-a)
omap is <Plug>(textobj-fsent-select-i)
omap as <Plug>(textobj-fsent-select-a)
" 3}}} ctholho/vim-textobj-sentence-line "
" saihoooooooo/vim-textobj-space {{{3 "
let g:textobj_space_no_default_key_mappings = 1
xmap io <Plug>(textobj-space-i)
xmap ao <Plug>(textobj-space-a)
omap io <Plug>(textobj-space-i)
omap ao <Plug>(textobj-space-a)
" 3}}} saihoooooooo/vim-textobj-space "
" deathlyfrantic/vim-textobj-blanklines {{{3 "
let g:textobj_blanklines_no_default_key_mappings = 1
xmap [O <Plug>(textobj-blanklines-a)
xmap ]O <Plug>(textobj-blanklines-i)
omap [O <Plug>(textobj-blanklines-a)
omap ]O <Plug>(textobj-blanklines-i)
" 3}}} deathlyfrantic/vim-textobj-blanklines "
" whatyouhide/vim-textobj-xmlattr {{{3 "
let g:textobj_xlattr_no_default_key_mappings = 1
xmap iX <Plug>(textobj-xmlattr-attr-i)
xmap aX <Plug>(textobj-xmlattr-attr-a)
omap iX <Plug>(textobj-xmlattr-attr-i)
omap aX <Plug>(textobj-xmlattr-attr-a)
" 3}}} whatyouhide/vim-textobj-xmlattr "
" 2}}} TextObjChar "

" TextObjSymbol {{{2 "
"  {{{3 "
xnoremap iG g^og$
xnoremap aG g0og$
onoremap Ip ipO<Esc>
xnoremap Ip ipk
" 3}}}  "
" kana/vim-textobj-entire {{{3 "
let g:textobj_entire_no_default_key_mappings = 1
xmap i0 <Plug>(textobj-entire-i)
xmap a0 <Plug>(textobj-entire-a)
omap i0 <Plug>(textobj-entire-i)
omap a0 <Plug>(textobj-entire-a)
" 3}}} kana/vim-textobj-entire "
" kana/vim-textobj-indent {{{3 "
let g:textobj_indent_no_default_key_mappings = 1
xmap ai <Plug>(textobj-indent-a)
xmap ii <Plug>(textobj-indent-i)
xmap aI <Plug>(textobj-indent-same-a)
xmap iI <Plug>(textobj-indent-same-i)
omap ai <Plug>(textobj-indent-a)
omap ii <Plug>(textobj-indent-i)
omap aI <Plug>(textobj-indent-same-a)
omap iI <Plug>(textobj-indent-same-i)
" 3}}} kana/vim-textobj-indent "
" glts/vim-textobj-indblock {{{3 "
let g:textobj_indblock_no_default_key_mappings = 1
xmap aO <Plug>(textobj-indblock-a)
xmap iO <Plug>(textobj-indblock-i)
xmap AO <Plug>(textobj-indblock-same-a)
xmap IO <Plug>(textobj-indblock-same-i)
omap aO <Plug>(textobj-indblock-a)
omap iO <Plug>(textobj-indblock-i)
omap AO <Plug>(textobj-indblock-same-a)
omap IO <Plug>(textobj-indblock-same-i)
" 3}}} glts/vim-textobj-indblock "
" kana/vim-textobj-line {{{3 "
let g:textobj_line_no_default_key_mappings = 1
xmap il <Plug>(textobj-line-i)
xmap al <Plug>(textobj-line-a)
omap il <Plug>(textobj-line-i)
omap al <Plug>(textobj-line-a)
" 3}}} kana/vim-textobj-line "
" rhysd/vim-textobj-continuous-line {{{3 "
let g:textobj_continuous_line_no_default_mappings = 1
" 3}}} rhysd/vim-textobj-continuous-line "
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
nmap gy v<Plug>(textobj-pastedtext-text)
xmap gy <Plug>(textobj-pastedtext-text)
omap gy <Plug>(textobj-pastedtext-text)
let g:pastedtext_select_key = 'gy'
" 3}}} saaguero/vim-textobj-pastedtext "
" 2}}} TextObjSymbol "

" TextObjSyntax {{{2 "
" somini/vim-textobj-fold {{{3 "
"let g:textobj_fold_no_default_key_mappings = 1
xmap az <Plug>(textobj-fold-a)
xmap iz <Plug>(textobj-fold-i)
omap az <Plug>(textobj-fold-a)
omap iz <Plug>(textobj-fold-i)
" 3}}} somini/vim-textobj-fold "
" kana/vim-textobj-syntax {{{3 "
"let g:textobj_syntax_no_default_key_mappings = 1
xmap ay <Plug>(textobj-syntax-a)
xmap iy <Plug>(textobj-syntax-i)
omap ay <Plug>(textobj-syntax-a)
omap iy <Plug>(textobj-syntax-i)
" 3}}} kana/vim-textobj-syntax "
" glts/vim-textobj-comment {{{3 "
let g:textobj_comment_no_default_key_mappings = 1
xmap aM <Plug>(textobj-comment-a)
xmap iM <Plug>(textobj-comment-i)
xmap AM <Plug>(textobj-comment-big-a)
omap aM <Plug>(textobj-comment-a)
omap iM <Plug>(textobj-comment-i)
omap AM <Plug>(textobj-comment-big-a)
" 3}}} glts/vim-textobj-comment "
" 2}}} TextObjSyntax "

" TextObjContent {{{2 "
" Julian/vim-textobj-variable-segment {{{3 "
let g:textobj_variable_segment_no_default_key_mappings = 1
omap av <Plug>(textobj-variable-a)
xmap av <Plug>(textobj-variable-a)
omap iv <Plug>(textobj-variable-i)
xmap iv <Plug>(textobj-variable-i)
" 3}}} Julian/vim-textobj-variable-segment "
" Chun-Yang/vim-textobj-chunk {{{3 "
let g:textobj_chunk_no_default_key_mappings = 1
omap aY <Plug>(textobj-chunk-a)
xmap aY <Plug>(textobj-chunk-a)
omap iY <Plug>(textobj-chunk-i)
xmap iY <Plug>(textobj-chunk-i)
" 3}}} Chun-Yang/vim-textobj-chunk "
" rsrchboy/vim-textobj-heredocs {{{3 "
let g:textobj_heredocs_no_default_key_mappings = 1
xmap ar  <Plug>(textobj-heredocs-a)
omap ar  <Plug>(textobj-heredocs-a)
xmap ir  <Plug>(textobj-heredocs-i)
omap ir  <Plug>(textobj-heredocs-i)
" 3}}} rsrchboy/vim-textobj-heredocs "
" vimtaku/vim-textobj-keyvalue {{{3 "
"let g:textobj_key_no_default_key_mappings = 1
"let g:textobj_value_no_default_key_mappings = 1
xmap ak <Plug>(textobj-key-a)
xmap ik <Plug>(textobj-key-i)
xmap aK <Plug>(textobj-value-a)
xmap iK <Plug>(textobj-value-i)
omap ak <Plug>(textobj-key-a)
omap ik <Plug>(textobj-key-i)
omap aK <Plug>(textobj-value-a)
omap iK <Plug>(textobj-value-i)
" 3}}} vimtaku/vim-textobj-keyvalue "
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
let g:textobj_path_no_default_key_mappings = 1
xmap IA <Plug>(textobj-path-prev_path-i)
xmap iA <Plug>(textobj-path-next_path-i)
xmap AA <Plug>(textobj-path-prev_path-a)
xmap aA <Plug>(textobj-path-next_path-a)
" 3}}} paulhybryant/vim-textobj-path "
" jceb/vim-textobj-uri {{{3 "
let g:textobj_uri_no_default_key_mappings = 1
nmap gY <Plug>TextobjURIOpen
xmap iU <Plug>(textobj-uri-uri-i)
xmap aU <Plug>(textobj-uri-uri-a)
omap iU <Plug>(textobj-uri-uri-i)
omap aU <Plug>(textobj-uri-uri-a)
" 3}}} jceb/vim-textobj-uri "
" mattn/vim-textobj-url {{{3 "
"let g:textobj_url_no_default_key_mappings = 1
xmap iU <Plug>(textobj-url-i)
xmap aU <Plug>(textobj-url-a)
omap iU <Plug>(textobj-url-i)
omap aU <Plug>(textobj-url-a)
" 3}}} mattn/vim-textobj-url "
" 2}}} TextObjContent "

" TextObjMarkUp {{{2 "
" kana/vim-textobj-diff {{{3 "
let g:textobj_diff_no_default_key_mappings = 1
" 3}}} kana/vim-textobj-diff "
" coachshea/vim-textobj-markdown {{{3 "
let g:textobj_markdown_no_default_key_mappings = 1
" 3}}} coachshea/vim-textobj-markdown "
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
" vim-scripts/YankRing.vim {{{3 "
let g:yankring_n_keys = ''
let g:yankring_o_keys = ''
let g:yankring_v_key = ''
let g:yankring_paste_using_g = 0
let g:yankring_map_dot = 0
let g:yankring_zap_keys = ''
let g:yankring_del_v_key = ''
let g:yankring_paste_n_bkey = ''
let g:yankring_paste_n_akey = ''
let g:yankring_paste_v_bkey = ''
let g:yankring_paste_v_akey = ''
let g:yankring_window_auto_close = 1
let g:yankring_window_use_horiz = 0  " Use vertical split
let g:yankring_window_width = g:columns
"将yankring的历史文件夹移到~/.vim
let s:YankRing_vim_data = $VIMDATA.'/.YankRing.vim'
if !isdirectory(s:YankRing_vim_data)
	call mkdir(s:YankRing_vim_data, 'p')
endif
let g:yankring_history_dir = s:YankRing_vim_data
"修改历史文件名
"let g:yankring_history_file = '剪切板历史记录'
"<Leader>y显示yankring中的内容
nnoremap <Leader>jy :<C-u>YRShow<CR>
xnoremap <Leader>jy "_d"<Esc>h:YRShow<CR>
xmap <M-1> p<C-p><C-n>
xmap <M-2> p<C-p>
xmap <M-3> p2<C-p>
xmap <M-4> p3<C-p>
xmap <M-5> p4<C-p>
xmap <M-6> p5<C-p>
xmap <M-7> p6<C-p>
xmap <M-8> p7<C-p>
xmap <M-9> p8<C-p>
xmap <M-0> p9<C-p>
nmap <M-1> p<C-p><C-n>
nmap <M-2> p<C-p>
nmap <M-3> p2<C-p>
nmap <M-4> p3<C-p>
nmap <M-5> p4<C-p>
nmap <M-6> p5<C-p>
nmap <M-7> p6<C-p>
nmap <M-8> p7<C-p>
nmap <M-9> p8<C-p>
nmap <M-0> p9<C-p>
" 3}}} vim-scripts/YankRing.vim "
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
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap gb <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap gb <Plug>(EasyAlign)
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
set textwidth=80
if !v:vim_did_enter
	let s:textwidth = &textwidth
endif
set colorcolumn=+2
set linebreak
set formatoptions+=cqrnlmB
set formatoptions-=at2M
"set shiftwidth=8
"set tabstop=8
"set softtabstop=0
"set autoindent
"sensible
"augroup init_expandtab "{{{
"autocmd!
"autocmd BufRead,BufNewFile,BufEnter * silent! call init#expandtab#main()
"augroup END "}}}
"function! init#expandtab#main() "{{{
"if index(g:indent_guides_exclude_filetypes, &filetype) < 0
"redir @a
"%s/\t//gne
"redir END
"if @a == ''
"setlocal expandtab
"IndentGuidesDisable
"IndentLinesEnable
"LeadingSpaceEnable
"else
"setlocal noexpandtab
"IndentGuidesEnable
"IndentLinesDisable
"LeadingSpaceDisable
"endif
"endif
"endfunction "}}}
" 3}}}  "
" Soares/trailguide.vim {{{3 "
let g:trailguide_automap = 0
let g:trailguide_matchgroup = 'SpellBad'
nmap [r <Plug>trailguide#prev
nmap ]r <Plug>trailguide#next
nmap <Leader>bz <Plug>trailguide#toggle
nmap <Leader>rf <Plug>trailguide#fix
xnoremap <Leader>rf :TrailGuide fix<CR>
" 3}}} Soares/trailguide.vim "
" sbdchd/neoformat {{{3 "
let g:neoformat_basic_format_align = 1
let g:neoformat_basic_format_retab = 1
let g:neoformat_basic_format_trim = 1
let g:neoformat_try_formatprg = 1
let g:neoformat_data = $VIMDATA.'/.neoformat'
if !isdirectory(g:neoformat_data)
	call mkdir(g:neoformat_data, 'p')
endif
"nnoremap = :<C-u>set operatorfunc=init#format#main<CR>g@
"nnoremap == :.Neoformat<CR>
"xnoremap = :Neoformat<CR>
nnoremap <Leader>vz :execute 'split ' . $GITHUBWORKSPACE . '/sbdchd/neoformat/autoload/neoformat/formatters/'. &filetype .'.vim'<CR>
" 3}}} sbdchd/neoformat "
" editorconfig/editorconfig-vim {{{3 "
nnoremap <Leader>ze :<C-u>EditorConfigReload<CR>
" 3}}} editorconfig/editorconfig-vim "
" 2}}} Format "

" Comment {{{2 "
" scrooloose/nerdcommenter {{{3 "
nmap <Leader>cc <Plug>NERDCommenterComment
xmap <Leader>cc <Plug>NERDCommenterComment
nmap <Leader>cn <Plug>NERDCommenterNested
nmap <Leader>c<Leader> <Plug>NERDCommenterToggle
nmap <Leader>cm <Plug>NERDCommenterMinimal
nmap <Leader>ci <Plug>NERDCommenterInvert
nmap <Leader>cs <Plug>NERDCommenterSexy
xmap <Leader>cs <Plug>NERDCommenterSexy
nmap <Leader>cy <Plug>NERDCommenterYank
nmap <Leader>c$ <Plug>NERDCommenterToEOL
xmap <Leader>c$ <Plug>NERDCommenterToEOL
nmap <Leader>cg <Plug>NERDCommenterToEOL
xmap <Leader>cg <Plug>NERDCommenterToEOL
nmap <Leader>cA <Plug>NERDCommenterAppend
nmap <Leader>cI <Plug>NERDCommenterInsert
nmap <Leader>ca <Plug>NERDCommenterAltDelims
nmap <Leader>cl <Plug>NERDCommenterAlignLeft
nmap <Leader>cb <Plug>NERDCommenterAlignBoth
nmap <Leader>cu <Plug>NERDCommenterUncomment
xmap <Leader>cu <Plug>NERDCommenterUncomment
" 3}}} scrooloose/nerdcommenter "
" tpope/vim-commentary {{{3 "
nmap gc <Plug>Commentary
xmap gc <Plug>Commentary
omap gc <Plug>Commentary
nmap gcc <Plug>CommentaryLine
nmap gcu <Plug>Commentary<Plug>Commentary
" 3}}} tpope/vim-commentary "
" 2}}} Comment "

" Abbreviate {{{2 "
" 2}}} Abbreviate "

" Insert {{{2 "
"  {{{3 "
"设置= + - * 前后自动空格
inoremap , ,<C-g>u<Space>
inoremap ; ;<C-g>u<Space>
inoremap : :<C-g>u
inoremap ! !<C-g>u<Space>
inoremap ? ?<C-g>u<Space>
inoremap + <Space>+<Space>
inoremap ++ ++
inoremap += <Space>+=<Space>
inoremap = <Space>=<Space>
inoremap != <Space>!=<Space>
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
"set wildmenu " vim自身命名行模式智能补全 sensible
let s:thesaurus_config = $VIMCONFIG.'/.thesaurus'
if !isdirectory(s:thesaurus_config)
	call mkdir(s:thesaurus_config, 'p')
endif
execute 'set thesaurus=' . substitute(glob(s:thesaurus_config.'/*'), '\n', ',', 'g')
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
" Disable overwriting 'omnifunc'
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
" 2}}} Complete "

" Snippet {{{3 "
if has('python') || has('python3')
	" SirVer/UltiSnips {{{3 "
	" Trigger configuration. Do not use <Tab> if you use https://github.com/Valloric/YouCompleteMe.
	let g:UltiSnipsExpandTrigger = '<Tab>'
	"let g:UltiSnipsListSnippets = '<C-Tab>'
	let g:UltiSnipsJumpForwardTrigger = '<Tab>'
	let g:UltiSnipsJumpBackwardTrigger = '<S-Tab>'
	let g:vim_snippetsUltiSnips = $GITHUBWORKSPACE.'/honza/vim-snippets/UltiSnips'
	let g:vim_snippetsSnippets = $GITHUBWORKSPACE.'/honza/vim-snippets/snippets'
	let g:UltiSnips_config = $VIMCONFIG.'/UltiSnips'
	"let g:UltiSnipsEditSplit = 'horizontal'
	if isdirectory(g:UltiSnips_config)
		let g:UltiSnipsSnippetDirectories = [g:UltiSnips_config, g:vim_snippetsUltiSnips]
	endif
	nnoremap <Leader>na :<C-u>UltiSnipsAddFiletypes<Space>
	nnoremap <Leader>ne :<C-u>UltiSnipsEdit<Space>
	" 3}}} SirVer/UltiSnips "
endif
" honza/vim-snippets {{{3 "
let g:snips_author = $USER
let g:snips_github = $USER
let g:snips_email = $EMAIL
nnoremap <Leader>nn :<C-u>execute 'split '.g:UltiSnips_config.'/'.&filetype.'.snippets'<CR>
nnoremap <Leader>nN :<C-u>execute 'split '.g:UltiSnips_config.'/all.snippets'<CR>
nnoremap <Leader>nu :<C-u>execute 'split '.g:vim_snippetsUltiSnips.'/'.&filetype.'.snippets'<CR>
nnoremap <Leader>nU :<C-u>execute 'split '.g:vim_snippetsUltiSnips.'/all.snippets'<CR>
nnoremap <Leader>ns :<C-u>execute 'split '.g:vim_snippetsSnippets.'/'.&filetype.'.snippets'<CR>
nnoremap <Leader>nS :<C-u>execute 'split '.g:vim_snippetsSnippets.'/_.snippets'<CR>
" 3}}} honza/vim-snippets "
" aperezdc/vim-template {{{3 "
let s:vim_template_config = $VIMCONFIG.'/vim-template'
if isdirectory(s:vim_template_config)
	let g:templates_directory = [s:vim_template_config]
endif
"let g:templates_no_autocmd = 1
"if get(g:, 'templates_no_autocmd', 0)
"augroup init_Template "{{{
"autocmd!
"autocmd BufRead,BufNewFile * silent! call init#Template()
"augroup END "}}}
"endif
"function! init#Template() "{{{
"if expand('%') !~ g:templates_global_name_prefix
"let v:errmsg = ''
"%s/.//gn
"if v:errmsg[0:3] == 'E486'
"Template
"endif
"endif
"endfunction "}}}
"let g:templates_name_prefix = '.vim-template:'
let g:templates_global_name_prefix = '=template='
let g:vim_templates_directory = $GITHUBWORKSPACE.'/aperezdc/vim-template/templates'
nnoremap <Leader>eE :<C-u>execute 'split '.g:vim_templates_directory.'/'.g:templates_global_name_prefix.'.'.expand('%:e')<CR>
nnoremap <Leader>eT :<C-u>execute 'split '.g:vim_templates_directory.'/'.g:templates_global_name_prefix . expand('%:t')<CR>
nnoremap <Leader>ee :<C-u>execute 'split '.g:templates_directory[0].'/'.g:templates_global_name_prefix.'.'.expand('%:e')<CR>
nnoremap <Leader>et :<C-u>execute 'split '.g:templates_directory[0].'/'.g:templates_global_name_prefix . expand('%:t')<CR>
nnoremap <Leader>ep :Template<CR>
nnoremap <Leader>eh :TemplateHere<CR>
nnoremap <Leader>eP :Template<Space>
nnoremap <Leader>eH :TemplateHere<Space>
" 3}}} aperezdc/vim-template "
" 3}}} Snippet "

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
"始终开启标志列
let g:ale_sign_column_always = 1
let g:ale_set_highlights = 0
let g:ale_linters = {'python': ['flake8'], 'reStructuredText': ['rstcheck']}
let g:ale_fixers = {'python': ['remove_trailing_lines', 'trim_whitespace', 'autopep8']}
"自定义error和warning图标
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚡'
"在vim自带的状态栏中整合ale
"let g:ale_statusline_format = ['✗ %d', '⚡ %d', '✔ OK']
"显示Linter名称,出错或警告等相关信息
let g:ale_echo_msg_error_str = '✗'
let g:ale_echo_msg_warning_str = '⚡'
let g:ale_echo_msg_format = '%linter%: %severity%! %s'
"文件内容发生变化时不进行检查
"let g:ale_lint_on_text_changed = 'never'
"打开文件时不进行检查
"let g:ale_lint_on_enter = 0
"触发/关闭语法检查
nnoremap <Leader>az :<C-u>ALEToggle<CR>
"查看错误或警告的详细信息
nnoremap <Leader>aZ :<C-u>ALEDetail<CR>
nnoremap [k :<C-u>ALEPrevious<CR>
nnoremap ]k :<C-u>ALENext<CR>
nnoremap [K :<C-u>ALEFirst<CR>
nnoremap ]K :<C-u>ALELast<CR>
nnoremap <Leader>vZ :execute 'split ' . $GITHUBWORKSPACE . '/w0rp/ale/ale_linters/'. &filetype<CR>
" 3}}} w0rp/ale "
" wsdjeg/ChineseLinter.vim {{{3 "
nnoremap <Leader>lz :CheckChinese<CR>
" 3}}} wsdjeg/ChineseLinter.vim "
" hotoo/pangu.vim {{{3 "
nnoremap <Leader>zp :Pangu<CR>
" 3}}} hotoo/pangu.vim "
" dbmrq/vim-ditto {{{3 "
let s:vim_ditto_config = $VIMCONFIG.'/.vim-ditto'
if !isdirectory(s:vim_ditto_config)
	call mkdir(s:vim_ditto_config, 'p')
endif
let g:ditto_dir = s:vim_ditto_config
" Jump to the previous word
nmap [w <Plug>DittoPrev
" Jump to the next word
nmap ]w <Plug>DittoNext
" Ignore the word under the cursor
nmap zy <Plug>DittoGood
" Stop ignoring the word under the cursor
nmap zuy <Plug>DittoBad
" Show the previous matches
nmap [W <Plug>DittoLess
" Show the next matches
nmap ]W <Plug>DittoMore
nmap <Leader>zd <Plug>ToggleDitto
" 3}}} dbmrq/vim-ditto "
" reedes/vim-wordy {{{3 "
nnoremap <Leader>zw :Wordy<Space>
nnoremap <Leader>zW :NoWordy<CR>
nnoremap [v :PrevWordy<CR>
nnoremap ]v :NextWordy<CR>
" 3}}} reedes/vim-wordy "
" 2}}} Check "
" 1}}} Edit "

" Program {{{1 "
" Document {{{2 "
" vim-scripts/DoxygenToolkit.vim {{{3 "
"let g:DoxygenToolkit_commentType = "C++"
nnoremap <Leader>xx :<C-u>Dox<CR>
nnoremap <Leader>xa :<C-u>DoxAuthor<CR>
nnoremap <Leader>xl :<C-u>DoxLic<CR>
nnoremap <Leader>xu :<C-u>DoxUndoc<CR>
" 3}}} vim-scripts/DoxygenToolkit.vim "
" vim-scripts/doxygen-support.vim {{{3 "
let s:doxygen_support_vim_config = $VIMCONFIG.'/.doxygen-support.vim'
if !isdirectory(s:doxygen_support_vim_config)
	call mkdir(s:doxygen_support_vim_config, 'p')
endif
let g:Doxy_GlobalTemplateFile = s:doxygen_support_vim_config.'/doxygen.templates'
let g:Doxy_DoxygenExecutable = 'doxygen'
nnoremap <Leader>xm :<C-u>DxRun<CR>
nnoremap <Leader>xw :<C-u>DxSelectWorkingDir<CR>
nnoremap <Leader>xc :<C-u>DxSelectConfigFile<CR>
nnoremap <Leader>xe :<C-u>DxEditConfigFile<CR>
nnoremap <Leader>xg :<C-u>DxGenerateConfigFile<CR>
nnoremap <Leader>xt :<C-u>DxEditLocalTemplates<CR>
nnoremap <Leader>xT :<C-u>DxEditGlobalTemplates<CR>
nnoremap <Leader>xr :<C-u>DxReread<CR>
nnoremap <Leader>xs :<C-u>DxSettings<CR>
" 3}}} vim-scripts/doxygen-support.vim "
" 2}}} Document "

" MarkUp {{{2 "
"  {{{3 "
let g:tex_flavor = 'latex'
" 3}}}  "
" lervag/vimtex {{{3 "
let g:vimtex_mappings_enabled = 1
let g:vimtex_imaps_enabled = 0
if g:vimtex_imaps_enabled
	let g:vimtex_imaps_leader = ';'
endif
let g:vimtex_mappings_disable = {
			\ 'n': ['ds$', 'cs$', 'tsc', 'tse', 'tsd', 'tsD', '<F7>', 'K',],
			\ 'x': ['<F7>', 'tsd', 'tsD',],
			\ 'i': ['<F7>', 'tsD',],
			\ }
let g:vimtex_env_change_autofill = 1
let g:vimtex_fold_enabled = 1
let g:vimtex_fold_levelmarker = ''
"let g:vimtex_fold_types = {
			"\ 'preamble': {'enabled': 1},
			"\ 'envs': {
			"\   'whitelist': ['figure', 'table'],
			"\ },
			"\ 'marker': {'enabled': 1},
			"\ }
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
			\ 'split_width': g:columns,
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
"let g:vimtex_compiler_method = 'latexmk'
let g:vimtex_compiler_latexmk = {
			\ 'backend': 'jobs',
			\ 'background': 1,
			\ 'build_dir': '',
			\ 'callback': 1,
			\ 'continuous': 1,
			\ 'executable': 'latexmk',
			\ 'options': [
			\ '-verbose',
			\ '-file-line-error',
			\ '-synctex=1',
			\ '-halt-on-error',
			\ '-interaction=nonstopmode',
			\ '-shell-escape',
			\ ],
			\ }
			"\   "-auxdir=tmp",
let g:vimtex_compiler_latexmk_engines = {
			\ '_': '-lualatex',
			\ 'pdflatex': '-pdf',
			\ 'dvipdfex': '-pdfdvi',
			\ 'lualatex': '-lualatex',
			\ 'xelatex': '-xelatex',
			\ 'context (pdftex)': '-pdf -pdflatex=texexec',
			\ 'context (luatex)': '-pdf -pdflatex=context',
			\ 'context (xetex)': '-pdf -pdflatex=''texexec --xtx''',
			\ }
" 3}}} lervag/vimtex "
" vimwiki/vimwiki {{{3 "
let g:vimwiki_use_mouse = 1
let g:vimwiki_valid_html_tags = 'a,img,b,i,s,u,sub,sup,br,hr,div,del,code,red,center,left,right,h1,h2,h3,h4,h5,h6,pre,script,style'
let g:blog = {}
let g:blog.path = $GITHUBWORKSPACE . '/' . $USER . '/' . $USER . 'github.io'
let g:blog.path_html = $GITHUBWORKSPACE . '/' . $USER . '/' . $USER . 'github.io' . '/_site'
let g:blog.template_path = $GITHUBWORKSPACE . '/' . $USER . '/' . $USER . 'github.io' . '/_layouts'
let g:vimwiki_list = [g:blog]
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
" 3}}} vim-pandoc/vim-pandoc "
" vim-pandoc/vim-pandoc-after {{{3 "
let g:pandoc#after#modules#enabled = ['ultisnips']
" 3}}} vim-pandoc/vim-pandoc-after "
" szymonmaszke/vimpyter {{{3 "
let s:vimpyter_data = $VIMDATA.'/.vimpyter'
if !isdirectory(s:vimpyter_data)
	call mkdir(s:vimpyter_data, 'p')
endif
let g:vimpyter_view_directory = s:vimpyter_data
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
let s:dbext_vim_config = $VIMCONFIG.'/.dbext'
if !isdirectory(s:dbext_vim_config)
	call mkdir(s:dbext_vim_config, 'p')
endif
let g:dbext_default_user = readfile(s:dbext_vim_config.'/'.g:dbext_default_type.'.txt')[0]
let g:dbext_default_passwd = readfile(s:dbext_vim_config.'/'.g:dbext_default_type.'.txt')[1]
let g:dbext_default_history_file = s:dbext_vim_config.'/dbext_sql_history.txt'
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
let g:pymode_indent = 0
let g:pymode_folding = 1
let g:pymode_rope = 1
if g:pymode_rope
	let g:pymode_rope_lookup_project = 1
	"let g:pymode_rope_show_doc_bind = '<LocalLeader>d'
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
endif
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
let s:vim_hdl_config = $VIMCONFIG.'/.vim-hdl'
if !isdirectory(s:vim_hdl_config)
	call mkdir(s:vim_hdl_config, 'p')
endif
let g:vimhdl_conf_file = s:vim_hdl_config.'/.hdl_checker.config'
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
"  {{{3 "
tnoremap <C-w> <C-w>.
tnoremap <C-\> <C-w><C-\>
tnoremap <S-Esc> <C-w>
nnoremap <S-Esc> <C-w>
tnoremap <C-Esc> <C-w>N
tnoremap <S-Esc>m <C-w>:vnew<CR>
tnoremap <S-Esc><Tab> <C-w>:tabnew<CR>
tnoremap <M-0> <Esc>0
tnoremap <M-1> <Esc>1
tnoremap <M-2> <Esc>2
tnoremap <M-3> <Esc>3
tnoremap <M-4> <Esc>4
tnoremap <M-5> <Esc>5
tnoremap <M-6> <Esc>6
tnoremap <M-7> <Esc>7
tnoremap <M-8> <Esc>8
tnoremap <M-9> <Esc>9
tnoremap <M-a> <Esc>a
tnoremap <M-b> <Esc>b
tnoremap <M-c> <Esc>c
tnoremap <M-d> <Esc>d
tnoremap <M-e> <Esc>e
tnoremap <M-f> <Esc>f
tnoremap <M-g> <Esc>g
tnoremap <M-h> <Esc>h
tnoremap <M-i> <Esc>i
tnoremap <M-j> <Esc>j
tnoremap <M-k> <Esc>k
tnoremap <M-l> <Esc>l
tnoremap <M-m> <Esc>m
tnoremap <M-n> <Esc>n
tnoremap <M-o> <Esc>o
tnoremap <M-p> <Esc>p
tnoremap <M-q> <Esc>q
tnoremap <M-r> <Esc>r
tnoremap <M-s> <Esc>s
tnoremap <M-t> <Esc>t
tnoremap <M-u> <Esc>u
tnoremap <M-v> <Esc>v
tnoremap <M-w> <Esc>w
tnoremap <M-x> <Esc>x
tnoremap <M-y> <Esc>y
tnoremap <M-z> <Esc>z
tnoremap <M-S-1> <Esc>!
tnoremap <M-S-2> <Esc>@
tnoremap <M-S-3> <Esc>#
tnoremap <M-S-4> <Esc>$
tnoremap <M-S-5> <Esc>%
tnoremap <M-S-6> <Esc>^
tnoremap <M-S-7> <Esc>&
tnoremap <M-S-8> <Esc>*
tnoremap <M-S-9> <Esc>(
tnoremap <M-S-0> <Esc>)
tnoremap <M-S-a> <Esc>A
tnoremap <M-S-b> <Esc>B
tnoremap <M-S-c> <Esc>C
tnoremap <M-S-d> <Esc>D
tnoremap <M-S-e> <Esc>E
tnoremap <M-S-f> <Esc>F
tnoremap <M-S-g> <Esc>G
tnoremap <M-S-h> <Esc>H
tnoremap <M-S-i> <Esc>I
tnoremap <M-S-j> <Esc>J
tnoremap <M-S-k> <Esc>K
tnoremap <M-S-l> <Esc>L
tnoremap <M-S-m> <Esc>M
tnoremap <M-S-n> <Esc>N
tnoremap <M-S-o> <Esc>O
tnoremap <M-S-p> <Esc>P
tnoremap <M-S-q> <Esc>Q
tnoremap <M-S-r> <Esc>R
tnoremap <M-S-s> <Esc>S
tnoremap <M-S-t> <Esc>T
tnoremap <M-S-u> <Esc>U
tnoremap <M-S-v> <Esc>V
tnoremap <M-S-w> <Esc>W
tnoremap <M-S-x> <Esc>X
tnoremap <M-S-y> <Esc>Y
tnoremap <M-S-z> <Esc>Z
" 3}}}  "
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
			\ }
nnoremap <Leader>hh :Deol -split=horizontal<CR>
nnoremap <Leader>hH :Deol<CR>
nnoremap <Leader>ho :Deol -split=horizontal octave<CR><C-l>
nnoremap <Leader>hg :Deol -split=horizontal gdb<CR>
nnoremap <Leader>hp :Deol -split=horizontal python<CR>
nnoremap <Leader>hj :Deol -split=horizontal node<CR>
nnoremap <Leader>hx :Deol -split=horizontal xelatex<CR>
nnoremap <Leader>hl :Deol -split=horizontal lualatex<CR>
nnoremap <Leader>hX :Deol -split=horizontal xetex<CR>
nnoremap <Leader>hL :Deol -split=horizontal luatex<CR>
nnoremap <Leader>hn :Deol -split=horizontal nethack<CR>
" 3}}} Shougo/deol.nvim "
" 2}}} Terminal "

" Tool {{{2 "
" itchyny/calendar.vim {{{3 "
let g:calendar_cyclic_view = 1
let s:calendar_vim_data = $VIMDATA.'/.calendar.vim'
if !isdirectory(s:calendar_vim_data)
	call mkdir(s:calendar_vim_data, 'p')
endif
let g:calendar_cache_directory = s:calendar_vim_data
nnoremap <Leader>jc :Calendar -split=horizontal<CR>
nnoremap <Leader>jC :Calendar<CR>
" 3}}} itchyny/calendar.vim "
" voldikss/vim-browser-search {{{3 "
let g:browser_search_default_engine = 'baidu'
" Type <Leader>s to trig searching in normal mode
nmap g/ <Plug>SearchNormal
" Type <Leader>s to search selected text in visual mode
xmap g/ <Plug>SearchVisual
" Type <Leader>S to input the text you want to search in the cmdline
nnoremap <Leader>uu :<C-u>SearchCurrentText<CR>
xnoremap <Leader>uu :<C-u>SearchVisualText<CR>
execute 'nnoremap <Leader>uU :<C-u>Search ' . g:browser_search_default_engine . ' '
nnoremap <Leader>uo :<C-u>SearchCurrentText google<CR>
xnoremap <Leader>uo :<C-u>SearchVisualText google<CR>
nnoremap <Leader>uO :<C-u>Search google<Space>
nnoremap <Leader>ug :<C-u>SearchCurrentText github<CR>
xnoremap <Leader>ug :<C-u>SearchVisualText github<CR>
nnoremap <Leader>uG :<C-u>Search github<Space>
nnoremap <Leader>us :<C-u>SearchCurrentText stackoverflow<CR>
xnoremap <Leader>us :<C-u>SearchVisualText stackoverflow<CR>
nnoremap <Leader>uS :<C-u>Search stackoverflow<Space>
nnoremap <Leader>ui :<C-u>SearchCurrentText bing<CR>
xnoremap <Leader>ui :<C-u>SearchVisualText bing<CR>
nnoremap <Leader>uI :<C-u>Search bing<Space>
nnoremap <Leader>ud :<C-u>SearchCurrentText duckduckgo<CR>
xnoremap <Leader>ud :<C-u>SearchVisualText duckduckgo<CR>
nnoremap <Leader>uD :<C-u>Search duckduckgo<Space>
nnoremap <Leader>uw :<C-u>SearchCurrentText wikipedia<CR>
xnoremap <Leader>uw :<C-u>SearchVisualText wikipedia<CR>
nnoremap <Leader>uW :<C-u>Search wikipedia<Space>
nnoremap <Leader>uy :<C-u>SearchCurrentText youtube<CR>
xnoremap <Leader>uy :<C-u>SearchVisualText youtube<CR>
nnoremap <Leader>uY :<C-u>Search youtube<Space>
nnoremap <Leader>ub :<C-u>SearchCurrentText baidu<CR>
xnoremap <Leader>ub :<C-u>SearchVisualText baidu<CR>
nnoremap <Leader>uB :<C-u>Search baidu<Space>
" 3}}} voldikss/vim-browser-search "
" vim-scripts/utl.vim {{{3 "
let g:utl_cfg_hdl_scm_http_system = 'silent !google-chrome-stable %u'
nnoremap gx :<C-u>Utl<CR>
xnoremap gx y:Utl openLink <C-r>0<CR>
" 3}}} vim-scripts/utl.vim "
" ianding1/leetcode.vim {{{3 "
let s:leetcode_vim_config = $VIMCONFIG.'/.leetcode.vim'
if !isdirectory(s:leetcode_vim_config)
	call mkdir(s:leetcode_vim_config, 'p')
else
	let s:leetcode_vim_config_file = s:leetcode_vim_config . '/password.txt'
	if filereadable(s:leetcode_vim_config_file)
		let g:leetcode_username = readfile(s:leetcode_vim_config_file)[0]
		let g:leetcode_password = readfile(s:leetcode_vim_config_file)[1]
	endif
endif
let g:leetcode_china = 1
" 3}}} ianding1/leetcode.vim "
" 2}}} Tool "

" Social {{{2 "
if has('win32')
	" vim-scripts/vimmailr.zip {{{3 "
	let s:vimmailr_zip_config = $VIMCONFIG.'/.vimmailr'
	if !isdirectory(s:vimmailr_zip_config)
		call mkdir(s:vimmailr_zip_config, 'p')
	endif
	let $MYEMAIL = readfile(s:vimmailr_zip_config.'/myMail.txt')[0]
	let $MYEMAILSIG = s:vimmailr_zip_config.'/emailsig.txt'
	nnoremap <Leader>am :<C-u>call VimMailrQuickMessage()<CR>
	nnoremap <Leader>aM :<C-u>call VimMailrMailFile()<CR>
	" 3}}} vim-scripts/vimmailr.zip "
endif
if has('python') || has('perl') || has('ruby') || has('tcl') || executable('openssl')
	" twitvim/twitvim {{{3 "
	xnoremap <Leader>jt <Plug>TwitvimVisual
	" 3}}} twitvim/twitvim "
endif
if has('python')
	" PotHix/Vimpress {{{3 "
	if !isdirectory($HOME.'/.vim/custom')
		call mkdir($HOME.'/.vim/custom', 'p')
	endif
	" 3}}} PotHix/Vimpress "
	" qianlifeng/vbo {{{3 "
	let s:vbo_config = $VIMCONFIG.'/.vbo'
	if !isdirectory(s:vbo_config)
		call mkdir(s:vbo_config, 'p')
	endif
	let g:vbo_default_userAndPasswd = readfile(s:vbo_config.'/mySinaWeibo.txt')
	let g:vbo_sina_weibo_user = g:vbo_default_userAndPasswd[0]
	let g:vbo_sina_weibo_password = g:vbo_default_userAndPasswd[1]
	"代理设置
	"是否启用代理设置，1表示启用，0表示不启用
	let g:vbo_sina_weibo_proxy_enable = 1
	"HTTP代理地址，如果是url的形式则不需要协议方式直接写域名就行，例如：www.baidu.com
	let g:vbo_sina_weibo_proxy_http_host = 'xx.xxx.xxx.xxx'
	"HTTP代理端口
	let g:vbo_sina_weibo_proxy_http_port = 80
	"HTTPS代理地址
	let g:vbo_sina_weibo_proxy_https_host = 'xx.xxx.x.xxx'
	"HTTPS代理端口
	let g:vbo_sina_weibo_proxy_https_port = 80
	" 3}}} qianlifeng/vbo "
	" vim-scripts/weibo.vim {{{3 "
	let s:weibo_vim_config = $VIMCONFIG.'/.weibo.vim'
	if !isdirectory(s:weibo_vim_config)
		call mkdir(s:weibo_vim_config, 'p')
	endif
	let g:weibo_access_token = readfile(s:weibo_vim_config.'/myQQWeibo.txt')
	xnoremap <Leader>aa "ty:AddT <C-R>t
	nnoremap <Leader>aa :AddT
	" 3}}} vim-scripts/weibo.vim "
endif
" 2}}} Social "

" Cypher {{{2 "
"  {{{3 "
if exists('&cryptmethod')
	set cryptmethod=blowfish2
endif
" 3}}}  "
" retorillo/md5.vim {{{3 "
" Calculate MD5 hash for current line
nnoremap <Leader>qq o<C-r><C-o>=execute('MD5Line')<CR><Esc>kdd
" Calculate MD5 hash for string
nnoremap <Leader>qQ o<C-r><C-o>=execute('MD5String ')<Left><Left><Left>
" Calculate MD5 hash for file
nnoremap <Leader>qf :<C-u>MD5File %<CR>
nnoremap <Leader>qF :<C-u>MD5File<Space>
" 3}}} retorillo/md5.vim "
" vim-scripts/sha1.vim {{{3 "
nnoremap <Leader>qs o<C-r><C-o>=sha1#sha1(getline(line('.')))<CR><Esc>
nnoremap <Leader>qS o<C-r><C-o>=sha1#sha1()<Left>
" 3}}} vim-scripts/sha1.vim "
" 2}}} Cypher "

" Game {{{2 "
" johngrib/vim-game-code-break {{{3 "
nnoremap <Leader>yc :<C-u>VimGameCodeBreak<CR>
" 3}}} johngrib/vim-game-code-break "
" johngrib/vim-game-snake {{{3 "
nnoremap <Leader>ys :<C-u>VimGameSnake<CR>
" 3}}} johngrib/vim-game-snake "
" deris/vim-duzzle {{{3 "
nnoremap <Leader>yd :<C-u>DuzzleStart<CR>
augroup init_duzzle "{{{
	autocmd!
	autocmd SourcePre duzzle.vim language message en_US
augroup END "}}}
" 3}}} deris/vim-duzzle "
" jmanoel7/vim-games {{{3 "
nnoremap <Leader>yo :<C-u>Sokoban<CR>
nnoremap <Leader>yh :<C-u>SokobanH<CR>
nnoremap <Leader>yv :<C-u>SokobanV<CR>
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
" 2}}} Game "
" 1}}} SpecialFunction "

