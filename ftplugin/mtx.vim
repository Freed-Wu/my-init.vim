let b:clean = [
			\ '%<.pmx', '%<.pml',
			\ '%<.log', 'musixtex.log', 'pmxaerr.dat',
			\ ]

setlocal syntax=tex
setlocal makeprg=musixtex\ -t\ -F\ "xetex"\ %:p

