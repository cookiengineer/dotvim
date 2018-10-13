
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

if has('termguicolors')
	set termguicolors
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
Plugin 'w0rp/ale'
Plugin 'ervandew/supertab'
Plugin 'djoshea/vim-autoread'
Plugin 'sgur/vim-editorconfig'
Plugin 'itchyny/lightline.vim'
Plugin 'vim-utils/vim-man'
Plugin 'matze/vim-move'
Plugin 'andymass/vim-tradewinds'

