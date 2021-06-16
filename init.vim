" Plugin {{{1 "
"  {{{2 "
"  {{{3 "
scriptencoding utf-8
set runtimepath=$VIMRUNTIME,$GITHUBWORKSPACE/Shougo/dein.vim
set belloff=
set modelines=2
set fileencodings=ucs-bom,utf-8,default,cp936,latin1
set printexpr=system(join(['ps2pdf']\ +\ [v:fname_in])).\ delete(v:fname_in)+\ v:shell_error
set undofile
set confirm
set autowrite
set sessionoptions="blank,buffers,globals,localoptions,tabpages,sesdir,folds,help,options,resize,winpos,winsize"
set diffopt+=vertical
set spelllang=en_us,cjk
set formatoptions+=rnlmB
set linebreak
set colorcolumn=+1
set nojoinspaces
set wrapscan
set ignorecase
set hlsearch
set showmatch
set foldmethod=syntax
set showcmd
set scrolloff=3
set virtualedit=block
set whichwrap+=h,l,<,>,~,[,]
set mouse=a
set fillchars=vert:\|,fold:…
set listchars=extends:→,precedes:←,nbsp:+
set relativenumber
set number
set cursorline
set cursorcolumn
set lazyredraw
set shortmess+=I
set conceallevel=2
set termguicolors
set makeencoding=char
set wildcharm=<Tab>
set keymap=pinyin
set iminsert=0
let &textwidth = (&columns - 1)/2 - &numberwidth - 3
if expand('$OSTYPE') !=# 'linux-android'
	set wildignorecase
	set clipboard=unnamed,unnamedplus
endif
if exists('&inccommand')
	set inccommand=nosplit
endif
if executable('rg')
	set grepprg=rg\ -nri
endif
let $GITHUBWORKSPACE = $HOME . '/.vim/repos/github.com'
let $XDG_CONFIG_HOME = $HOME . '/.config'
let $XDG_DATA_HOME = $HOME . '/.local/share'
let $XDG_CACHE_HOME = $HOME . '/.cache'
if !has('nvim')
	let $MYVIMRC = $XDG_CONFIG_HOME . '/nvim/init.vim'
	set nocompatible
	set encoding=utf-8
	set undodir=$XDG_DATA_HOME/nvim/undo
	set directory=$XDG_DATA_HOME/nvim/swap
endif
if has('gui_running')
	set guioptions=gtaAPd
	augroup init_titlestring "{{{
		autocmd!
		autocmd Filetype * let &titlestring = '%<%F ' . get(g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols, &filetype, '') . '%=%PΞ%l/%L'
	augroup END "}}}
	if has('win32')
		simalt ~x
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
let g:dein#install_log_filename = $XDG_CACHE_HOME . '/nvim/dein.vim/dein.log'
if !isdirectory($GITHUBWORKSPACE . '/Shougo/dein.vim')
	if executable('git')
		!git clone https://github.com/Shougo/dein.vim $GITHUBWORKSPACE/Shougo/dein.vim
	else
		finish
	endif
