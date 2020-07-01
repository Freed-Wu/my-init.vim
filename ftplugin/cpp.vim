call c#map#main()

if expand('%:e') ==# 'cpp'
	let b:fswitchdst = 'h,hpp'
	let b:fswitchlocs = '../inc'
elseif expand('%:e') ==# 'hpp'
	let b:fswitchdst = 'cpp'
	let b:fswitchlocs = '../src'
endif

setlocal keywordprg=:Help
if has('unix')
	setlocal makeprg=g++\ %\ -o\ %:r\ -g
elseif has('win32')
	setlocal makeprg=g++\ %\ -o\ %:r.exe\ -g
endif
