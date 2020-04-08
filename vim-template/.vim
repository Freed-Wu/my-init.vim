if exists('g:loaded_%FILE%') || &cp
  finish
endif
let g:loaded_%FILE% = 1

let s:save_cpo = &cpo
set cpo&vim

%HERE%

let &cpo = s:save_cpo
unlet s:save_cpo

