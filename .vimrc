
if &compatible | set nocompatible | endif


exe 'source' '~/.vim/settings.vim'
exe 'source' '~/.vim/mappings.vim'
exe 'source' '~/.vim/syntaxes.vim'
exe 'source' '~/.vim/templates.vim'


for file in split(globpath('~/.vim', 'settings.*.vim'), '\n')
	exe 'source' file
endfor

exe 'source' '~/.vim/autocmds.vim'



" NeoVIM support

if has('nvim')

	let $NVIM_TUI_ENABLE_TRUE_COLOR=1
	let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
	set viminfo+=n~/.vim/nviminfo

else

	set viminfo+=n~/.vim/viminfo

endif



" UXTerm, XTerm, Kitty, Mosh all have varying color support

if $TERM == "xterm-kitty"

	set t_Co=256

	if has('termguicolors')
		set termguicolors
	endif

elseif $TERM == "xterm-256color"

	set t_Co=256
	set notermguicolors

elseif $TERM == "xterm"

	set t_Co=256
	set notermguicolors

endif



" (Modern) Clipboard Copy/Paste support

if has('unnamedplus')
	set clipboard=unnamed,unnamedplus
endif



" (Legacy) Terminal Copy/Paste support

let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"

inoremap <special> <expr> <Esc>[200~ TerminalPasteBegin()

function! TerminalPasteBegin()
	set pastetoggle=<Esc>[201~
	set paste
	return ""
endfunction



" Plugins

call zen#init()
Plugin 'https://github.com/w0rp/ale'
Plugin 'https://github.com/ervandew/supertab'
Plugin 'https://github.com/djoshea/vim-autoread'
Plugin 'https://github.com/sgur/vim-editorconfig'
Plugin 'https://github.com/itchyny/lightline.vim'
Plugin 'https://github.com/jamessan/vim-gnupg'
Plugin 'https://github.com/vim-utils/vim-man'
Plugin 'https://github.com/matze/vim-move'
Plugin 'https://github.com/andymass/vim-tradewinds'

