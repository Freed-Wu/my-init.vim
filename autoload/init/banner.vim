function! init#banner#main(str) "{{{
	execute 'CommentBanner --pattern '. a:str .',1,'. a:str
	.-2 center
	.-2 TrailGuide fix
endfunction "}}}