endif
if dein#load_state(fnamemodify($GITHUBWORKSPACE, ':p:h:h:h'))
	call dein#begin(fnamemodify($GITHUBWORKSPACE, ':p:h:h:h'))

	" Plugin {{{4 "
	" PluginManage {{{5 "
	call dein#add('Shougo/dein.vim')
	call dein#add('haya14busa/dein-command.vim')
	call dein#add('wsdjeg/dein-ui.vim')
	call dein#add('neoclide/coc.nvim', {
				\ 'if': executable('node'),
				\ 'build': 'yarn install --frozen-lockfile',
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
	call dein#add('thinca/vim-themis')
	call dein#add('vim-jp/vital.vim')
	call dein#add('lambdalisue/vital-Whisky')
	" 5}}} PluginDetect "
	" 4}}} Plugin "

	" Default {{{4 "
	"  {{{5 "
	call dein#add('tpope/vim-sensible')
	call dein#add('tpope/vim-obsession')
	call dein#add($XDG_CONFIG_HOME . '/nvim', {
				\ 'frozen': 1,
				\ })
	" 5}}}  "

	" Encoding {{{5 "
	call dein#add('Freed-Wu/vim-fencview', {
				\ 'if': has('iconv'),
				\ })
	" 5}}} Encoding "

	" Help {{{5 "
	call dein#add('yianwillis/vimcdoc')
	call dein#add('vim-jp/vimdoc-ja', {
				\ 'if': expand('$LANG')[0:1] ==# 'ja',
				\ })
	" 5}}} Help "

	" Log {{{5 "
	call dein#add('wakatime/vim-wakatime', {
				\ 'on_event': 'BufWrite',
				\ })
	call dein#add('https://gitlab.com/code-stats/code-stats-vim', {
				\ 'on_event': 'BufWrite',
				\ })
	" 5}}} Log "
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
				\ 'if': has('pythonx'),
				\ 'on_func': 'QuickThemeChange',
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
	call dein#add('Freed-Wu/lessmap.vim')
	call dein#add('tpope/vim-rsi', {
				\ 'hook_post_source': join([
				\ 'cnoremap <C-y> <C-r>+',
				\ ], "\n"),
				\ })
	call dein#add('jonhiggs/vim-readline', {
				\ 'on_event': 'InsertEnter',
				\ 'hook_post_source': join([
				\ 'inoremap <M-c> <C-o>~<C-o>gue<S-Right>',
				\ 'inoremap <C-k> <C-o>:set virtualedit +=onemore<CR><C-o>d$<C-o>:set virtualedit -=onemore<CR>',
				\ 'iunmap <C-u>',
				\ 'inoremap <expr> <C-D> col(".")>strlen(getline("."))?"\<Lt>C-D>":"\<Lt>Del>"',
				\ 'cnoremap <expr> <C-F> getcmdpos()>strlen(getcmdline())?&cedit:"\<Lt>Right>"',
				\ ], "\n"),
				\ })
	" 5}}} Hotkey "

	" KeyMap {{{5 "
	call dein#add('vim-scripts/VimIM', {
				\ 'on_func': ['Vimim_chinese', 'Vimim_gi', 'Vimim_search'],
				\ 'on_cmd': 'ViMiM',
				\ })
	call dein#add('lyokha/vim-xkbswitch', {
				\ 'if': (!empty($XDG_SESSION_DESKTOP) && $XDG_SESSION_DESKTOP != 'deepin') || has('mac') || has('win32'),
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
	call dein#add('dracula/vim')
	call dein#add('rakr/vim-one')
	call dein#add('joshdick/onedark.vim')
	call dein#add('jacoborus/tender.vim')
	call dein#add('jaredgorski/SpaceCamp')
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
	call dein#add('RRethy/vim-hexokinase', {
				\ 'if': !executable('go'),
				\ 'build': 'make hexokinase',
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
	call dein#add('Soares/trailguide.vim')
	call dein#add('Soares/longline.vim')
	call dein#add('sakshamgupta05/vim-todo-highlight')
	call dein#add('dominikduda/vim_current_word')
	" 5}}} Highlight "

	" Conceal {{{5 "
	call dein#add('ryanoasis/vim-devicons')
	call dein#add('lambdalisue/glyph-palette.vim')
	call dein#add('KeitaNakamura/tex-conceal.vim', {
				\ 'on_ft': ['tex', 'plaintex', 'context', 'markdown', 'pandoc'],
				\ })
	call dein#add('Yggdroot/indentLine')
	call dein#add('powerman/vim-plugin-AnsiEsc')
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
	call dein#add('lambdalisue/battery.vim')
	call dein#add('lambdalisue/wifi.vim')
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
				\ })
	call dein#add('Freed-Wu/vim-splash')
	" 5}}} Display "

	" SyntaxMarkUp {{{5 "
	call dein#add('sheerun/vim-polyglot')
	call dein#add('Winseven4lyf/vim-bbcode')
	call dein#add('calon/txt')
	call dein#add('suxpert/dongbei.vim')
	call dein#add('walkermatt/vim-mapfile')
	call dein#add('vim-pandoc/vim-pandoc-syntax', {
				\ 'on_ft': ['pandoc', 'markdown', 'rst', 'textile', 'gfimarkdown'],
				\ })
	call dein#add('vim-scripts/fountain.vim')
	call dein#add('TrustifierLabs/vim-lyx-layout')
	call dein#add('vim-scripts/tpp.vim')
	call dein#add('jwalton512/vim-blade')
	" 5}}} SyntaxMarkUp "

	" SyntaxScript {{{5 "
	call dein#add('zinit-zsh/zinit-vim-syntax')
	call dein#add('vim-scripts/lingo.vim')
	call dein#add('vim-scripts/lindo.vim')
	call dein#add('jeroenbourgois/vim-actionscript')
	call dein#add('vim-scripts/forth.vim')
	call dein#add('fasterthanlime/ooc.vim')
	call dein#add('ykanda/squirrel.vim')
	call dein#add('idling-mind/vim-ansys-help')
	call dein#add('idling-mind/vim-ansys-syntax')
	call dein#add('gentoo/gentoo-syntax', {
				\ 'on_cmd': ['NewEbuild', 'NewMetadata', 'NewGLEP', 'NewInitd'],
				\ 'on_ft': ['ebuild', 'gentoo-changelog', 'gentoo-common', 'gentoo-conf-d', 'gentoo-env-d', 'gentoo-init-d', 'gentoo-make-conf', 'gentoo-metadata', 'gentoo-mirrors', 'gentoo-package-common', 'gentoo-package-keywords', 'gentoo-package-license', 'gentoo-package-mask', 'gentoo-package-properties', 'gentoo-package-use', 'gentoo-use-desc', 'glep', 'guidexml'],
				\ })
	call dein#add('Freed-Wu/vim-nix')
	" 5}}} SyntaxScript "

	" SyntaxCompile {{{5 "
	call dein#add('jackguo380/vim-lsp-cxx-highlight', {
				\ 'on_ft': ['c', 'cpp', 'objc'],
				\ })
	call dein#add('Kocha/vim-systemc')
	call dein#add('fedorenchik/qt-support.vim')
	call dein#add('vim-scripts/asmc54xx')
	" 5}}} SyntaxCompile "

	" Fold {{{5 "
	call dein#add('dbmrq/vim-chalk', {
				\ 'on_map': ['<Plug>Chalk', '<Plug>SingleChalk'],
				\ })
	call dein#add('Konfekt/FastFold')
	call dein#add('embear/vim-foldsearch')
	call dein#add('pseewald/vim-anyfold', {
				\ 'on_cmd': 'AnyFoldActivate',
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
	call dein#add('vim-utils/vim-ruby-fold')
	call dein#add('pedrohdz/vim-yaml-folds')
	call dein#add('gberenfield/cljfold.vim', {
				\ 'on_ft': 'clojure',
				\ })
	call dein#add('sgeb/vim-diff-fold')
	call dein#add('matcatc/vim-asciidoc-folding')
	call dein#add('Freed-Wu/icalendar-fold.vim')
	" 5}}} Fold "
	" 4}}} Appearance "

	" CursorMove {{{4 "
	" TagExplore {{{5 "
	call dein#add('ludovicchabant/vim-gutentags', {
				\ 'if': executable('ctags') || executable('cscope') || executable('gtags-cscope'),
				\ })
	call dein#add('Freed-Wu/gutentags_plus', {
				\ 'on_cmd': ['GscopeFind', 'GscopeKill', 'GscopeAdd'],
				\ })
	call dein#add('liuchengxu/vista.vim')
	call dein#add('pechorin/any-jump.vim', {
				\ 'on_cmd': 'AnyJump',
				\ })
	call dein#add('dirn/TODO.vim', {
				\ 'on_cmd': 'TODO',
				\ })
	" 5}}} TagExplore "

	" MarkExplore {{{5 "
	call dein#add('kshenoy/vim-signature')
	call dein#add('MattesGroeger/vim-bookmarks')
	" 5}}} MarkExplore "

	" Move {{{5 "
	call dein#add('farmergreg/vim-lastplace')
	call dein#add('easymotion/vim-easymotion', {
				\ 'on_map': '<Plug>',
				\ 'on_source': 'incsearch-easymotion.vim',
				\ })
	call dein#add('psliwka/vim-smoothie')
	call dein#add('reedes/vim-wheel')
	call dein#add('andymass/vim-matchup', {
				\ 'on_map': {'n': ['%', 'g%', 'z%', '[%', ']%'], 'o': ['%', 'g%', 'z%', '[%', ']%', 'i%', 'a%'], 'x': ['%', 'g%', 'z%', '[%', ']%', 'i%', 'a%']},
				\ })
	call dein#add('wesQ3/vim-windowswap')
	call dein#add('tommcdo/vim-ninja-feet', {
				\ 'on_map': {'o': ['[', ']']},
				\ })
	" 5}}} Move "

	" Search {{{5 "
	call dein#add('justinmk/vim-sneak', {
				\ 'on_map': {'n': '<Plug>Sneak', 'o': '<Plug>Sneak', 'x': '<Plug>Sneak'},
				\ })
	call dein#add('osyo-manga/vim-anzu', {
				\ 'on_map': '<Plug>',
				\ })
	call dein#add('haya14busa/vim-asterisk')
	call dein#add('haya14busa/is.vim')
	call dein#add('haya14busa/incsearch.vim', {
				\ 'on_map': '<Plug>',
				\ 'on_func': 'incsearch#go',
				\ 'on_source': ['incsearch-easymotion.vim', 'incsearch-fuzzy.vim'],
				\ })
	call dein#add('haya14busa/incsearch-easymotion.vim', {
				\ 'on_map': '<Plug>',
				\ 'on_func': 'incsearch#config#easymotion#module',
				\ })
	call dein#add('haya14busa/incsearch-fuzzy.vim', {
				\ 'on_map': '<Plug>',
				\ 'on_func': 'incsearch#config#fuzzy#converter',
				\ })
	call dein#add('haya14busa/incsearch-migemo.vim')
	call dein#add('luochen1990/select-and-search', {
				\ 'on_func': 'select_and_search#get_search_pat',
				\ 'on_map': {'x': 'n'},
				\ })
	call dein#add('eugen0329/vim-esearch')
	" 5}}} Search "

	" Replace {{{5 "
	call dein#add('tpope/vim-abolish', {
				\ 'on_map': 'cr',
				\ 'on_cmd': ['Abolish', 'S'],
				\ })
	call dein#add('svermeulen/vim-subversive')
	call dein#add('lambdalisue/reword.vim')
	call dein#add('brooth/far.vim')
	call dein#add('kurkale6ka/vim-swap', {
				\ 'on_map': '<plug>SwapSwap',
				\ })
	call dein#add('JikkuJose/vim-visincr')
	call dein#add('tommcdo/vim-exchange', {
				\ 'on_map': {'n': '<Plug>(Exchange', 'x': '<Plug>(Exchange)'},
				\ })
	" 5}}} Replace "

	" Increment {{{5 "
	call dein#add('nishigori/increment-activator')
	" 5}}} Increment "
	" 4}}} CursorMove "

	" CursorVisual {{{4 "
	" Select {{{5 "
	call dein#add('mg979/vim-visual-multi', {
				\ 'on_map': '<Leader><Leader>',
				\ })
	" 5}}} Select "

	" TextObjChar {{{5 "
	call dein#add('wellle/targets.vim', {
				\ 'on_func': 'targes#e',
				\ })
	call dein#add('tommcdo/vim-express', {
				\ 'on_cmd': ['MapSubpress', 'MapExpress'],
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
	call dein#add('https://git.telemachus.me/vim-textobj-curly', {
				\ 'on_map': '<Plug>(textobj-curly-',
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
	call dein#add('christianfosli/wsl-copy', {
				\ 'if': executable('wsl'),
				\ 'on_cmd': 'Wsly',
				\ })
	call dein#add('biosugar0/vim-popyank', {
				\ 'if': !has('nvim'),
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
	call dein#add('LiquidFun/vim-comment-banners')
	" 5}}} Filter "

	" Compose {{{5 "
	call dein#add('junegunn/vim-easy-align', {
				\ 'on_map': '<Plug>(EasyAlign)',
				\ 'on_cmd': ['EasyAlign', 'LiveEasyAlign'],
				\ })
	" 5}}} Compose "

	" Format {{{5 "
	call dein#add('dbmrq/vim-bucky', {
				\ 'on_func': ['bucky#tex#format()', 'BuckyTexIndent()', 'bucky#tex#format()'],
				\ 'on_ft': ['tex', 'markdown'],
				\ })
	call dein#add('Freed-Wu/neoformat', {
				\ 'on_cmd': 'Neoformat',
				\ })
	call dein#add('kdheepak/JuliaFormatter.vim', {
				\ 'on_cmd': 'JuliaFormatter#Format',
				\ })
	call dein#add('editorconfig/editorconfig-vim', {
				\ 'on_cmd': 'EditorConfigReload',
				\ })
	call dein#add('philj56/vim-asm-indent')
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
	" 5}}} Insert "

	" Parse {{{5 "
	call dein#add('sillybun/vim-autodoc', {
				\ 'on_cmd': ['RecordParameter', 'RecordCurrentFunction'],
				\ })
	call dein#add('derekwyatt/vim-protodef', {
				\ 'on_func': 'protodef#ReturnSkeletonsFromPrototypesForCurrentBuffer',
				\ })
	" 5}}} Parse "

	" Snippet {{{5 "
	call dein#add('mattn/emmet-vim', {
				\ 'on_cmd': ['Emmet', 'EmmetInstall'],
				\ })
	call dein#add('honza/vim-snippets')
	call dein#add('aperezdc/vim-template')
	call dein#add('Freed-Wu/license-to-vim', {
				\ 'on_cmd': ['License', 'Stub'],
				\ })
	call dein#add('tkhren/vim-fake', {
				\ 'on_func': 'fake#gen',
				\ })
	" 5}}} Snippet "

	" Check {{{5 "
	call dein#add('w0rp/ale')
	call dein#add('wsdjeg/ChineseLinter.vim', {
				\ 'on_cmd': 'CheckChinese',
				\ })
	call dein#add('hotoo/pangu.vim', {
				\ 'on_cmd': 'Pangu',
				\ })
	call dein#add('dbmrq/vim-ditto', {
				\ 'on_cmd': ['ToggleDitto', 'Ditto', 'NoDitto'],
				\ })
	call dein#add('reedes/vim-wordy', {
				\ 'on_cmd': ['Wordy', 'WordyWordy', 'NoWordy', 'NextWordy', 'PrevWordy'],
				\ })
	" 5}}} Check "
	" 4}}} Edit "

	" File {{{4 "
	" FileExplore {{{5 "
	call dein#add('lambdalisue/fern.vim', {
				\ 'on_cmd': 'Fern',
				\ })
	call dein#add('roxma/nvim-yarp', {
				\ 'if': !has('nvim') && has('pythonx'),
				\ })
	call dein#add('roxma/vim-hug-neovim-rpc', {
				\ 'if': !has('nvim') && has('pythonx'),
				\ })
	call dein#add('Shougo/defx.nvim', {
				\ 'if': has('pythonx'),
				\ })
	call dein#add('Freed-Wu/defx-replace-netrw.vim', {
				\ 'if': has('pythonx'),
				\ })
	call dein#add('linjiX/vim-defx-vista', {
				\ 'if': has('pythonx'),
				\ })
	call dein#add('kristijanhusak/defx-git', {
				\ 'if': has('pythonx'),
				\ })
	call dein#add('kristijanhusak/defx-icons', {
				\ 'if': has('pythonx'),
				\ })
	" 5}}} FileExplore "

	" FuzzyMatch {{{5 "
	call dein#add('Yggdroot/LeaderF', {
				\ 'if': has('pythonx'),
				\ 'build': has('unix') ? './install.sh' : './install.bat',
				\ })
	call dein#add('Yggdroot/LeaderF-changes', {
				\ 'if': has('pythonx'),
				\ })
	call dein#add('Yggdroot/LeaderF-marks', {
				\ 'if': has('pythonx'),
				\ })
	call dein#add('xltan/LeaderF-tjump', {
				\ 'if': has('pythonx'),
				\ })
	call dein#add('tamago324/LeaderF-filer', {
				\ 'if': has('pythonx'),
				\ })
	call dein#add('tamago324/LeaderF-bookmark', {
				\ 'if': has('pythonx'),
				\ })
	call dein#add('TwIStOy/leaderf-cppinclude', {
				\ 'if': has('pythonx') && executable('fd'),
				\ 'on_event': 'VimEnter',
				\ })
	call dein#add('bennyyip/LeaderF-github-stars', {
				\ 'if': has('pythonx'),
				\ })
	call dein#add('dawsers/LeaderF-firefox', {
				\ 'if': has('pythonx'),
				\ })
	call dein#add('Freed-Wu/LeaderF-jumps', {
				\ 'if': has('pythonx'),
				\ })
	call dein#add('Freed-Wu/LeaderF-keymaps', {
				\ 'if': has('pythonx'),
				\ })
	call dein#add('Freed-Wu/LeaderF-defx_history', {
				\ 'if': has('pythonx'),
				\ })
	call dein#add('Freed-Wu/LeaderF-calibre', {
				\ 'if': has('pythonx') && executable('calibredb'),
				\ })
	call dein#add('Freed-Wu/LeaderF-options', {
				\ 'if': has('pythonx'),
				\ })
	call dein#add('Freed-Wu/LeaderF-man', {
				\ 'if': has('pythonx'),
				\ })
	call dein#add('Freed-Wu/LeaderF-digraph', {
				\ 'if': has('pythonx'),
				\ })
	call dein#add('Freed-Wu/LeaderF-locale', {
				\ 'if': has('pythonx') && has('unix'),
				\ })
	" 5}}} FuzzyMatch "

	" FileEdit {{{5 "
	call dein#add('mhinz/vim-hugefile')
	call dein#add('derekwyatt/vim-fswitch', {
				\ 'on_cmd': ['FSHere', 'FSLeft', 'FSSplitLeft', 'FSRight', 'FSSplitRight', 'FSBelow', 'FSSplitBelow', 'FSAbove', 'FSSplitAbove'],
				\ 'on_source': 'vim-protodef',
				\ })
	call dein#add('tpope/vim-eunuch', {
				\ 'on_cmd': ['Delete', 'Unlink', 'Move', 'Rename', 'Chmod', 'Mkdir', 'Cfind', 'Clocate', 'Lfind', 'Llocate', 'Wall', 'SudoWrite', 'SudoEdit'],
				\ })
	call dein#add('lambdalisue/suda.vim', {
				\ 'if': executable('sudo') && has('nvim'),
				\ })
	call dein#add('pbrisbin/vim-mkdir')
	call dein#add('will133/vim-dirdiff', {
				\ 'on_cmd': 'DirDiff',
				\ })
	call dein#add('chrisbra/vim-diff-enhanced')
	" 5}}} FileEdit "

	" Compress {{{5 "
	call dein#add('lbrayner/vim-rzip')
	call dein#add('vim-scripts/deb.vim')
	" 5}}} Compress "

	" VCS {{{5 "
	call dein#add('tpope/vim-fugitive', {
				\ 'if': executable('git'),
				\ })
	call dein#add('tpope/vim-rhubarb')
	call dein#add('tommcdo/vim-fubitive')
	call dein#add('tommcdo/vim-fugitive-blame-ext')
	call dein#add('rhysd/committia.vim')
	call dein#add('lambdalisue/gina.vim', {
				\ 'on_cmd': 'Gina',
				\ })
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
	call dein#add('mbbill/undotree')
	" 5}}} VCS "
	" 4}}} File "

	" Program {{{4 "
	" Document {{{5 "
	call dein#add('lambdalisue/vim-manpager', {
				\ 'on_cmd': 'MANPAGER',
				\ })
	call dein#add('lambdalisue/vim-pager', {
				\ 'on_cmd': 'PAGER',
				\ })
	call dein#add('HiPhish/info.vim', {
				\ 'on_cmd': 'Info',
				\ })
	call dein#add('vim-scripts/DoxygenToolkit.vim', {
				\ 'on_cmd': ['Dox', 'DoxAuthor', 'DoxBlock', 'DoxLic', 'DoxUndoc'],
				\ })
	" 5}}} Document "

	" MarkUp {{{5 "
	call dein#add('lervag/vimtex')
	call dein#add('iamcco/markdown-preview.nvim', {
				\ 'build': 'cd app && yarn install',
				\ })
	call dein#add('vim-pandoc/vim-pandoc', {
				\ 'on_ft': ['pandoc', 'markdown', 'rst', 'textile', 'gfimarkdown'],
				\ })
	call dein#add('vim-pandoc/vim-pandoc-after', {
				\ 'on_ft': ['pandoc', 'markdown', 'rst', 'textile', 'gfimarkdown'],
				\ })
	call dein#add('vimwiki/vimwiki', {
				\ 'on_ft': 'vimwiki',
				\ 'on_map': '<Leader>w',
				\ })
	call dein#add('freitass/todo.txt-vim')
	call dein#add('jceb/vim-orgmode')
	call dein#add('liuchengxu/graphviz.vim')
	call dein#add('tpope/vim-haml')
	" 5}}} MarkUp "

	" Office {{{5 "
	" call dein#add('chrisbra/csv.vim')
	call dein#add('mechatroner/rainbow_csv')
	call dein#add('mattn/excelview-vim', {
				\ 'on_cmd': 'ExcelView',
				\ })
	call dein#add('dhruvasagar/vim-table-mode', {
				\ 'on_cmd': ['TableModeToggle', 'Tableize', 'TableAddFormula'],
				\ })
	" 5}}} Office "

	" Script {{{5 "
	call dein#add('JuliaEditorSupport/julia-vim')
	" call dein#add('python-mode/python-mode', {
				"\ 'on_ft': ['python', 'snippets'],
				"\ })
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
	call dein#add('PProvost/vim-ps1')
	call dein#add('derekwyatt/vim-scala', {
				\ 'on_ft': 'scala',
				\ })
	" 5}}} Script "

	" Compile {{{5 "
	call dein#add('fatih/vim-go', {
				\ 'on_ft': 'go',
				\ })
	call dein#add('OmniSharp/omnisharp-vim', {
				\ 'on_ft': 'cs',
				\ })
	" 5}}} Compile "

	" Debug {{{5 "
	call dein#add('vim-vdebug/vdebug', {
				\ 'if': has('pythonx'),
				\ 'on_ft': ['php', 'python', 'ruby', 'perl', 'javascript', 'tcl'],
				\ })
	" 5}}} Debug "

	" Terminal {{{5 "
	call dein#add('voldikss/vim-floaterm', {
				\ 'if': has('pythonx'),
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
	call dein#add('PascalZh/vim-badapple', {
				\ 'on_cmd': 'ZBadApple',
				\ })
	call dein#add('skanehira/badapple.vim', {
				\ 'on_cmd': 'BadApple',
				\ })
	" 5}}} Music "

	" Tool {{{5 "
	call dein#add('itchyny/calendar.vim')
	call dein#add('Freed-Wu/gitdraw.vim')
	call dein#add('Freed-Wu/pdftk.vim')
	call dein#add('Freed-Wu/wgetpaste.vim')
	" 5}}} Tool "

	" Browse {{{5 "
	call dein#add('voldikss/vim-browser-search', {
				\ 'on_cmd': 'BrowserSearch',
				\ })
	call dein#add('glacambre/firenvim', {
				\ 'if': exists('##UIEnter') && expand('$OSTYPE') !=# 'linux-android',
				\ 'hook_post_update': '{_ -> firenvim#install(0)}',
				\ })
	" 5}}} Browse "

	" Fortune {{{5 "
	call dein#add('openuado/vimtips-fortune')
	call dein#add('iwataka/fortune.vim')
	call dein#add('iwataka/cowsay.vim')
	" 5}}} Fortune "

	" Tmux {{{5 "
	call dein#add('roxma/vim-tmux-clipboard')
	call dein#add('tmux-plugins/vim-tmux-focus-events', {
				\ 'if': !has('nvim'),
				\ })
	call dein#add('tmux-plugins/tmux.vim')
	" 5}}} Tmux "

	" Game {{{5 "
	call dein#add('johngrib/vim-game-code-break', {
				\ 'on_cmd': 'VimGameCodeBreak',
				\ })
	call dein#add('johngrib/vim-game-snake', {
				\ 'on_cmd': 'VimGameSnake',
				\ })
	call dein#add('Freed-Wu/vim-duzzle')
	call dein#add('Freed-Wu/vim-games', {
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
				\ 'if': has('textprop') && (has('sound') || executable('afplay') || executable('pafplay') || executable('cvlc')),
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
let g:coc_disable_startup_warning = 1
let g:coc_snippet_next = '<Tab>'
let g:coc_snippet_prev = '<S-Tab>'
" 3}}} neoclide/coc.nvim "
" 2}}} PluginManage "

