let g:quickui_color_schemes = map(glob($GITHUBWORKSPACE . '/skywind3000/vim-quickui/colors/quickui/*.vim', 0, 1), {_, v -> fnamemodify(v, ':t:r')})

function! init#quickui#main() "{{{
	let g:quickui_color_scheme = g:quickui_color_schemes[localtime() % len(g:quickui_color_schemes)]
	call QuickThemeChange(g:quickui_color_scheme)
	let g:quickui_show_tip = 1
	call quickui#menu#reset()
	call quickui#menu#install('&File', map([
				\ ['&File', 'Leaderf file'],
				\ ['&Buffer', 'Leaderf buffer'],
				\ ['&Type', 'Leaderf filetype'],
				\ ['&MRU', 'Leaderf mru'],
				\ ['Fileencoding &view', 'Leaderf fencview'],
				\ ['F&unction', 'Leaderf function'],
				\ ['Ke&ymaps', 'Leaderf keymaps'],
				\ ['--', ''],
				\ ['&Switch', 'FSHere'],
				\ ['&Delete', 'Delete'],
				\ ['Chow&n', 'Chown ' . $USER . ':' . $USER . ' %'],
				\ ['E&xtern Open', 'call pandoc#hypertext#OpenSystem(expand("%"))'],
				\ ] , {_, v -> v + [get(v, 1)]}))
	call quickui#menu#install('&Edit', map([
				\ ['&Neoformat', 'Neoformat'],
				\ ['&Trail fix', 'TrailGuide fix'],
				\ ['&Checkpath', 'checkpath'],
				\ ['--', ''],
				\ ['&Draw', 'DIstart'],
				\ ['&Sketch', 'call ToggleSketch()'],
				\ ['--', ''],
				\ ['Ht&ml', 'TOhtml'],
				\ ] , {_, v -> v + [get(v, 1)]}))
	call quickui#menu#install('&View', map([
				\ ['&Vista', 'Vista'],
				\ ['&Undotree', 'UndotreeToggle | UndotreeFocus'],
				\ ['E&xplore', 'ToggleDefxVista'],
				\ ['&Calendar', 'Calendar -split=horizontal'],
				\ ['--', ''],
				\ ['&Filetype', 'execute "split $XDG_CONFIG_HOME/nvim/ftplugin/" . split(&filetype, ''\.'')[0] . ".vim"'],
				\ ] , {_, v -> v + [get(v, 1)]}))
	call quickui#menu#install('&Git', map([
				\ ['&Git', 'G'],
				\ ['&View', 'Agit'],
				\ ['View &file', 'AgitFile'],
				\ ['L&og', 'Gclog!'],
				\ ['&Clone', 'execute "AsyncRun git clone" @+|copen'],
				\ ['&Submodule', 'execute "AsyncRun git submodule add" @+|copen'],
				\ ['Sv&n', 'execute "AsyncRun svn checkout" substitute(@+, "tree/master", "trunk", "g")|copen'],
				\ ['--', ''],
				\ ['Iss&ues', 'Gissues'],
				\ ['A&dd an issue', 'Giadd'],
				\ ['Mil&estones', 'Gmiles'],
				\ ['--', ''],
				\ ['&Dashboard', 'GHDashboard'],
				\ ['&Activity', 'GHActivity'],
				\ ['S&tars', 'Leaderf stars'],
				\ ] , {_, v -> v + [get(v, 1)]}))
	call quickui#menu#install('&Quickfix', map([
				\ ['&Quickfix', 'copen'],
				\ ['L&ocation', 'lopen'],
				\ ['As&yncRun', 'execute "AsyncRun" &makeprg|execute &makeprg[0] ==# ":" ? "copen" : ""'],
				\ ['--', ''],
				\ ['&Todo', 'TODO'],
				\ ['&Message', 'Message'],
				\ ['Scri&ptnames', 'Scriptnames'],
				\ ] , {_, v -> v + [get(v, 1)]}))
	call quickui#menu#install('E&xplore', map([
				\ ['E&xplore', 'execute "Defx" fnameescape(split(expand("%:p:h"), "://")[-1])'],
				\ ['C&WD', 'Defx'],
				\ ['--', ''],
				\ ['&Downloads', 'Defx ~/Downloads'],
				\ ['D&ocuments', 'Defx ~/Documents'],
				\ ['D&esktop', 'Defx ~/Desktop'],
				\ ['P&ictures', 'Defx ~/Pictures'],
				\ ['&Trash', 'Defx ~/.local/share/Trash/files'],
				\ ['--', ''],
				\ ['&QQ', 'Defx ' . glob('~/Downloads/qq-files/*/file_recv')],
				\ ['&Portage', 'Defx /etc/portage/package.use'],
				\ ['Li&b', 'Defx /var/lib/layman'],
				\ ['&Github', 'Defx ' . $GITHUBWORKSPACE . '/' . system('git config --global user.name')],
				\ ['Coc.&nvim', 'Defx ' . $XDG_CONFIG_HOME . '/coc/extensions/node_modules'],
				\ ['L&aTex', 'Defx ~/.texlive/texmf-var/tex/latex'],
				\ ['&Fonts', 'Defx ~/.local/share/fonts'],
				\ ['--', ''],
				\ ['Vim &config', 'Defx ' . $XDG_CONFIG_HOME . '/nvim'],
				\ ['&Vim data', 'Defx ' . $XDG_DATA_HOME . '/nvim'],
				\ ['--', ''],
				\ ['&UDISK', 'Defx /run/media/' . $USER],
				\ ['&Mount', 'Defx /mnt'],
				\ ] , {_, v -> v + [get(v, 1)]}))
	call quickui#menu#install('&Snippet', map([
				\ ['&Snippet', 'CocCommand snippets.editSnippets'],
				\ ['S&nippets', 'CocCommand snippets.openSnippetFiles'],
				\ ['&Template', 'TemplateHere'],
				\ ['&Gitignore', 'CocList gitignore'],
				\ ['--', ''],
				\ ['Stu&b', 'Leaderf license'],
				\ ['L&ic', 'DoxLic'],
				\ ['&Author', 'DoxAuthor'],
				\ ['&Dox', 'Dox'],
				\ ] , {_, v -> v + [get(v, 1)]}))
	call quickui#menu#install('&Increase', map([
				\ ['&Increase', 'I'],
				\ ['&Alpha', 'IA'],
				\ ['&Binary', 'IB'],
				\ ['&Octal', 'IO'],
				\ ['He&x', 'IX'],
				\ ['--', ''],
				\ ['Da&ta', 'ID'],
				\ ['M&onth', 'IM'],
				\ ['&Data-month-year', 'IDMY'],
				\ ['&Month-data-year', 'IMDY'],
				\ ['&Year-month-data', 'IYMD'],
				\ ] , {_, v -> v + [get(v, 1)]}))
	call quickui#menu#install('&Z-fold', map([
				\ ['&Z-fold Last pattern', 'Fl'],
				\ ['&Word', 'Fw'],
				\ ['&Find search', 'Fs'],
				\ ['&Spell', 'FS'],
				\ ['&Context', 'Fc'],
				\ ['Ex&pression', 'Fp'],
				\ ['&Increment', 'Fi'],
				\ ['&Decrement', 'Fd'],
				\ ['--', ''],
				\ ['&End', 'Fe'],
				\ ['--', ''],
				\ ['&AnyFoldActivate', 'AnyFoldActivate'],
				\ ] , {_, v -> v + [get(v, 1)]}))
	call quickui#menu#install('&UI', map([
				\ ['&UI config', 'echo init#getui#main()'],
				\ ['&Options', 'Leaderf options'],
				\ ['--', ''],
				\ ['&Colorscheme', 'Leaderf colorscheme'],
				\ ['&Thematic', 'Leaderf thematic'],
				\ ['Thematic&Random', 'ThematicRandom'],
				\ ['&Quickui theme', 'Leaderf quickui_themes'],
				\ ] , {_, v -> v + [get(v, 1)]}))
	call quickui#menu#install('&Plugins', map([
				\ ['&Update', 'SPUpdate'],
				\ ['&Install', 'SPInstall'],
				\ ['--', ''],
				\ ['Clea&n', 'Dein clean'],
				\ ['&Recache', 'Dein recache_runtimepath'],
				\ ['&Checkhealth', 'checkhealth'],
				\ ['--', ''],
				\ ['Coc &plugin', 'CocList'],
				\ ['C&ocUpdate', 'CocUpdate'],
				\ ['--', ''],
				\ ['&Find', 'Leaderf self'],
				\ ['H&elp', 'Leaderf help'],
				\ ] , {_, v -> v + [get(v, 1)]}))
	call quickui#menu#install('Pla&y', map([
				\ ['&Breakout', 'VimGameCodeBreak'],
				\ ['&Snake', 'VimGameSnake'],
				\ ['&2048', 'NewGame2048'],
				\ ['Pu&zzle', 'Leaderf duzzle'],
				\ ['S&okoban', 'Leaderf sokoban'],
				\ ['&Mario', 'Mario'],
				\ ['&Puyo', 'Puyo'],
				\ ['K&ill', 'KillKillKill'],
				\ ['--', ''],
				\ ['&Easy', 'SudokuEasy'],
				\ ['Medi&um', 'SudokuMedium'],
				\ ['Har&d', 'SudokuHard'],
				\ ['&VeryHard', 'SudokuVeryHard'],
				\ ['--', ''],
				\ ['Bad&Apple', has('gui_running') ? 'ZBadApple' : 'BadApple'],
				\ ['&Splash', 'Leaderf splash'],
				\ ['&Calibre', 'Leaderf calibre'],
				\ ] , {_, v -> v + [get(v, 1)]}))
endfunction "}}}
