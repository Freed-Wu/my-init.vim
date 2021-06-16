setlocal makeprg=pandoc\ -o\ %:r.pdf\ --latex-engine=lualatex\ %
setlocal colorcolumn=
setlocal nofoldenable
setlocal formatexpr=bucky#md#format()
setlocal expandtab
setlocal textwidth=0
setlocal noautoindent
setlocal nolinebreak

call cn#map#main()
