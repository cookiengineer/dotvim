
" NETRW settings
let g:netrw_altv = 1
let g:netrw_browse_split = 4
let g:netrw_browsex_viewer = "-"
let g:netrw_liststyle = 3
let g:netrw_mousemaps = 0
let g:netrw_winsize = 32
" let g:netrw_preview = 1

fun! NFH_html(filename)
	execute ':silent !xdg-open '.a:filename.' &> /dev/null'
endfun

fun! NFH_htm(filename)
	execute ':silent !xdg-open '.a:filename.' &> /dev/null'
endfun


" Disabled because it's confusing
" set autochdir

