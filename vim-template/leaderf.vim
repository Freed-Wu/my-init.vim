let s:extension = {
			\ 'name': '%HERE%',
			\ 'help': 'navigate the ',
			\ 'manager_id': 'leaderf##managerId',
			\ 'arguments': [
			\ ]
			\ }

call g:LfRegisterPythonExtension(s:extension.name, s:extension)

