function! init#quickui#main() "{{{
	let g:quickui_show_tip = 1
	call quickui#menu#reset()
	call quickui#menu#install('&File', [
				\ [ '&New File\t<C-w>n', 'enew' ],
				\ [ '&Open File', 'browse open' ],
				\ [ '--', '' ],
				\ [ '&Save\t<C-s>', 'write'],
				\ [ 'Save &As<A-s>', 'browse saveas' ],
				\ [ '--', '' ],
				\ [ '&Close<C-w>c', 'close' ],
				\ [ 'E&xit\t<C-w>q', 'quit' ],
				\ ])
	call quickui#menu#install('&Edit', [
				\ [ '&Copy', 'echo 1', 'help 1' ],
				\ [ '&Paste', 'echo 2', 'help 2' ],
				\ [ '&Find', 'echo 3', 'help 3' ],
				\ ])
	call quickui#menu#install('&Option', [
				\ ['Set &Spell %{&spell? "Off":"On"}', 'set spell!'],
				\ ['Set &Cursor Line %{&cursorline? "Off":"On"}', 'set cursorline!'],
				\ ['Set &Paste %{&paste? "Off":"On"}', 'set paste!'],
				\ ])
	call quickui#menu#install('&Help', [
				\ ['&Cheatsheet', 'help index', ''],
				\ ['T&ips', 'help tips', ''],
				\ ['--',''],
				\ ['&Tutorial', 'help tutor', ''],
				\ ['&Quick Reference', 'help quickref', ''],
				\ ['&Summary', 'help summary', ''],
				\ ], 10000)
	call quickui#menu#install('&C/C++', [
				\ [ '&Compile', 'echo 1' ],
				\ [ '&Run', 'echo 2' ],
				\ ], '<auto>', 'c,cpp')
endfunction "}}}
