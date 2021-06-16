let b:fswitchdst = expand('%:e:e:r')

if expand('%') =~# 'xls'
	setlocal makeprg=:ExcelView\ %
elseif expand('%') =~# 'jar'
	setlocal makeprg=java\ -jar\ %
else
	setlocal makeprg=7z\ x\ %
endif

