" Binary {{{1 "
autocmd BufNewFile,BufRead *.ihex setfiletype hex
autocmd BufNewFile,BufRead *.bin,*.exe,*.com setfiletype xxd
" 1}}} Binary "

" Text {{{1 "
autocmd BufNewFile,BufRead *.synctex.gz,*.synctex,*.rpt,*.fdb_latexmk,*.fls,*.blg,*.ilg,*.lock setfiletype log
autocmd BufNewFile,BufRead *.cnx,*.jax,*.ptx setfiletype help
autocmd BufNewFile,BufRead README,LICENSE setfiletype txt
autocmd BufNewFile,BufRead *.txt execute 'set filetype='.(expand('%:p:t') == 'doc'?'help':'txt')
" 1}}} Text "

" Data_Exchange {{{1 "
autocmd BufNewFile,BufRead =template=.editor setfiletype dosini
autocmd BufNewFile,BufRead tags,tags-*,*.tags,*.tags.temp setfiletype tags
autocmd BufNewFile,BufRead *astylerc,.gitignore,*.ctags,*doxyfile setfiletype conf
autocmd BufNewFile,BufRead *.sublime-project,*.vsconfig,*.jscsrc,*.jshintrc,*.plan setfiletype json
autocmd BufNewFile,BufRead *.mdl setfiletype yaml
autocmd BufNewFile,BufRead *.opensslconf,*.qdocconf,*.eclipseproduct,*.DsnWrk,*.PrjPCB,*.PrjMbdStructure,*.PrjMbd,*.PrjMbdStructure,*.LIBPKG,*.OutJob,*.BomDoc,*.Harness,*.wspos,*.jlink,*.dni,*.pjt,*.mac,*.qws,SumatraPDF-settings.txt setfiletype toml
autocmd BufNewFile,BufRead *.theme,*.desktop,*.cache,*.list,*.directory setfiletype desktop
autocmd BufNewFile,BufRead *.inx,*.projectspec,*.xaml,*.pyproj,*.cof,*.stp setfiletype xml
autocmd BufRead,BufNewFile *.ipynb execute substitute(expand('%:p:h'), '//', '\', 'g') == g:vimpyter_view_directory?'setfiletype json':''
autocmd BufNewFile,BufRead .nethackrc.template set filetype=conf
autocmd BufNewFile,BufRead *gitconfig setfiletype gitconfig
" 1}}} Data_Exchange "

" Mark_Up {{{1 "
autocmd BufNewFile,BufRead *.def,*.pgf setfiletype plaintex
autocmd BufNewFile,BufRead *.out,*.thm,*.eps_tex,*.pygtex,*.pygstyle,*.clo,*.aux,*.brf,*.ind,*.toc,*.lot,*.lof,*.loe,*.nav,*.vrb,*.ins,*.tikz,*.bbx,*.cbx setfiletype tex
autocmd BufNewFile,BufRead *.plg,*.django setfiletype html
autocmd BufNewFile,BufRead *.ess,*.edje setfiletype css
autocmd BufNewFile,BufRead *.mtx setfiletype mtx
autocmd BufNewFile,BufRead *.gnuplot setfiletype gnuplot
autocmd BufNewFile,BufRead *.snippets set filetype=snippets
" 1}}} Mark_Up "

" Script {{{1
autocmd BufNewFile,BufRead .netrwhist setfiletype vim
autocmd BufNewFile,BufRead *.nut setfiletype squirrel
autocmd BufNewFile,BufRead *.jsfl,*.xs,*.xdc,*.bld,*.fe,*.edc,*.xtext setfiletype javascript
autocmd BufNewFile,BufRead *.elc setfiletype lisp
autocmd BufNewFile,BufRead *.lg4 setfiletype lingo
autocmd BufNewFile,BufRead .octaverc,octaverc,*.m_in,*.matlab setfiletype octave
autocmd BufNewFile,BufRead *.xa,*.xbn,*.xn,*.xr *.xu setfiletype rpcgen
autocmd BufNewFile,BufRead *.qsf,*.qip setfiletype tcl
" Script }}}1

" Simulate {{{1 "
autocmd BufNewFile,BufRead *.lib setfiletype spice
autocmd BufNewFile,BufRead *.mif setfiletype ahdl
autocmd BufNewFile,BufRead *.vht,*.cmp setfiletype vhdl
autocmd BufNewFile,BufRead *.vl,*.vlg,*.verilog,*.vt setfiletype verilog_systemverilog
autocmd BufNewFile,BufRead *.cir nnoremap <buffer> <LocalLeader>ft :setfiletype toml<CR>
			\| nnoremap <buffer> <LocalLeader>fs :setfiletype spice<CR>
" 1}}} Simulate "

" Compile {{{1 "
autocmd BufNewFile,BufRead *.asm setfiletype masm
autocmd BufNewFile,BufRead *.nasm setfiletype nasm
autocmd BufNewFile,BufRead *.icf,*.acg,*.68k,*.56k,*.isl setfiletype asm
autocmd BufNewFile,BufRead *.gel,*.yfx,*.qdoc,*.c.noindent,*.cc.noindent,*.rh,*.ver,*.cilk,*.gui setfiletype c
" 1}}} Compile "