" PluginDetect {{{2 "
" tpope/vim-scriptease {{{3 "
nnoremap q= :PP<CR>
xnoremap q= :PP<CR>
nmap g= <Plug>ScripteaseFilter
nmap g== <Home><Plug>ScripteaseFilter<End>
xmap g= <Plug>ScripteaseFilter
" 3}}} tpope/vim-scriptease "
" 2}}} PluginDetect "
" 1}}} Plugin "

" Default {{{1 "
" Encoding {{{2 "
" vimchina/vim-fencview {{{3 "
if has('iconv')
	let g:fencview_autodetect = 1
	let g:fencview_auto_patterns='*.txt,*.md,*.org,*.htm{l\=}'
endif
" 3}}} vimchina/vim-fencview "
" 2}}} Encoding "

" Help {{{2 "
" 2}}} Help "

" Log {{{2 "
" code-stats/code-stats-vim {{{3 "
let g:codestats_api_key = $CODESTATS_API_KEY
" 3}}} code-stats/code-stats-vim "
" 2}}} Log "
" 1}}} Default "

" Interaction {{{1 "
" UI {{{2 "
"  {{{3 "
let g:maplocalleader = ';'
" 3}}}  "
" liuchengxu/vim-which-key {{{3 "
let g:which_key_display_names = {
			\ ' ': '█',
			\ '<CR>': '↵',
			\ '<TAB>': '⇆',
			\ '<BS>': '⌫',
			\ '<DEL>': '⌦',
			\ '<Left>': '←',
			\ '<Right>': '→',
			\ '<Up>': '↑',
			\ '<Down>': '↓',
			\ }
let g:which_key_map_localleader = {
			\ 'name': 'choose a key about local map',
			\ }
