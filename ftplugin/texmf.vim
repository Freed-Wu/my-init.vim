let b:fswitchdst = 'cnf'

if expand('%:p:h:t') !=# 'web2c'
	setlocal nomodifiable
	setlocal readonly
	if has('unix')
		let b:fswitchlocs = '~/.texlive/texmf-config'
	else
		let b:fswitchlocs = '..'
	endif
else
	if has('unix')
		let b:fswitchlocs = '/etc/texmf/web2c'
	else
		let b:fswitchlocs = 'web2c'
	endif
endif

setlocal makeprg=fmtutil-sys\ -all

