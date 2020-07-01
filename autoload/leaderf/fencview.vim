function! leaderf#fencview#source(args) abort "{{{
	return [
				\ 'latin1	8-bit.characters (ISO 8859-1)',
				\ 'koi8-r	Russian',
				\ 'koi8-u	Ukrainian',
				\ 'macroman	MacRoman (Macintosh encoding)',
				\ 'cp437	similar to iso-8859-1',
				\ 'cp737	similar to iso-8859-7',
				\ 'cp775	Baltic',
				\ 'cp850	similar to iso-8859-4',
				\ 'cp852	similar to iso-8859-1',
				\ 'cp855	similar to iso-8859-2',
				\ 'cp857	similar to iso-8859-5',
				\ 'cp860	similar to iso-8859-9',
				\ 'cp861	similar to iso-8859-1',
				\ 'cp862	similar to iso-8859-1',
				\ 'cp863	similar to iso-8859-8',
				\ 'cp865	similar to iso-8859-1',
				\ 'cp866	similar to iso-8859-5',
				\ 'cp869	similar to iso-8859-7',
				\ 'cp874	Thai',
				\ 'cp1250	Czech, Polish, etc',
				\ 'cp1251	Cyrillic',
				\ 'cp1253	Greek',
				\ 'cp1254	Turkish',
				\ 'cp1255	Hebrew',
				\ 'cp1256	Arabic',
				\ 'cp1257	Baltic',
				\ 'cp1258	Vietnamese',
				\ 'gb18030	Simplified Chinese',
				\ 'cp936	Simplified Chinese (Windows only)',
				\ 'euc-cn	Simplified Chinese (Unix only)',
				\ 'cp950	Traditional Chinese (on Unix alias for big5)',
				\ 'big5	Traditional Chinese (on Windows alias for cp950)',
				\ 'euc-tw	Traditional Chinese (Unix only)',
				\ 'cp932	Japanese (Windows only)',
				\ 'euc-jp	Japanese (Unix only)',
				\ 'sjis	Japanese (Unix only)',
				\ 'cp949	Korean (Unix and Windows)',
				\ 'euc-kr	Korean (Unix only)',
				\ 'utf-8	32 bit UTF-8 encoded Unicode (ISO/IEC 10646-1)',
				\ 'ucs-2	16 bit UCS-2 encoded Unicode (ISO/IEC 10646-1)',
				\ 'ucs-2le	like ucs-2, little endian',
				\ 'utf-16	ucs-2 extended with double-words for more characters',
				\ 'utf-16le	like utf-16, little endian',
				\ 'ucs-4	32 bit UCS-4 encoded Unicode (ISO/IEC 10646-1)',
				\ 'ucs-4le	like ucs-4, little endian',
				\ ]
endfunction "}}}

function! leaderf#fencview#accept(line, args) abort "{{{
	if exists(':FencManualEncoding') != 2
		echohl WarningMsg
		echo 'Please install fencview.vim firstly!'
		echohl None
	else
		execute 'FencManualEncoding ' . split(a:line, "\t")[0]
	endif
endfunction "}}}

" execute 'set fileencoding=' . split(a:line, "\t")[0]