nnoremap <nowait> <Leader> :<C-u>WhichKey '<Leader>'<CR>
xnoremap <nowait> <Leader> :<C-u>WhichKeyVisual '<Leader>'<CR>
nnoremap <nowait> <LocalLeader> :<C-u>WhichKey '<LocalLeader>'<CR>
xnoremap <nowait> <LocalLeader> :<C-u>WhichKeyVisual '<LocalLeader>'<CR>
nnoremap <nowait> z :<C-u>WhichKey 'z'<CR>
xnoremap <nowait> z :<C-u>WhichKeyVisual 'z'<CR>
nnoremap <nowait> Z :<C-u>WhichKey 'Z'<CR>
xnoremap <nowait> Z :<C-u>WhichKeyVisual 'Z'<CR>
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
if has('pythonx')
	let g:quickui_border_style = 3
	nnoremap <Space> :call quickui#menu#open()<CR>
	xnoremap <Space> :<C-u>call quickui#menu#open()<CR>
	nnoremap , :call quickui#context#open(g:context, {})<CR>
	xnoremap , :<C-u>call quickui#context#open(g:context_v, {})<CR>
	let g:context = [
				\ ['G&Browse', 'GBrowse'],
				\ ['S&yntax', 'execute scriptease#synnames_map(v:count)'],
				\ ['Tra&nslate', 'call coc#rpc#notify("doKeymap", ["translator-p"])'],
				\ ['Translate &Replace', 'call coc#rpc#notify("doKeymap", ["translator-r"])'],
				\ ['Pre&view', 'call quickui#tools#preview_tag(expand("<cword>"))'],
				\ ['ALEDetail&,', 'ALEDetail'],
				\ ['--', ''],
				\ ['&Pick color', 'call CocAction("pickColor")'],
				\ ['Change c&olor', 'call CocAction("colorPresentation")'],
				\ ['--', ''],
				\ ['&Assignment', 'GscopeFind a'],
				\ ['&Calling', 'GscopeFind c'],
				\ ['Calle&d', 'GscopeFind d'],
				\ ['&Egrep', 'GscopeFind e'],
				\ ['&File', 'GscopeFind f'],
				\ ['&Global definition', 'GscopeFind g'],
				\ ['&Including', 'GscopeFind i'],
				\ ['&Symbol', 'GscopeFind s'],
				\ ['&Text', 'GscopeFind t'],
				\ ]
	let g:context_v = [
				\ ['G&browse', '*Gbrowse'],
				\ ['S&yntax', 'execute scriptease#synnames_map(v:count)'],
				\ ['Tra&nslate', 'call coc#rpc#notify("doKeymap", ["translator-pv"])'],
				\ ['Translate &Replace', 'call coc#rpc#notify("doKeymap", ["translator-rv"])'],
				\ ['Pre&view', 'call quickui#tools#preview_tag(getline(".")[col("v") - 1:col("''>")])'],
				\ ['ALEDetail&,', 'ALEDetail'],
				\ ['--', ''],
				\ ['&Pick Color', 'call CocAction("pickColor")'],
				\ ['Present C&olor', 'call CocAction("colorPresentation")'],
				\ ['--', ''],
				\ ['&Assignment', 'execute "GscopeFind a" getline(".")[col("v") - 1:col("''>")]'],
				\ ['&Calling', 'execute "GscopeFind c" getline(".")[col("v") - 1:col("''>")]'],
				\ ['Calle&d', 'execute "GscopeFind d" getline(".")[col("v") - 1:col("''>")]'],
				\ ['&Egrep', 'execute "GscopeFind e" getline(".")[col("v") - 1:col("''>")]'],
				\ ['&File', 'execute "GscopeFind f" getline(".")[col("v") - 1:col("''>")]'],
				\ ['&Global definition', 'execute "GscopeFind g" getline(".")[col("v") - 1:col("''>")]'],
				\ ['&Including', 'execute "GscopeFind i" getline(".")[col("v") - 1:col("''>")]'],
				\ ['&Symbol', 'execute "GscopeFind s" getline(".")[col("v") - 1:col("''>")]'],
				\ ['&Text', 'execute "GscopeFind t" getline(".")[col("v") - 1:col("''>")]'],
				\ ]
endif
" 3}}} skywind3000/vim-quickui "
" mhinz/vim-startify {{{3 "
if executable('neofetch') && filereadable($PREFIX . '/etc/issue')
	let g:startify_custom_header = map(readfile($PREFIX . '/etc/issue'), {_, v -> substitute(v, "\x1b\[[0-9;\?]\\{-}\\a", '', 'g')})
endif
let g:startify_session_dir = $XDG_CACHE_HOME . '/nvim/vim-startify'
let g:startify_enable_special = 0
let g:startify_change_to_dir = 1
let g:startify_change_to_vcs_root = 1
let g:startify_custom_indices = map(range(0, 9), {_, v -> g:maplocalleader . v}) + map(range(0, 9), {_, v -> '.' . v})
let g:startify_bookmarks = [
			\ {g:maplocalleader . 'v': $MYVIMRC},
			\ {g:maplocalleader . 'j': $XDG_CONFIG_HOME . '/nvim/coc-settings.json'},
			\ {g:maplocalleader . 'm': $XDG_CONFIG_HOME . '/mimeapps.list'},
			\ {g:maplocalleader . 'p': '/etc/portage/make.conf'},
			\ {g:maplocalleader . 's': $HOME . '/.zshrc'},
			\ {g:maplocalleader . 'z': $HOME . '/.zprofile'},
			\ {g:maplocalleader . 'x': $HOME . '/.xprofile'},
			\ ]
let g:startify_lists = [
			\ {'type': 'sessions', 'header': [' Sessions']},
			\ {'type': 'files', 'header': [' Histories']},
			\ {'type': 'dir', 'header': [' Histories @ ' . getcwd()]},
			\ {'type': 'commands', 'header': [' Commands']},
			\ {'type': 'bookmarks', 'header': [' Bookmarks']},
			\ ]
nnoremap <C-w>E :<C-w>Startify<CR>
nnoremap <C-w>n <C-w>n:Startify<CR>
nnoremap <C-w>m :vnew<CR>:Startify<CR>
xnoremap <C-w>n <C-w>n:Startify<CR>
xnoremap <C-w>m :<C-u>vnew<CR>:Startify<CR>
nnoremap <C-w><Tab> :tabnew<CR>:Startify<CR>
xnoremap <C-w><Tab> :<C-u>tabnew<CR>:Startify<CR>
" 3}}} mhinz/vim-startify "
" 2}}} UI "

" Hotkey {{{2 "
"  {{{3 "
" noVi {{{4 "
nnoremap [O {O<Esc>o
nnoremap ]O }O<Esc>o
nnoremap S ch
nnoremap s cl
xnoremap & :&<CR>
xnoremap g& :&&<CR>
nnoremap go go
xnoremap go go
nnoremap gG :<C-u>cd %:p:h<CR>
nnoremap g<C-g> g<C-g>
xnoremap g<C-g> g<C-g>
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
xnoremap gI I
xnoremap gA A
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
nnoremap g_ g_
xnoremap g_ g_
onoremap g_ g_
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
nnoremap [S [S
nnoremap ]S ]S
xnoremap [c [c
xnoremap ]c ]c
xnoremap [C 99[c
xnoremap ]C 99]c
xnoremap [s [s
xnoremap ]s ]s
xnoremap [S [S
xnoremap ]S ]S
onoremap [c [c
onoremap ]c ]c
onoremap [C 99[c
onoremap ]C 99]c
onoremap [s [s
onoremap ]s ]s
onoremap [S [S
onoremap ]S ]S
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
nnoremap g<Tab> g<Tab>
nnoremap g[ :<C-u>tabfirst<CR>
nnoremap g> :<C-u>tablast<CR>
nnoremap g( :<C-u>tabmove +<CR>
nnoremap g) :<C-u>tabmove -<CR>
nnoremap g{ :<C-u>0tabmove<CR>
nnoremap g} :<C-u>tabmove<CR>
nnoremap <C-w>Q :<C-u>tabclose<CR>
nnoremap <C-w>O :<C-u>tabonly<CR>
nnoremap <C-w><C-F> :<C-u>tabfind <C-r><C-f><CR>
xnoremap <C-w><C-F> y:tabfind <C-r>0<CR>
" 4}}} tabMoveCursor "
" windowMoveCursor {{{4 "
nnoremap <C-w>w <C-w>w
nnoremap <C-w>W <C-w>W
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <BS> <C-w>h
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
nnoremap <C-w>: :Leaderf command<CR>
xnoremap <C-w>: :<C-u>Leaderf command<CR>
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
xnoremap <C-w>e :<C-u>enew<CR>
" 4}}} windowNew "
" tabnew {{{4 "
nnoremap <C-w>T <C-w>T
xnoremap <C-w>T <C-w>T
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
nnoremap <C-w>g} <C-w>g}
nnoremap <C-w>g] <C-w>g]
nnoremap <C-w>g<C-]> <C-w>g<C-]>
nnoremap <C-w>g} <C-w>g}
xnoremap <C-w>g] <C-w>g]
xnoremap <C-w>g<C-]> <C-w>g<C-]>
xnoremap <C-w>g} <C-w>g}
nnoremap <C-w>i <C-w>i
nnoremap <C-w>d <C-w>d
xnoremap <C-w>i <C-w>i
xnoremap <C-w>d <C-w>d
nnoremap <C-w>S :sall<CR>
nnoremap <C-w>V :vertical sall<CR>
xnoremap <C-w>S :sall<CR>
xnoremap <C-w>V :vertical sall<CR>
nnoremap <C-w>f <C-w>f
xnoremap <C-w>f <C-w>f
nnoremap <C-w>F <C-w>F
xnoremap <C-w>F <C-w>F
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
nnoremap <C-w>u :hide<CR>
xnoremap <C-w>u :<C-u>hide<CR>
nnoremap <C-w>U :unhide<CR>
xnoremap <C-w>U :<C-u>unhide<CR>
nnoremap ZZ ZZ
xnoremap ZZ ZZ
nnoremap ZQ ZQ
xnoremap ZQ ZQ
nnoremap <C-w>C :tabclose<CR>
xnoremap <C-w>C :<C-u>tabclose<CR>
nnoremap <C-w>O :tabonly<CR>
xnoremap <C-w>O :<C-u>tabonly<CR>
nnoremap <C-w>J :tabmove -<CR>
nnoremap <C-w>K :tabmove +<CR>
xnoremap <C-w>J :<C-u>tabmove -<CR>
xnoremap <C-w>K :<C-u>tabmove +<CR>
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
nnoremap zq :spellrare <C-r><C-a><CR>
nnoremap zQ :spellrare! <C-r><C-a><CR>
nnoremap zug zug
nnoremap zuG zuG
nnoremap zuw zuw
nnoremap zuW zuW
" 4}}} spell "
" fileSwitch {{{4 "
nnoremap gf gf
nnoremap gF gF
nnoremap g] g]
xnoremap gf gf
xnoremap gF gF
xnoremap g] g]
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
cnoremap <C-x><C-z> <C-k>
cnoremap <C-x><C-y> <C-y>
inoremap <C-x><C-z> <C-o>:Leaderf digraph<CR>
cnoremap <M-h> <Home>help <End><CR>
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
let g:Vimim_punctuation = 3
let g:Vimim_map = 'no-gino-tabc-space'
let g:Vimim_plugin = $XDG_CACHE_HOME . '/nvim/VimIM'
let g:Vimim_shuangpin = 'ms'
" 3}}} vim-scripts/VimIM "
" lyokha/vim-xkbswitch {{{3 "
let g:XkbSwitchNLayout = 'us'
let g:XkbSwitchEnabled = 1
let g:XkbSwitchSkipGhKeys = ['gh', 'gH', 'g<C-h>']
" 3}}} lyokha/vim-xkbswitch "
" 2}}} KeyMap "

