
" set statusline+=%#warningmsg#

if filereadable(".eslintrc")
	let g:ale_linters = { 'javascript': [ 'eslint' ] }
endif

if filereadable(".eslintrc.yml")
	let g:ale_linters = { 'javascript': [ 'eslint' ] }
endif

if filereadable(".eslintrc.json")
	let g:ale_linters = { 'javascript': [ 'eslint' ] }
endif


let g:ale_set_quickfix = 0
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']

if filereadable("lychee.store") || filereadable("lychee.pkg")
	let g:ale_linters = { 'javascript': [ 'strainer' ] }
endif

