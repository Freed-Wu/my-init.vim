let b:clean = [
			\ '*.PrjPCBStructure', '*.PrjMbdStructure', '*.LIBPKG',
			\ '*.Dat', '"Status', 'Report.Txt"', '*.drc', '*.html',
			\ '*.Annotation', 'History', '__Preview', 'Project',
			\ 'Logs', 'for', '[A-Za-z_0-9]*'
			\ ]

setlocal indentexpr=GetGitconfigIndent()

