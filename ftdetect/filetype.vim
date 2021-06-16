augroup init_filetypedetect "{{{
	if exists('##TermEnter')
		autocmd TermEnter * setfiletype floaterm
	endif
	autocmd BufNewFile,BufRead {github.com,www.cnblogs.com,www.jianshu.com}_*.txt setfiletype pandoc
	autocmd BufNewFile,BufRead www.bitahub.com_*.txt setfiletype sh
	autocmd BufNewFile,BufRead forums.gentoo.org_*.txt setfiletype bbcode
	autocmd BufNewFile,BufRead newsboat-article.* setfiletype mail
	execute 'autocmd BufNewFile,BufRead *.' . expand('$HOST') 'setfiletype mail'

	" Binary {{{2 "
	autocmd BufNewFile,BufRead *.ihex setfiletype hex
	" 2}}} Binary "

	" Text {{{2 "
	autocmd BufNewFile,BufRead aria2.session setfiletype text
	autocmd BufNewFile,BufRead *.{synctex,rpt,fdb_latexmk,fls,blg,ilg,lock} setfiletype log
	autocmd BufNewFile,BufRead build.log setfiletype less
	autocmd BufNewFile,BufRead *.txt execute matchstr(getline(1), '\S') ># 'Z' ? 'setfiletype txt' : ''
	autocmd BufNewFile,BufRead */doc/*.txt setfiletype help
	" 2}}} Text "

	" Sheet {{{2 "
	autocmd BufNewFile,BufRead *.dat setfiletype csv_whitespace
	" 2}}} Sheet "

	" Data_Exchange {{{2 "
	autocmd BufNewFile,BufRead *.conf setfiletype conf
	autocmd BufNewFile,BufRead *tmux.conf* set filetype=tmux
	autocmd BufNewFile,BufRead *{gitignore,.snippet} setfiletype gitignore
	autocmd BufNewFile,BufRead .mysql_history setfiletype mysql
	autocmd BufNewFile,BufRead pip.conf,layman.conf,qt-settings,lang.dat,.nethackrc*,*astylerc,*.{editorconfig,trashinfo,nmconnection} setfiletype dosini
	autocmd BufNewFile,BufRead zathura-*,zathurarc*,wpa_supplicant*.conf,*{.ctags,doxyfile,latexmkrc} setfiletype conf
	autocmd BufNewFile,BufRead *gitconfig setfiletype gitconfig
	autocmd BufNewFile,BufRead tags,tags-*,*.{tags,tags.temp} setfiletype tags
	autocmd BufNewFile,BufRead *.{sublime-project,vsconfig,jscsrc,jshintrc,plan,ccls,sublime-workspace,css.map} setfiletype json
	autocmd BufNewFile,BufRead *.{mdl,clang-format} setfiletype yaml
	autocmd BufNewFile,BufRead SumatraPDF-settings.txt,getmailrc,khard.conf,*.{opensslconf,qdocconf,eclipseproduct,DsnWrk,PrjPCB,PrjMbdStructure,PrjMbd,PrjMbdStructure,LIBPKG,OutJob,BomDoc,Harness,wspos,jlink,dni,pjt,mac,qws} setfiletype toml
	autocmd BufNewFile,BufRead *.{theme,desktop,cache,list,directory} setfiletype desktop
	autocmd BufNewFile,BufRead tesseract_opencl_profile_devices.dat,*.{inx,projectspec,xaml,pyproj,cof,stp} setfiletype xml
	" 2}}} Data_Exchange "

	" Mark_Up {{{2 "
	autocmd BufNewFile,BufRead *.markdown.in setfiletype pandoc
	autocmd BufNewFile,BufRead *.{def,pgf,nlo,nls,inp,out,thm,eps_tex,pygtex,pygstyle,clo,aux,brf,ind,toc,lot,lof,loe,nav,vrb,ins,tikz,bbx,cbx,beamer} setfiletype tex
	autocmd BufNewFile,BufRead *.cls set filetype=tex
	autocmd BufNewFile,BufRead *.{plg,django} setfiletype html
	autocmd BufNewFile,BufRead */_layouts/*.html setfiletype liquid
	autocmd BufNewFile,BufRead *.{ess,edje} setfiletype css
	autocmd BufNewFile,BufRead *.snippets setfiletype snippets
	" 2}}} Mark_Up "

	" Script {{{2 "
	autocmd BufNewFile,BufRead .xprofile,~/bin/termux-* setfiletype sh
	autocmd BufNewFile,BufRead .bash_history setfiletype bash
	autocmd BufNewFile,BufRead .zsh_history,*.{zsh-theme,gentoo-config} setfiletype zsh
	autocmd BufNewFile,BufRead .netrwhist setfiletype vim
	autocmd BufNewFile,BufRead *.nut setfiletype squirrel
	autocmd BufNewFile,BufRead *.{jsfl,xs,xdc,bld,fe,edc,xtext} setfiletype javascript
	autocmd BufNewFile,BufRead persp-auto-save*,.spacemacs,places,recentf,savehist,Cask,*.{stamp,elc,eld} setfiletype lisp
	autocmd BufNewFile,BufRead  */quelpa/cache setfiletype lisp
	autocmd BufNewFile,BufRead *.lg4 setfiletype lingo
	autocmd BufNewFile,BufRead */R/* setfiletype r
	autocmd BufNewFile,BufRead .octaverc,octaverc,.octave_hist,*.{m_in,matlab} setfiletype octave
	autocmd BufNewFile,BufRead *.{gnuplot,plt},.gnuplot_history setfiletype gnuplot
	autocmd BufNewFile,BufRead *.{xa,xbn,xn,xr,xu} setfiletype rpcgen
	autocmd BufNewFile,BufRead *.{qsf,qip} setfiletype tcl
	" Script }}}2 "

	" Simulate {{{2 "
	autocmd BufNewFile,BufRead *.{lib,net,cir} set filetype=spice
	autocmd BufNewFile,BufRead *.mif setfiletype ahdl
	autocmd BufNewFile,BufRead *.{vht,cmp} setfiletype vhdl
	autocmd BufNewFile,BufRead *.{vl,vlg,vt} setfiletype verilog
	" 2}}} Simulate "

	" Compile {{{2 "
	autocmd BufNewFile,BufRead */.cabal/config setfiletype haskell
	autocmd BufNewFile,BufRead */.git/config setfiletype gitconfig
	autocmd BufNewFile,BufRead */khal/config setfiletype toml
	autocmd BufNewFile,BufRead *.{icf,acg,68k,56k,isl} setfiletype asm
	autocmd BufNewFile,BufRead *.asm execute matchstr(getline(1), '\S')  ==# '*' ? 'set filetype=asmc54xx' : ''
	autocmd BufNewFile,BufRead *.{gel,yfx,qdoc,c.noindent,cc.noindent,rh,ver,cilk,gui} setfiletype c
	" 2}}} Compile "
augroup END "}}}
