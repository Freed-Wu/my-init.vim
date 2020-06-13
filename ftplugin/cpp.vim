call c#map#main()

if expand('%:e') ==# 'cpp'
	let b:fswitchdst = 'h,hpp'
	let b:fswitchlocs = '../inc'
elseif expand('%:e') ==# 'hpp'
	let b:fswitchdst = 'cpp'
	let b:fswitchlocs = '../src'
endif

setlocal makeprg=clang\ %\ -o\ %<.exe

nnoremap <buffer><silent> <LocalLeader>ra :call C_MakeArguments()<CR>
nnoremap <buffer><silent> <LocalLeader>rc :call C_ChooseMakefile()<CR>
nnoremap <buffer> <silent> <LocalLeader>j i<C-R>=C_JumpCtrlJ()<CR>
inoremap <buffer> <silent> <LocalLeader>j <C-R>=C_JumpCtrlJ()<CR>

