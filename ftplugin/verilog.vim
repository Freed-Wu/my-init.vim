if expand('%:e') ==# 'vt'
	let b:fswitchdst = 'v'
	let b:fswitchlocs = '../src'
elseif expand('%:e') ==# 'v'
	let b:fswitchdst = 'vt'
	let b:fswitchlocs = '../testbench'
endif

let b:clean = ['*.vvp']

setlocal makeprg=iverilog\ -o\ %<.vo\ %<.vt\|\ vvp\ %<.vo

