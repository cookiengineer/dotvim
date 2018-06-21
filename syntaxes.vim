
" Embedded Highlighting
au FileType html runtime! syntax/html5.vim
au FileType html unlet b:current_syntax
au FileType html syntax include @javascript syntax/javascript.vim
au FileType html syntax region jsCode start='<script>' keepend end='</script>' contains=@javascript

" Unofficial File Types
autocmd! BufRead,BufNewFile *.rapid setfiletype rapid

