
## Cookie's VIM config

This is my personal VIM config, I like it very much.
The configuration is split up in multiple `.vim` files,
so everything looks nice and clean (and maybe even
modular).

It is verified to work on these systems:

- `vim` on GNU/Linux in GNOME terminal or kitty
- `vim` on Termux for Android
- `MacVIM` on MacOS


## Installation

If you want this VIM config, do this in your Terminal:

```bash
mv ~/.vim   ~/.vim__NOTSOAWESOME;
mv ~/.vimrc ~/.vimrc__NOTSOAWESOME;

git clone https://github.com/cookiengineer/dotvim ~/.vim;
ln -s ~/.vim/.vimrc ~/.vimrc;
```

Afterwards, start `vim` and execute `:ZenInstall` and `:ZenUpdate`.
Now go ahead and enjoy responsibly.


## Usage

**Fixes**

- Copy/Paste from GUI applications into Terminal
- Copy/Paste leads to auto-indented code

**Auto Commands**

- `BufWritePre` removes trailing whitespaces
- `BufWritePre` and `FileWritePre` creates non-existing folder paths
- `FileChangedRO`, `FileChangedShell`, `FileChangedShellPost` have been modified to echo the warning instead of an annoying shell


**Key Bindings / All Modes**

All key bindings are defined in [mappings.vim](./mappings.vim).

- `[F1]` opens `netrw` as sidebar
- `[F2]` turns off highlighting (`/<search>` in normal mode)
- `[F3]` formats, auto-indents and auto-lints the current buffer
- `[+]` toggles current window zoom (aka fullscreen mode)
- `[Shift] + [T]` creates a new tab
- `[Shift] + [Page Up]` opens previous tab
- `[Shift] + [Page Down]` opens next tab
- `[Ctrl] + [W], [C]` closes tab
- `[Ctrl] + [W], [G], [Arrow Key]` moves current window
- `[Ctrl] + [W], [G], [H/J/K/L]` moves current window
- `[Ctrl] + [Arrow Up]` or `[Ctrl] + [K]` moves to previous linting error.
- `[Ctrl] + [Arrow Down]` or `[Ctrl] + [J]` moves to next linting error.


**Key Bindings / Visual Mode**

- `[Ctrl] + [J / K]` moves blocks in visual mode (under cursor)
- `[g], [f]` opens file (under cursor)
- `[g], [x]` opens browser or application via `xdg-open` (under cursor)

**Templates**

The templates are defined in [templates.vim](./templates.vim)

- `,definition` inserts the [lycheejs/definition.js](./templates/lycheejs/definition.js) template
- `,index.html` inserts the [lycheejs/index.html](./templates/lycheejs/index.html) template
- `,index.js` inserts the [lycheejs/index.js](./templates/lycheejs/index.js) template


## Plugins


- [w0rp/ale](https://github.com/w0rp/ale)
- [ervandew/supertab](https://github.com/ervandew/supertab)
- [vim-airline/vim-airline](https://github.com/vim-airline/vim-airline)
- [djoshea/vim-autoread](https://github.com/djoshea/vim-autoread)
- [sgur/vim-editorconfig](https://github.com/sgur/vim-editorconfig)
- [vim-utils/vim-man](https://github.com/vim-utils/vim-man)
- [matze/vim-move](https://github.com/matze/vim-move)
- [andymass/vim-tradewinds](https://github.com/andymass/vim-tradewinds)