" MacroExplore {{{2 "
" vim-scripts/marvim {{{3 "
let g:marvim_store = $XDG_CACHE_HOME . '/nvim/marvim'
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
let g:thematic#themes = {
			\ 'random' :{
			\ 'colorscheme': 'random',
			\ },
			\ 'molokai' :{
			\ 'colorscheme': 'molokai',
			\ 'airline-theme': 'molokai',
			\ },
			\ 'solarized_flood' :{
			\ 'colorscheme': 'solarized',
			\ 'airline-theme': 'solarized_flood',
			\ },
			\ 'bubblegum' :{
			\ 'colorscheme': 'bubblegum',
			\ 'airline-theme': 'bubblegum',
			\ },
			\ 'papercolor' :{
			\ 'colorscheme': 'papercolor',
			\ 'airline-theme': 'papercolor',
			\ },
			\ 'pencil' :{
			\ 'colorscheme': 'pencil',
			\ },
			\ 'darkeclipse' :{
			\ 'colorscheme': 'darkeclipse',
			\ 'airline-theme': 'dark',
			\ },
			\ 'space-vim-dark' :{
			\ 'colorscheme': 'space-vim-dark',
			\ 'airline-theme': 'dark',
			\ },
			\ 'gruvbox' :{
			\ 'colorscheme': 'gruvbox',
			\ 'airline-theme': 'badwolf',
			\ },
			\ 'dracula' :{
			\ 'colorscheme': 'dracula',
			\ 'airline-theme': 'dracula',
			\ },
			\ 'OceanicNext' :{
			\ 'colorscheme': 'OceanicNext',
			\ 'airline-theme': 'luna',
			\ },
			\ 'one' :{
			\ 'colorscheme': 'one',
			\ 'airline-theme': 'one',
			\ },
			\ 'onedark' :{
			\ 'colorscheme': 'onedark',
			\ 'airline-theme': 'onedark',
			\ },
			\ }
augroup init_ThematicRandom "{{{
	autocmd!
	autocmd VimEnter * ThematicRandom
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
" 3}}} luochen1990/rainbow "
" jaxbot/semantic-highlight.vim {{{3 "
let g:semanticPersistCacheLocation = $XDG_CACHE_HOME . '/nvim/semantic-highlight.vim/.semantic-highlight-cache'
" 3}}} jaxbot/semantic-highlight.vim "
" nathanaelkane/vim-indent-guides {{{3 "
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_default_mapping = 0
let g:indent_guides_exclude_filetypes = ['help', 'man', 'less', 'duzzle', 'startify', 'calendar', 'python', 'yaml', 'tex', 'plaintex', 'context', 'markdown', 'pandoc', 'floaterm', 'defx', 'text', 'game_engine']
" 3}}} nathanaelkane/vim-indent-guides "
" dbmrq/vim-redacted {{{3 "
nmap gz <Plug>Redact
vmap gz <Plug>Redact
" 3}}} dbmrq/vim-redacted "
" Soares/trailguide.vim {{{3 "
let g:trailguide_matchgroup = 'SpellBad'
nmap [j <Plug>trailguide#prev
nmap ]j <Plug>trailguide#next
" 3}}} Soares/trailguide.vim "
" Soares/longline.vim {{{3 "
nmap [J <Plug>longline#next
nmap ]J <Plug>longline#prev
" 3}}} Soares/longline.vim "
" dominikduda/vim_current_word {{{3 "
let g:vim_current_word#highlight_current_word = 0
" 3}}} dominikduda/vim_current_word "
" 2}}} Highlight "

" Conceal {{{2 "
" KeitaNakamura/tex-conceal.vim {{{3 "
let g:tex_conceal_frac = 1
" 3}}} KeitaNakamura/tex-conceal.vim "
" ryanoasis/vim-devicons {{{3 "
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {
			\ 'perl': '',
			\ 'zsh-theme': '',
			\ 'zsh-template': '',
			\ expand('$HOST'): '',
			\ 'sp': '',
			\ 'cir': '',
			\ 'net': '',
			\ 'commonmark': '',
			\ 'pandoc': '',
			\ 'html5': '',
			\ 'docbook': '',
			\ 'docbook5': '',
			\ 'patch': '',
			\ 'aap': '',
			\ 'tex': '',
			\ 'latex': '',
			\ 'context': '',
			\ 'beamer': '',
			\ 'inp': '',
			\ 'tikz': '',
			\ 'lyx': '',
			\ 'layout': '',
			\ 'cls': '',
			\ 'sty': '',
			\ 'mtx': '',
			\ 'bib': '',
			\ 'bst': '',
			\ 'ist': '',
			\ 'ahk': '',
			\ 'mkd': '',
			\ 'OutJob': '',
			\ 'lnk': '',
			\ 'csv': '',
			\ 'tsv': '',
			\ 'dat': '',
			\ 'table': '',
			\ 'ppt': '',
			\ 'pps': '',
			\ 'pptx': '',
			\ 'xls': '',
			\ 'xlsb': '',
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
			\ 'log': '',
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
			\ 'expect': '',
			\ 'woff': '',
			\ 'woff2': '',
			\ 'ttc': '',
			\ 'fon': '',
			\ 'ttf': '',
			\ 'otf': '',
			\ 'eot': '',
			\ 'svg': '',
			\ 'opf': '',
			\ 'brd': '',
			\ 'xml': '',
			\ 'ccxml': '',
			\ 'inx': '',
			\ 'cof': '',
			\ 'ino': '',
			\ 'cs': '',
			\ 'csproj': '',
			\ 'qml': '',
			\ 'mysql': '',
			\ 'pdf': '',
			\ 'ps': '',
			\ 'eps': '',
			\ 'bmp': '',
			\ 'png': '',
			\ 'jpg': '',
			\ 'jpeg': '',
			\ 'cmd': '',
			\ 'bat': '',
			\ 'tigervnc': '',
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
			\ 'o': '',
			\ 'obj': '',
			\ 'lib': '',
			\ 'so': '',
			\ 'dll': '',
			\ 'vb': '',
			\ 'f': '',
			\ 'pas': '',
			\ 'yml': '',
			\ 'yaml': '',
			\ 'toml': '',
			\ 'service': '',
			\ 'desktop': '',
			\ 'theme': '',
			\ 'list': '',
			\ 'directory': '',
			\ 'mp3': '',
			\ 'ogg': '',
			\ 'mp4': '',
			\ 'mpg': '',
			\ 'flv': '',
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
			\ 'crdownload': '',
			\ 'part': '',
			\ 'cache': '',
			\ 'fmt': '',
			\ 'orig': '',
			\ 'tmp': '',
			\ 'temp': '',
			\ 'pmx': '',
			\ 'pygtex': '',
			\ 'pygstyle': '',
			\ 'aux': '',
			\ 'auxlock': '',
			\ 'md5': '',
			\ 'dep': '',
			\ 'dpth': '',
			\ 'figlist': '',
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
			\ 'lol': '',
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
			\ 'gnuplot': '',
			\ 'nav': '',
			\ 'snm': '',
			\ 'vrb': '',
			\ 'listing': '',
			\ 'xdv': '',
			\ 'dvi': '',
			\ 'nsi': '',
			\ 'sublime-workspace': '',
			\ 'ipynb': '',
			\ 'gitignore': '',
			\ 'snippet': '',
			\ 'mk': '',
			\ 'opt': '',
			\ }
