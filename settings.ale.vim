
" set statusline+=%#warningmsg#

let g:ale_linters = { 'go': [ 'gofmt' ], 'javascript': [ 'eslint' ] }

" if filereadable(".eslintrc")
" 	let g:ale_linters = { 'go': [ 'gofmt' ], 'javascript': [ 'eslint' ] }
" endif
"
" if filereadable(".eslintrc.yml")
" 	let g:ale_linters = { 'go': [ 'gofmt' ], 'javascript': [ 'eslint' ] }
" endif
"
" if filereadable(".eslintrc.json")
" 	let g:ale_linters = { 'go': [ 'gofmt' ], 'javascript': [ 'eslint' ] }
" endif


let g:ale_set_quickfix = 0
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']


nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
nmap <silent> <C-Up> <Plug>(ale_previous_wrap)
nmap <silent> <C-Down> <Plug>(ale_next_wrap)

