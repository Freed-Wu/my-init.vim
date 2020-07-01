augroup filetypedetect "{{{
	" Binary {{{2 "
	autocmd BufNewFile,BufRead *.ihex setfiletype hex
	" 2}}} Binary "

	" Text {{{2 "
	autocmd BufNewFile,BufRead *.synctex.gz,*.synctex,*.rpt,*.fdb_latexmk,*.fls,*.blg,*.ilg,*.lock setfiletype log
	autocmd BufNewFile,BufRead build.log setfiletype less
	autocmd BufNewFile,BufRead *.cnx setfiletype help_cn
	autocmd BufNewFile,BufRead *.jax setfiletype help_ja
	autocmd BufNewFile,BufRead *.ptx setfiletype help_pt
	autocmd BufNewFile,BufRead *.txt execute expand('%:p:h:t') ==# 'doc' ? "set filetype=help" : matchstr(getline(1), '\S') ># 'Z' ? 'set filetype=txt' : ''
	execute 'autocmd BufNewFile,BufRead *.' . expand('$HOST') . ' setfiletype mail'
	" 2}}} Text "

	" Data_Exchange {{{2 "
	autocmd BufNewFile,BufRead *.conf setfiletype conf
	autocmd BufNewFile,BufRead *gitignore,*.snippet setfiletype gitignore
	autocmd BufNewFile,BufRead *.db setfiletype sql
	autocmd BufNewFile,BufRead .mysql_history setfiletype mysql
	autocmd BufNewFile,BufRead *.editorconfig,.nethackrc*,*astylerc,pip.conf,layman.conf,qt-settings,*.trashinfo,lang.dat,*.nmconnection setfiletype dosini
	autocmd BufNewFile,BufRead *.ctags,*doxyfile,zathurarc*,zathura-*,*latexmkrc,wpa_supplicant*.conf setfiletype conf
	autocmd BufNewFile,BufRead *gitconfig setfiletype gitconfig
	autocmd BufNewFile,BufRead tags,tags-*,*.tags,*.tags.temp setfiletype tags
	autocmd BufNewFile,BufRead *.sublime-project,*.vsconfig,*.jscsrc,*.jshintrc,*.plan,*.ccls,*.sublime-workspace setfiletype json
	autocmd BufNewFile,BufRead *.mdl,*.clang-format setfiletype yaml
	autocmd BufNewFile,BufRead *.opensslconf,*.qdocconf,*.eclipseproduct,*.DsnWrk,*.PrjPCB,*.PrjMbdStructure,*.PrjMbd,*.PrjMbdStructure,*.LIBPKG,*.OutJob,*.BomDoc,*.Harness,*.wspos,*.jlink,*.dni,*.pjt,*.mac,*.qws,SumatraPDF-settings.txt,getmailrc,khard.conf setfiletype toml
	autocmd BufNewFile,BufRead *.theme,*.desktop,*.cache,*.list,*.directory setfiletype desktop
	autocmd BufNewFile,BufRead *.inx,*.projectspec,*.xaml,*.pyproj,*.cof,*.stp,tesseract_opencl_profile_devices.dat setfiletype xml
	" 2}}} Data_Exchange "

	" Mark_Up {{{2 "
	autocmd BufNewFile,BufRead *.def,*.pgf,*.nlo,*.nls,*.inp,*.out,*.thm,*.eps_tex,*.pygtex,*.pygstyle,*.clo,*.aux,*.brf,*.ind,*.toc,*.lot,*.lof,*.loe,*.nav,*.vrb,*.ins,*.tikz,*.bbx,*.cbx,*.beamer setfiletype tex
	autocmd BufNewFile,BufRead *.cls set filetype=tex
	autocmd BufNewFile,BufRead *.plg,*.django setfiletype html
	autocmd BufNewFile,BufRead *.ess,*.edje setfiletype css
	autocmd BufNewFile,BufRead *.gnuplot,.gnuplot_history setfiletype gnuplot
	autocmd BufNewFile,BufRead *.snippets set filetype=snippets
	" 2}}} Mark_Up "

	" Script {{{2 "
	autocmd BufNewFile,BufRead * execute expand('%:p:h:t') ==# 'R' ? 'setfiletype r' : ''
	autocmd BufNewFile,BufRead .bash_history setfiletype bash
	autocmd BufNewFile,BufRead .zsh_history,*.zsh-theme,*.gentoo-config setfiletype zsh
	autocmd BufNewFile,BufRead .netrwhist setfiletype vim
	autocmd BufNewFile,BufRead *.nut setfiletype squirrel
	autocmd BufNewFile,BufRead *.jsfl,*.xs,*.xdc,*.bld,*.fe,*.edc,*.xtext setfiletype javascript
	autocmd BufNewFile,BufRead *.elc,*.eld,persp-auto-save*,.spacemacs,places,recentf,savehist,*.stamp,Cask setfiletype lisp
	autocmd BufNewFile,BufRead cache execute expand('%:p:h:t') ==# 'quelpa' ? 'setfiletype lisp' : ''
	autocmd BufNewFile,BufRead *.lg4 setfiletype lingo
	autocmd BufNewFile,BufRead .octaverc,octaverc,*.m_in,*.matlab,.octave_hist setfiletype octave
	autocmd BufNewFile,BufRead *.plt setfiletype gnuplot
	autocmd BufNewFile,BufRead *.xa,*.xbn,*.xn,*.xr *.xu setfiletype rpcgen
	autocmd BufNewFile,BufRead *.qsf,*.qip setfiletype tcl
	" Script }}}2 "

	" Simulate {{{2 "
	autocmd BufNewFile,BufRead *.lib,*.net,*.cir set filetype=spice
	autocmd BufNewFile,BufRead *.mif setfiletype ahdl
	autocmd BufNewFile,BufRead *.vht,*.cmp setfiletype vhdl
	autocmd BufNewFile,BufRead *.vl,*.vlg,*.vt setfiletype verilog
	" 2}}} Simulate "

	" Compile {{{2 "
	autocmd BufNewFile,BufRead config execute expand('%:p:h:t') ==# '.cabal'  ? 'setfiletype haskell' :
				\ expand('%:p:h:t') ==# '.git' ? 'setfiletype gitconfig' :
				\ expand('%:p:h:t') ==# 'khal' ? 'setfiletype toml' : ''
	autocmd BufNewFile,BufRead *.icf,*.acg,*.68k,*.56k,*.isl setfiletype asm
	autocmd BufNewFile,BufRead *.asm execute matchstr(getline(1), '\S')  ==# '*' ? 'set filetype=asmc54xx' : ''
	autocmd BufNewFile,BufRead *.gel,*.yfx,*.qdoc,*.c.noindent,*.cc.noindent,*.rh,*.ver,*.cilk,*.gui setfiletype c
	" 2}}} Compile "
augroup END "}}}