let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols = {
			\ '^README\.md$': '',
			\ '.*\.todo\.txt$': '',
			\ '.*\.dia\.autosave$': '',
			\ '.*\.paf\.exe$': '',
			\ '.*\.search-ms$': '',
			\ '.*\.ms14 (Security copy)$': '',
			\ '.*\.synctex(busy)$': '',
			\ 'Dockerfile$': '',
			\ '\.spacemacs': '',
			\ 'Makefile$': '',
			\ '\.octaverc$': '',
			\ '\.editorconfig$': '',
			\ '\(vim\|octave\|input\)\@<!rc$': '',
			\ '\.inputrc$': '',
			\ '\.bash_profile$': '',
			\ 'termux-': '',
			\ 'profile$': '',
			\ '\.gitignore$': '',
			\ '\.git$': '',
			\ '\.gitmodules$': '',
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
let g:indentLine_fileTypeExclude = ['calendar', 'floaterm']
let g:indentLine_concealcursor = ''
" }}} Yggdroot/indentLine "
" 2}}} Conceal "

" StatusBar {{{2 "
" bling/vim-airline {{{3 "
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols = {
			\ 'paste': '',
			\ 'notexists': 'Ɇ',
			\ 'spell': '',
			\ 'keymap': '',
			\ 'whitespace': '',
			\ }
let g:airline_mode_map = {
			\ '__'   : '-',
			\ 'c'    : ':',
			\ 'i'    : '▏',
			\ 'ic'   : '≣',
			\ 'ix'   : '=',
			\ 'n'    : '█',
			\ 'ni'   : '▌',
			\ 'no'   : '▄',
			\ 'multi': '…',
			\ 'R'    : '▁',
			\ 'Rv'   : '∿',
			\ 's'    : '→',
			\ 'S'    : '↓',
			\ ''   : '↘',
			\ 't'    : '!',
			\ 'v'    : '▶',
			\ 'V'    : '▼',
			\ ''   : '◆',
			\ }
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
let g:airline#extensions#quickfix#quickfix_text = ''
let g:airline#extensions#quickfix#location_text = ''
" 4}}} quickfix "
" vimtex {{{4 "
let g:airline#extensions#vimtex#left = ''
let g:airline#extensions#vimtex#right = ''
let g:airline#extensions#vimtex#main = ''
let g:airline#extensions#vimtex#sub_main = ''
let g:airline#extensions#vimtex#sub_local = ''
let g:airline#extensions#vimtex#compiled = '✔'
let g:airline#extensions#vimtex#continuous = ''
let g:airline#extensions#vimtex#viewer = ''
" 4}}} vimtex "
" tabline {{{4 "
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_close_button = 1
let g:airline#extensions#tabline#buffers_label = ''
let g:airline#extensions#tabline#tabs_label = ''
let g:airline#extensions#tabline#close_symbol = '⌫'
let g:airline#extensions#tabline#overflow_marker = '…'
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#buffer_idx_format = {
			\ '0': '⓪ ',
			\ '1': '① ',
			\ '2': '② ',
			\ '3': '③ ',
			\ '4': '④ ',
			\ '5': '⑤ ',
			\ '6': '⑥ ',
			\ '7': '⑦ ',
			\ '8': '⑧ ',
			\ '9': '⑨ ',
			\ }
nmap <C-w>1 <Plug>AirlineSelectTab1
nmap <C-w>2 <Plug>AirlineSelectTab2
nmap <C-w>3 <Plug>AirlineSelectTab3
nmap <C-w>4 <Plug>AirlineSelectTab4
nmap <C-w>5 <Plug>AirlineSelectTab5
nmap <C-w>6 <Plug>AirlineSelectTab6
nmap <C-w>7 <Plug>AirlineSelectTab7
nmap <C-w>8 <Plug>AirlineSelectTab8
nmap <C-w>9 <Plug>AirlineSelectTab9
nmap <C-w>0 <Plug>AirlineSelectTab0
nmap <C-w>; <Plug>AirlineSelectPrevTab
nmap <C-w>, <Plug>AirlineSelectNextTab
" 4}}} tabline "
" wordcount {{{4 "
let g:airline#extensions#wordcount#filetypes =['all']
" 4}}} wordcount "
" capslock {{{4 "
let g:airline#extensions#capslock#symbol = '🅰'
" 4}}} capslock "
" whitespace {{{4 "
let g:airline#extensions#whitespace#long_format = '…%s'
let g:airline#extensions#whitespace#trailing_format = '_%s'
let g:airline#extensions#whitespace#mixed_indent_format = '█⇆%s'
let g:airline#extensions#whitespace#mixed_indent_file_format = '█≠⇆%s'
let g:airline#extensions#whitespace#conflicts_format = '✗%s'
" 4}}} whitespace "
" vim-battery {{{4 "
let g:airline#extensions#battery#enabled = 1
" 4}}} vim-battery "
" 3}}} bling/vim-airline "
" Wildog/airline-weather.vim {{{3 "
let g:weather#appid = $WEATHER_APPID
let g:weather#area = $WEATHER_AREA
" 3}}} Wildog/airline-weather.vim "
" Zuckonit/vim-airline-todo {{{3 "
let g:todo#directory = $XDG_CACHE_HOME . '/nvim/vim-airline-todo'
let g:todo#remind = ''
let g:todo#suffix = ''
" 3}}} Zuckonit/vim-airline-todo "
" 2}}} StatusBar "

" Display {{{2 "
"  {{{3 "
augroup init_vim "{{{
	autocmd!
	autocmd VimResized * wincmd =
augroup END "}}}
" 3}}}  "

" junegunn/limelight.vim {{{3  "
augroup init_Goyo "{{{
	autocmd!
	autocmd! User GoyoEnter Limelight
	autocmd! User GoyoLeave Limelight!
augroup END "}}}
" 3}}} junegunn/limelight.vim "

" thinca/vim-splash {{{3  "
let g:splash#dirs = [$GITHUBWORKSPACE . '/Freed-Wu/asciiart/txt']
" 3}}} thinca/vim-splash "
" 2}}} Display "

" SyntaxMarkUp {{{2 "
"  {{{3 "
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
let g:c_syntax_for_h = 1
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
let g:gutentags_enabled = 0
let g:gutentags_ctags_tagfile = '.tags'
let g:gutentags_cache_dir = $XDG_CACHE_HOME . '/nvim/vim-gutentags'
let g:gutentags_modules = ['ctags', 'cscope']
let g:gutentags_exclude_project_root = ['/usr/share', '/etc', $HOME]
let g:gutentags_project_root = [
				\ '.git', '.yadm', '.hg', '.svn', '.bzr',
				\ '.darcs', '.fossil', '.cvs', '.rcs',
				\ '.accurev', '.perforce', '.tfs',
				\ '.fslckout', '_darcs', '_FOSSIL_',
				\ '.vs', '.vscode', '.idea',
				\ '.project', '.sublime-project',
				\ ]
" 3}}} ludovicchabant/vim-gutentags "
" skywind3000/gutentags_plus {{{3 "
let g:gutentags_plus_nomap = 1
" 3}}} skywind3000/gutentags_plus "
" liuchengxu/vista.vim {{{3 "
let g:vista_sidebar_width = &columns / 4
let g:vista_fold_toggle_icons = ['', '']
let g:vista_close_on_jump = 1
" 3}}} liuchengxu/vista.vim "
" pechorin/any-jump.vim {{{3 "
let g:any_jump_disable_default_keybindings = 1
" 3}}} pechorin/any-jump.vim "
" 2}}} TagExplore "

" MarkExplore {{{2 "
" kshenoy/vim-signature {{{3 "
let g:SignatureMap = {
			\ 'DeleteMark'         :  'm=',
			\ 'GotoNextLineAlpha'  :  '],',
			\ 'GotoPrevLineAlpha'  :  '[,',
			\ 'GotoNextSpotAlpha'  :  '].',
			\ 'GotoPrevSpotAlpha'  :  '[.',
			\ }
" 3}}} kshenoy/vim-signature "
" MattesGroeger/vim-bookmarks {{{3 "
let g:bookmark_auto_save_file = $XDG_DATA_HOME . '/nvim/vim-bookmarks'
let g:bookmark_no_default_key_mappings = 1
nnoremap m< :<C-u>BookmarkAnnotate<CR>
nnoremap m> :<C-u>BookmarkToggle<CR>
nnoremap [* :<C-u>BookmarkPrev<CR>
nnoremap ]* :<C-u>BookmarkNext<CR>
nnoremap m<Tab> :<C-u>BookmarkClear<CR>
nnoremap m<CR> :<C-u>BookmarkClearAll<CR>
" 3}}} MattesGroeger/vim-bookmarks "
" 2}}} MarkExplore "

" Move {{{2 "
" easymotion/vim-easymotion {{{3 "
nmap <S-Tab> <Plug>(easymotion-prefix)
xmap <S-Tab> <Plug>(easymotion-prefix)
omap <S-Tab> <Plug>(easymotion-prefix)
xmap <S-Tab>; <Plug>(easymotion-bd-f)
nmap <S-Tab>; <Plug>(easymotion-overwin-f)
xmap <S-Tab>, <Plug>(easymotion-bd-f2)
nmap <S-Tab>, <Plug>(easymotion-overwin-f2)
xmap <S-Tab><S-Tab> <Plug>(easymotion-bd-jk)
nmap <S-Tab><S-Tab> <Plug>(easymotion-overwin-line)
xmap <S-Tab><Space> <Plug>(easymotion-bd-w)
nmap <S-Tab><Space> <Plug>(easymotion-overwin-w)
" 3}}} easymotion/vim-easymotion "
" reedes/vim-wheel {{{3 "
let g:wheel#map#up = ''
let g:wheel#map#down = ''
let g:wheel#map#left = ''
let g:wheel#map#right = ''
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
let g:loaded_matchit = 1
" 3}}} andymass/vim-matchup "
" wesQ3/vim-windowswap {{{3 "
let g:windowswap_map_keys = 0
nnoremap <C-w>. :<C-u>call WindowSwap#EasyWindowSwap()<CR>
" 3}}} wesQ3/vim-windowswap "
" 2}}} Move "

" Search {{{2 "
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
let g:is#do_default_mappings = 0
nmap n <Plug>(is-nohl)<Plug>(anzu-n-with-echo)
nmap N <Plug>(is-nohl)<Plug>(anzu-N-with-echo)
xmap zn <Plug>(is-n)<Plug>(anzu-n-with-echo)
xmap zN <Plug>(is-n)<Plug>(anzu-N-with-echo)
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
" luochen1990/select-and-search {{{3 "
let g:select_and_search_active = 1
" 3}}} luochen1990/select-and-search "
" eugen0329/vim-esearch {{{3 "
let g:esearch = {'default_mappings': 0}
" 3}}} eugen0329/vim-esearch "
" 2}}} Search "

" Replace {{{2 "
" svermeulen/vim-subversive {{{3 "
nmap + <plug>(SubversiveSubstitute)
xmap p <plug>(SubversiveSubstitute)
nmap ++ <plug>(SubversiveSubstituteToEndOfLine)
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
xmap [<CR> <plug>SwapSwapPivotOperands
xmap ]<CR> <plug>SwapSwapOperands
nmap [<CR> <plug>SwapSwapWithL_WORD
nmap ]<CR> <plug>SwapSwapWithR_WORD
" 3}}} kurkale6ka/vim-swap "

" tommcdo/vim-exchange {{{3 "
nmap Q <Plug>(Exchange)
nmap QQ <Plug>(ExchangeClear)
xmap Q <Plug>(Exchange)
" 3}}} tommcdo/vim-exchange "
" 2}}} Replace "
" 1}}} CursorMove "

