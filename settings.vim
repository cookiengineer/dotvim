
" Color Schemes
colorscheme cookie
" colorscheme luna
syntax enable


" File Settings
set autoread
set path+=**
set wildmode=longest,list
set wildmenu


" Core Settings
set noea
set equalalways
set gdefault
set nolazyredraw
set number


" Backup Settings
set nobackup
set nowritebackup
set noswapfile
set undolevels=128


" Core Settings
set mouse=nvich
set nowrap
set wrapscan
set magic
set showmatch
set hlsearch
set incsearch
set ignorecase smartcase
set enc=utf-8
set nofoldenable
set virtualedit=all
set hidden


" Cursor
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"


" Smart Cursor
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline
autocmd BufWinEnter * setlocal cursorline
autocmd BufWinLeave * setlocal nocursorline


" Smart Tab
set switchbuf=usetab
set smarttab
set shiftwidth=4
set tabstop=4
set softtabstop=4
set backspace=eol,start,indent


" Smart Indent
filetype plugin indent on
set smartindent
" set autoindent


" Invisible Characters
set listchars=tab:\|\ ,trail:~
set list

