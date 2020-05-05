augroup filetypedetect "{{{
	" Binary {{{2 "
	autocmd BufNewFile,BufRead *.ihex setfiletype hex
	autocmd BufNewFile,BufRead *.bin,*.exe,*.com setfiletype xxd
	" 2}}} Binary "

	" Text {{{2 "
	autocmd BufNewFile,BufRead *.synctex.gz,*.synctex,*.rpt,*.fdb_latexmk,*.fls,*.blg,*.ilg,*.lock setfiletype log
	autocmd BufNewFile,BufRead build.log setfiletype less
	autocmd BufNewFile,BufRead *.cnx,*.jax,*.ptx setfiletype help
	autocmd BufNewFile,BufRead *.txt execute 'set filetype='.(expand('%:p:t') == 'doc'?'help':'txt')
	" 2}}} Text "

	" Data_Exchange {{{2 "
	autocmd BufNewFile,BufRead .mysql_history setfiletype sql
	autocmd BufNewFile,BufRead *.editorconfig,.nethackrc*,*astylerc,pip.conf,layman.conf setfiletype dosini
	autocmd BufNewFile,BufRead *.ctags,*doxyfile,zathurarc*,zathura-*,*latexmkrc setfiletype conf
	autocmd BufNewFile,BufRead *gitconfig setfiletype gitconfig
	autocmd BufNewFile,BufRead tags,tags-*,*.tags,*.tags.temp setfiletype tags
	autocmd BufNewFile,BufRead *.sublime-project,*.vsconfig,*.jscsrc,*.jshintrc,*.plan setfiletype json
	autocmd BufNewFile,BufRead *.mdl setfiletype yaml
	autocmd BufNewFile,BufRead *.opensslconf,*.qdocconf,*.eclipseproduct,*.DsnWrk,*.PrjPCB,*.PrjMbdStructure,*.PrjMbd,*.PrjMbdStructure,*.LIBPKG,*.OutJob,*.BomDoc,*.Harness,*.wspos,*.jlink,*.dni,*.pjt,*.mac,*.qws,SumatraPDF-settings.txt setfiletype toml
	autocmd BufNewFile,BufRead *.theme,*.desktop,*.cache,*.list,*.directory setfiletype desktop
	autocmd BufNewFile,BufRead *.inx,*.projectspec,*.xaml,*.pyproj,*.cof,*.stp,tesseract_opencl_profile_devices.dat setfiletype xml
	autocmd BufRead,BufNewFile *.ipynb execute substitute(expand('%:p:h'), '//', '\', 'g') == g:vimpyter_view_directory?'setfiletype json':''
	" 2}}} Data_Exchange "

	" Mark_Up {{{2 "
	autocmd BufNewFile,BufRead *.def,*.pgf,*.nlo,*.nls,*.inp,*.out,*.thm,*.eps_tex,*.pygtex,*.pygstyle,*.clo,*.aux,*.brf,*.ind,*.toc,*.lot,*.lof,*.loe,*.nav,*.vrb,*.ins,*.tikz,*.bbx,*.cbx,*.beamer setfiletype tex
	autocmd BufNewFile,BufRead *.cls set filetype=tex
	autocmd BufNewFile,BufRead *.plg,*.django setfiletype html
	autocmd BufNewFile,BufRead *.ess,*.edje setfiletype css
	autocmd BufNewFile,BufRead *.gnuplot,.gnuplot_history setfiletype gnuplot
	autocmd BufNewFile,BufRead *.snippets set filetype=snippets
	execute 'autocmd BufNewFile,BufRead =template=*,' . g:templates_directory[0] . '/* syn match vimtemplateVariable "%\%(DAY\|YEAR\|MONTH\|MONTHSHORT\|MONTHFULL\|DATE\|TIME\|FILE\|FFILE\|EXT\|MAIL\|USER\|HOST\|GUARD\|CLASS\|MACROCLASS\|CAMELCLASS\|HERE\)%" containedin=ALL'
	" 2}}} Mark_Up "

	" Script {{{2 "
	autocmd BufNewFile,BufRead .bash_history setfiletype bash
	autocmd BufNewFile,BufRead .zsh_history setfiletype zsh
	autocmd BufNewFile,BufRead .netrwhist setfiletype vim
	autocmd BufNewFile,BufRead *.nut setfiletype squirrel
	autocmd BufNewFile,BufRead *.jsfl,*.xs,*.xdc,*.bld,*.fe,*.edc,*.xtext setfiletype javascript
	autocmd BufNewFile,BufRead *.elc setfiletype lisp
	autocmd BufNewFile,BufRead *.lg4 setfiletype lingo
	autocmd BufNewFile,BufRead .octaverc,octaverc,*.m_in,*.matlab,.octave_hist setfiletype octave
	autocmd BufNewFile,BufRead *.plt setfiletype gnuplot
	autocmd BufNewFile,BufRead *.xa,*.xbn,*.xn,*.xr *.xu setfiletype rpcgen
	autocmd BufNewFile,BufRead *.qsf,*.qip setfiletype tcl
	" Script }}}2 "

	" Simulate {{{2 "
	autocmd BufNewFile,BufRead *.lib setfiletype spice
	autocmd BufNewFile,BufRead *.mif setfiletype ahdl
	autocmd BufNewFile,BufRead *.vht,*.cmp setfiletype vhdl
	autocmd BufNewFile,BufRead *.vl,*.vlg,*.verilog,*.vt setfiletype verilog_systemverilog
	autocmd BufNewFile,BufRead *.cir nnoremap <buffer> <LocalLeader>ft :setfiletype toml<CR>
				\| nnoremap <buffer> <LocalLeader>fs :setfiletype spice<CR>
	" 2}}} Simulate "

	" Compile {{{2 "
	autocmd BufNewFile,BufRead *.icf,*.acg,*.68k,*.56k,*.isl setfiletype asm
	autocmd BufNewFile,BufRead *.gel,*.yfx,*.qdoc,*.c.noindent,*.cc.noindent,*.rh,*.ver,*.cilk,*.gui setfiletype c
	" 2}}} Compile "
augroup END "}}}

