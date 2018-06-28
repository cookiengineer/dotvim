
let g:airline#extensions#whitespace#enabled = 0
let g:airline_powerline_fonts = 1

let g:airline_left_sep = '▶'
let g:airline_right_sep = '◀'

let g:airline_theme_patch_func = "CustomAirlineThemeSymbols"

function! CustomAirlineThemeSymbols(palette)
	let g:airline_symbols.linenr = '¶'
	let g:airline_symbols.branch = '⎇'
	let g:airline_symbols.paste = '∥'
	let g:airline_symbols.whitespace = 'Ξ'
endfunction

setlocal statusline=%{pathshorten(expand('%:f'))}

