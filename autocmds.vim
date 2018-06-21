
" Automatically strip whitespace on save
fun! <SID>AutoStripWhitespaces()

	let l = line(".")
	let c = col(".")

	%s/\s\+$//e

	" active deactive for tab crap
	"%s/\s\s\s\s/\t/ge

	call cursor(l, c)

endfun



" Automatically create directories on save
fun! <SID>AutoMakeDirectory()

	let s:directory = expand("<afile>:p:h")

	if !isdirectory(s:directory)
		call mkdir(s:directory, "p")
	endif

endfun



autocmd BufWritePre *.htm :call <SID>AutoStripWhitespaces()
autocmd BufWritePre *.html :call <SID>AutoStripWhitespaces()
autocmd BufWritePre *.js :call <SID>AutoStripWhitespaces()
autocmd BufWritePre *.sh :call <SID>AutoStripWhitespaces()
autocmd BufWritePre *.xml :call <SID>AutoStripWhitespaces()
autocmd BufWritePre,FileWritePre * :call <SID>AutoMakeDirectory()

