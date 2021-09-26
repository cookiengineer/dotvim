
let g:GPGPreferArmor = 1
let g:GPGDefaultRecipients = [ "cookiengineer@localhost" ]


augroup GPG
	autocmd!
	autocmd FileType gpg setlocal updatetime=120000
	autocmd CursorHold *\(gpg\|asc\|pgp\) quit
augroup END