" CursorVisual {{{1 "
" Select {{{2 "
" mg979/vim-visual-multi {{{3 "
let g:VM_leader = '<Leader><Leader>'
let g:VM_maps = {}
let g:VM_maps['Find Under'] = g:VM_leader . '<Leader>'
let g:VM_maps['Find Subword Under'] = g:VM_leader . '<Leader>'
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
		execute 'xmap' s:key . s:target '<plug>(init-targets-' . s:key.')' . s:target
		execute 'omap' s:key . s:target '<plug>(init-targets-' . s:key.')' . s:target
	endfor
endfor
" 3}}} wellle/targets.vim "
" tommcdo/vim-express {{{3 "
let g:express_no_mappings = 0
" 3}}} tommcdo/vim-express "
" thinca/vim-textobj-between {{{3 "
let g:textobj_between_no_default_key_mappings = 1
xmap x <Plug>(textobj-between-i)
xmap X <Plug>(textobj-between-a)
omap x <Plug>(textobj-between-i)
omap X <Plug>(textobj-between-a)
" 3}}} thinca/vim-textobj-between "
" reedes/vim-textobj-quote {{{3 "
let g:textobj#quote#doubleMotion = 'jJ'
let g:textobj#quote#singleMotion = 'jj'
xmap sj <Plug>SurroundWithSingle
xmap sJ <Plug>SurroundWithDouble
" 3}}} reedes/vim-textobj-quote "
" https://git.telemachus.me/vim-textobj-curly {{{3 "
nmap ]v <Plug>(textobj-curly-double-n)
nmap [v <Plug>(textobj-curly-double-p)
nmap ]V <Plug>(textobj-curly-single-n)
nmap [V <Plug>(textobj-curly-single-p)
xmap ]v <Plug>(textobj-curly-double-n)
xmap [v <Plug>(textobj-curly-double-p)
xmap ]V <Plug>(textobj-curly-single-n)
xmap [V <Plug>(textobj-curly-single-p)
omap ]v <Plug>(textobj-curly-double-n)
omap [v <Plug>(textobj-curly-double-p)
omap ]V <Plug>(textobj-curly-single-n)
omap [V <Plug>(textobj-curly-single-p)
" 3}}} https://git.telemachus.me/vim-textobj-curly "
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
let g:textobj_clang_more_mappings = 1
" 3}}} libclang-vim/vim-textobj-clang "
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
" svermeulen/vim-yoink {{{3 "
let g:yoinkMaxItems = 100
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
" sbdchd/neoformat {{{3 "
let g:neoformat_basic_format_align = 1
let g:neoformat_basic_format_retab = 1
let g:neoformat_basic_format_trim = 1
let g:neoformat_try_formatprg = 1
" 3}}} sbdchd/neoformat "
" 2}}} Format "

" Comment {{{2 "
" scrooloose/nerdcommenter {{{3 "
let g:NERDSpaceDelims = 1
nmap gcn <Plug>NERDCommenterNested
nmap gcm <Plug>NERDCommenterMinimal
nmap gcs <Plug>NERDCommenterSexy
xmap gcs <Plug>NERDCommenterSexy
nmap gcg <Plug>NERDCommenterToEOL
xmap gcg <Plug>NERDCommenterToEOL
nmap gcx <Plug>NERDCommenterAltDelims
nmap gcy <Plug>NERDCommenterAlignLeft
nmap gcz <Plug>NERDCommenterAlignBoth
" 3}}} scrooloose/nerdcommenter "
" tyru/caw.vim {{{3 "
let g:caw_dollarpos_sp_left = '  '
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

" Snippet {{{2 "
" mattn/emmet-vim {{{3 "
let g:user_emmet_leader_key = g:maplocalleader
let g:user_emmet_install_global = 0
let g:user_emmet_mode = 'a'
let g:user_emmet_expandabbr_key = g:maplocalleader . g:maplocalleader
let g:user_emmet_expandword_key = g:maplocalleader . ','
" 3}}} mattn/emmet-vim "
" honza/vim-snippets {{{3 "
let g:snips_author = $GITHUB_USER
let g:snips_email = $EMAIL
let g:snips_github = 'https://github.com/' . $GITHUB_USER
" 3}}} honza/vim-snippets "
" aperezdc/vim-template {{{3 "
let g:templates_global_name_prefix = ''
let g:templates_directory = [$XDG_CONFIG_HOME . '/nvim/vim-template']
let g:templates_no_autocmd = 1
" 3}}} aperezdc/vim-template "
" tkhren/vim-fake {{{3 "
let g:fake_src_paths = [$XDG_CONFIG_HOME . 'vim-fake']
" 3}}} tkhren/vim-fake "
" 2}}} Snippet "

" Check {{{2 "
" w0rp/ale {{{3 "
let g:ale_linters = {
			\ 'reStructuredText': ['rstcheck'],
			\ }
let g:ale_sign_error = '✗'
let g:ale_sign_warning = ''
let g:ale_echo_msg_error_str = '✗'
let g:ale_echo_msg_warning_str = ''
let g:ale_echo_msg_format = '%linter%: %severity%! %s'
nnoremap [k :<C-u>ALEPrevious<CR>
nnoremap ]k :<C-u>ALENext<CR>
nnoremap [K :<C-u>ALEFirst<CR>
nnoremap ]K :<C-u>ALELast<CR>
" 3}}} w0rp/ale "
" dbmrq/vim-ditto {{{3 "
let g:ditto_dir = $XDG_CONFIG_HOME . '/nvim/vim-ditto'
nmap [w <Plug>DittoPrev
nmap ]w <Plug>DittoNext
nmap zy <Plug>DittoGood
nmap zuy <Plug>DittoBad
nmap [W <Plug>DittoLess
nmap ]W <Plug>DittoMore
" 3}}} dbmrq/vim-ditto "
" reedes/vim-wordy {{{3 "
nnoremap [U :PrevWordy<CR>
nnoremap ]U :NextWordy<CR>
" 3}}} reedes/vim-wordy "
" 2}}} Check "
" 1}}} Edit "

" File {{{1 "
" FileExplore {{{2 "
"  {{{3 "
let g:netrw_home = $XDG_CACHE_HOME . '/nvim/netrw'
let g:netrw_nogx = 1
let g:netrw_altfile = 1
" 3}}}  "
if has('pythonx')
	" Shougo/defx.nvim {{{3 "
	augroup init_defx "{{{
		autocmd!
		if exists('##SourcePost')
			autocmd SourcePost defx.vim call init#defx#main()
		else
			autocmd VimEnter * call init#defx#main()
		endif
	augroup END "}}}
	" 3}}} Shougo/defx.nvim "
endif
" 2}}} FileExplore "

" FuzzyMatch {{{2 "
if has('pythonx')
	" Yggdroot/LeaderF {{{3 "
	let g:Lf_StlSeparator = {
				\ 'left': '',
				\ 'right': '',
				\ }
	let g:Lf_SpinSymbols = ['🌘', '🌗', '🌖', '🌕', '🌔', '🌓', '🌒', '🌑']
	let g:Lf_RootMarkers = g:gutentags_project_root
	let g:Lf_ShortcutF = ''
	let g:Lf_ShortcutB = ''
	let s:leaderf_themes = map(glob($GITHUBWORKSPACE . '/Yggdroot/LeaderF/autoload/leaderf/colorscheme/*.vim', 0, 1), {_, v -> fnamemodify(v, ':t:r')})
	let g:Lf_StlColorscheme = get(s:leaderf_themes, localtime() % len(s:leaderf_themes), '')
	let g:Lf_DevIconsExactSymbols = g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols
	let g:Lf_DevIconsExtensionSymbols = g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols
	let g:Lf_HideHelp = 1
	let g:Lf_ShowHidden = 1
	let g:Lf_WindowPosition = 'popup'
	let g:Lf_CacheDirectory = $XDG_CACHE_HOME . '/nvim'
	let g:Lf_UseVersionControlTool = 0
	let g:Lf_WildIgnore = {
				\ 'dir': [
				\ '.git', '.yadm', '.hg', '.svn', '.bzr',
				\ '.darcs', '.fossil', '.cvs', '.rcs',
				\ '.accurev', '.perforce', '.tfs',
				\ '.fslckout', '_darcs', '_FOSSIL_',
				\ '.vs', '.vscode', '.idea',
				\ '.project', '.sublime-project',
				\ ],
				\ 'file': [
				\ '*.sw?', '~$*', '*.bak', '*.exe',
				\ '*.o', '*.so', '*.py[co]'
				\ ],
				\ }
	let g:Lf_MruWildIgnore = g:Lf_WildIgnore
	let g:Lf_CommandMap = {
				\ '<Left>': ['<C-b>', '<Left>'],
				\ '<Right>': ['<C-f>', '<Right>'],
				\ '<Home>': ['<C-a>', '<Home>'],
				\ '<End>': ['<C-e>', '<End>'],
				\ '<Up>': ['<C-p>', '<Up>'],
				\ '<Down>': ['<C-n>', '<Down>'],
				\ '<PageUp>': ['<PageUp>', '<C-g>'],
				\ '<PageDown>': ['<PageDown>', '<C-l>'],
				\ '<S-Insert>': ['<C-y>', '<S-Insert>'],
				\ '<BS>': ['<C-h>', '<BS>'],
				\ '<Del>': ['<C-d>', '<Del>'],
				\ '<C-a>': ['<C-s>'],
				\ '<C-o>': ['<Tab>'],
				\ '<Tab>': ['<C-o>'],
				\ '<C-f>': ['<C-i>'],
				\ '<C-p>': ['<C-^>'],
				\ }
	let g:Lf_NormalMap = {
				\ '_': [
				\ ['<nowait>u', '<Plug>(SmoothieUpwards)'],
				\ ['<nowait>d', '<Plug>(SmoothieDownwards)'],
				\ ['<nowait>U', '<Plug>(SmoothieBackwards)'],
				\ ['<nowait>D', '<Plug>(SmoothieForwards)'],
				\ ['<nowait><Tab>', '<Tab>'],
				\ ],
				\ 'Buffer': [
				\ ['<nowait>x', ':<C-u>execute g:Lf_py "bufExplManager.deleteBuffer(1)"<CR>'],
				\ ],
				\}
	nnoremap q: :<C-u>Leaderf cmdHistory<CR>
	nnoremap q/ :<C-u>Leaderf searchHistory<CR>
	nnoremap q? :<C-u>Leaderf command<CR>
	nnoremap <C-w>/ :<C-u>Leaderf window<CR>
	" 3}}} Yggdroot/LeaderF "
	" Yggdroot/LeaderF-changes {{{3 "
	nnoremap g: :<C-u>Leaderf changes<CR>
	" 3}}} Yggdroot/LeaderF-changes "
	" Yggdroot/LeaderF-marks {{{3 "
	nnoremap ` :<C-u>Leaderf marks<CR>
	" 3}}} Yggdroot/LeaderF-marks "
	" xltan/LeaderF-tjump {{{3 "
	nnoremap g<C-]> :<C-u>LeaderfTjump <C-r><C-w><CR>
	" 3}}} xltan/LeaderF-tjump "
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
	" tamago324/LeaderF-bookmark {{{3 "
	let g:Lf_BookmarkFilePath = $XDG_CACHE_HOME . '/nvim/LeaderF-bookmark'
	" 3}}} tamago324/LeaderF-bookmark "
	" bennyyip/LeaderF-github-stars {{{3 "
	let g:leaderf_github_stars_github_token = $GITHUB_TOKEN
	" 3}}} bennyyip/LeaderF-github-stars "
endif
" 2}}} FuzzyMatch "

" FileEdit {{{2 "
" lambdalisue/suda.vim {{{3 "
let g:suda_smart_edit = 1
" 3}}} lambdalisue/suda.vim "
" tpope/vim-eunuch {{{3 "
nnoremap <C-w>$ :Rename<Space>
" 3}}} tpope/vim-eunuch "
" chrisbra/vim-diff-enhanced {{{3 "
let &diffexpr = 'EnhancedDiff#Diff("git diff", "--diff-algorithm=patience")'
" 3}}} chrisbra/vim-diff-enhanced "
" 2}}} FileEdit "

" Compress {{{2 "
" 2}}} Compress "

" VCS {{{2 "
" junegunn/vim-github-dashboard {{{3 "
let g:github_dashboard = {
			\ 'username': $GITHUB_USER,
			\ 'password': $GITHUB_PASSWORD,
			\ }
" 3}}} junegunn/vim-github-dashboard "
" jaxbot/github-issues.vim {{{3 "
let g:github_access_token = $GITHUB_TOKEN
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
let g:undotree_HelpLine = 0
let g:undotree_CustomUndotreeCmd = 'botright vertical 30 new'
let g:undotree_CustomDiffpanelCmd = 'topleft 5 new'
let g:undotree_HighlightChangedText  = 1
let g:undotree_DiffAutoOpen = 1
let g:undotree_RelativeTimestamp = 1
let g:undotree_HighlightSyntaxAdd = 'ShowMarksHLl'
let g:undotree_HighlightSyntaxChange = 'ShowMarksHLl'
" 3}}} mbbill/undotree "
" 2}}} VCS "
" 1}}} File "

" Program {{{1 "
" Document {{{2 "
" vim-scripts/DoxygenToolkit.vim {{{3 "
let g:DoxygenToolkit_authorName = $GITHUB_USER
let g:DoxygenToolkit_versionString = 'v0.0.1'
" 3}}} vim-scripts/DoxygenToolkit.vim "
" 2}}} Document "

" MarkUp {{{2 "
" lervag/vimtex {{{3 "
let g:vimtex_delim_toggle_mod_list = [
			\ ['\bigl', '\bigr'],
			\ ['\Bigl', '\Bigr'],
			\ ['\biggl', '\biggr'],
			\ ['\Biggl', '\Biggr'],
			\]
let g:vimtex_indent_ignored_envs = [
			\ 'document', 'verbatim', 'lstlisting', 'minted',
			\ 'pygmented', 'windark', 'langPyOne',
			\ ]
let g:vimtex_mappings_disable = {
			\ 'n': ['ds$', 'cs$', 'tsc', 'tse', 'tsd', 'tsD', 'tsf', '<F7>', 'K', 'dsd', 'dse', 'dsc'],
			\ 'x': ['<F7>', 'tsd', 'tsD', 'tsf'],
			\ 'i': ['<F7>'],
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
let g:vimtex_toc_config = {
			\ 'name' : 'toc',
			\ 'show_help': 0,
			\ 'split_pos' : 'vert :rightbelow',
			\ 'hotkeys_leader': g:maplocalleader,
			\ 'hotkeys' : 'abcdefghijklmnopgrstuvwxyz',
			\ 'hotkeys_enabled' : 1,
			\ 'layer_status' : {
			\ 'content': 1,
			\ 'label': 0,
			\ 'todo': 0,
			\ 'include': 0
			\ },
			\ 'layer_keys' : {
			\ 'content': '=c',
			\ 'label': '=l',
			\ 'todo': '=t',
			\ 'include': '=i'
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
				\ . ':execute ''drop'' fnameescape(''\%f'')^<CR^>'
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
" iamcco/markdown-preview.nvim {{{3 "
let g:mkdp_auto_close = 0
let g:mkdp_browser = 'xdg-open'
let g:mkdp_command_for_global = 1
" 3}}} iamcco/markdown-preview.nvim "
" vimwiki/vimwiki {{{3 "
let g:vimwiki_valid_html_tags = 'a,img,b,i,s,u,sub,sup,br,hr,div,del,code,red,center,left,right,h1,h2,h3,h4,h5,h6,pre,script,style'
let g:vimwiki_list = [
			\ {
			\ 'path': $HOME . '/Documents/Freed-Wu.github.io',
			\ 'path_html': $HOME . '/Documents/Freed-Wu.github.io/_site',
			\ 'template_path': $HOME . '/Documents/Freed-Wu.github.io/_layouts',
			\ 'ext': 'md',
			\ },
			\ ]
" 3}}} vimwiki/vimwiki "
" vim-pandoc/vim-pandoc {{{3 "
let g:pandoc#formatting#mode = 'h'
let g:pandoc#formatting#textwidth = &textwidth
let g:pandoc#formatting#smart_autoformat_on_cursormoved = 1
let g:pandoc#completion#bib#mode = 'citeproc'
let g:pandoc#toc#position = 'bottom'
let g:pandoc#compiler#arguments = '-fmarkdown+east_asian_line_breaks'
nnoremap gx :<C-u>call pandoc#hypertext#OpenSystem()<CR>
xnoremap gx :<C-u>call pandoc#hypertext#OpenSystem(getline('.')[col('v') - 1:col('''>') - 1])<CR>
" 3}}} vim-pandoc/vim-pandoc "
" vim-pandoc/vim-pandoc-after {{{3 "
let g:pandoc#after#modules#enabled = ['fastfold']
" 3}}} vim-pandoc/vim-pandoc-after "
" 2}}} MarkUp "

" Office {{{2 "
" chrisbra/csv.vim {{{3 "
let g:csv_nomap_space = 1
let g:csv_nomap_bs = 1
" 3}}} chrisbra/csv.vim "
" dhruvasagar/vim-table-mode {{{3 "
let g:table_mode_disable_tableize_mappings = 1
" 3}}} dhruvasagar/vim-table-mode "
" 2}}} Office "

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
" 2}}} Compile "

" Debug {{{2 "
" 2}}} Debug "

" Terminal {{{2 "
" voldikss/vim-floaterm {{{3 "
if has('pythonx')
	let g:floaterm_width = 0.5
	let g:floaterm_height = 0.5
	let g:floaterm_wintype = 'vsplit'
	let g:floaterms = {
				\ 'python': 'ipython',
				\ 'julia': 'julia',
				\ 'octave': 'octave',
				\ 'gnuplot': 'gnuplot',
				\ 'r': 'R',
				\ }
	nnoremap <CR> :<C-u>execute 'FloatermSend' escape(getline('.'), '%#')<CR>j
	xnoremap <CR> y:execute 'FloatermSend' escape('<C-r>0', '%#')<CR>
	nnoremap g<CR> :<C-u>execute 'FloatermSend' escape('<C-r><C-w>', '%#')<CR>
	nnoremap <C-w>' :<C-u>CocList floaterm<CR>
	nnoremap <C-w>% :<C-u>execute 'FloatermNew' get(g:floaterms, &filetype, '')<CR>
	nnoremap <C-w>" :<C-u>execute 'FloatermNew --wintype=split' get(g:floaterms, &filetype, '')<CR>
	nnoremap <C-w>! :<C-u>execute 'FloatermNew --wintype=float' get(g:floaterms, &filetype, '')<CR>
	nnoremap <C-w>[ :<C-u>FloatermPrev<CR>
	nnoremap <C-w>] :<C-u>FloatermNext<CR>
	nnoremap <C-w><Space> :<C-u>FloatermToggle<CR>
endif
" 3}}} voldikss/vim-floaterm "
" 2}}} Terminal "
" 1}}} Program "

" SpecialFunction {{{1 "
" Tool {{{2 "
" itchyny/calendar.vim {{{3 "
let g:calendar_cyclic_view = 1
let g:calendar_cache_directory = $XDG_CACHE_HOME . '/nvim/calendar.vim'
" 3}}} itchyny/calendar.vim "
" 2}}} Tool "

" Browse {{{2 "
" voldikss/vim-browser-search {{{3 "
nmap g/ <Plug>SearchNormal
xmap g/ <Plug>SearchVisual
" 3}}} voldikss/vim-browser-search "
" glacambre/firenvim {{{3 "
if exists('##UIEnter')
	let g:firenvim_config = {
				\ 'localSettings':
				\ {'.*':
				\ {'cmdline': 'firenvim'}
				\ }
				\ }
	augroup init_firenvim "{{{
		autocmd!
		autocmd UIEnter * call init#firenvim#main()
	augroup END "}}}
endif
" 3}}} glacambre/firenvim "
" 2}}} Browse "

" Fortune {{{2 "
" openuado/vimtips-fortune {{{3 "
let g:fortune_vimtips_auto_display = 0
" 3}}} openuado/vimtips-fortune "
" 2}}} Fortune "

" Game {{{2 "
" 2}}} Game "
" 1}}} SpecialFunction "
