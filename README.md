
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

The plugins are contained in [./plugged](./plugged) and are
statically shipped in this repository (for the sake of having
a known-to-work-failsafe history).

For details on plugins and how to update, read **Plugins**
and **Updates** respectively down below.


## Usage

### Auto Fixes

- Copy/Paste from GUI applications into Terminal
- Copy/Paste leads to auto-indented code

### Auto Commands

Auto commands are defined in [autocmds.vim](./autocmds.vim).

- `BufWritePre` removes trailing whitespaces.
- `BufWritePre` and `FileWritePre` creates non-existing parent folder paths via `mkdir -p`.
- `FileChangedRO`, `FileChangedShell`, `FileChangedShellPost` have been modified to echo the warning instead of opening an annoying shell.


### Manual Commands

- `:W` will write files with `sudo` / `root` rights.


### Normal Mode

Key Bindings that don't require a plugin are defined in [mappings.vim](./mappings.vim),
those that do are defined in the `settings.<plugin-name>.vim` file.

- `[F1]` opens `netrw` as sidebar.
- `[F2]` turns off highlighting (`/<search>` in normal mode).
- `[F3]` formats, auto-indents and auto-lints the current buffer.
- `[+]` (`[Shift] + [-]` on US keyboard) toggles current window zoom (aka fullscreen mode).
- `[p]` auto formats bad indents on paste.

**Tab Navigation**

- `[Ctrl] + [E], [S]` creates a new tab.
- `[Ctrl] + [E], [V]` creates a new tab.
- `[Ctrl] + [E], [C]` closes the current tab.
- `[Ctrl] + [E], [Arrow Key]` moves focus to different tab.
- `[Ctrl] + [E], [H/L]` moves focus to different tab.

**Window/Buffer Navigation**

(Default Bindings)

- `[Ctrl] + [W], [S]` horizontally splits current window.
- `[Ctrl] + [W], [V]` vertically splits current window.
- `[Ctrl] + [W], [Arrow Key]` moves focus to different window.
- `[Ctrl] + [W], [H/J/K/L]` moves focus to different window.

Additional Bindings are defined in [settings.tradewinds.vim](./settings.tradewinds.vim).

- `[Ctrl] + [W], [G], [Arrow Key]` moves the current window.
- `[Ctrl] + [W], [G], [H/J/K/L]` moves the current window.

**Error Navigation**

Error Navigation Bindings are defined in [settings.ale.vim](./settings.ale.vim).

- `[Ctrl] + [Arrow Key]` moves focus to to different linting error.
- `[Ctrl] + [J/K]` moves focus to different linting error.


### Visual Mode

(Default Bindings)

- `[g], [f]` opens File under cursor in current window.
- `[g], [x]` opens Browser or Application via `gio open`.


### Normal Mode and Visual Mode

Additional Bindings are defined in [settings.move.vim](./settings.move.vim).

- `[Ctrl] + [J/K]` moves currently selected block.


## Templates

The templates are defined in [templates.vim](./templates.vim)

- `,definition` inserts the [lycheejs/definition.js](./templates/lycheejs/definition.js) template
- `,index.html` inserts the [lycheejs/index.html](./templates/lycheejs/index.html) template
- `,index.js` inserts the [lycheejs/index.js](./templates/lycheejs/index.js) template


## Plugins

The plugins are defined in [.vimrc](./.vimrc) and use a static copy
of [vim-zen](https://github.com/prakashdanish/vim-zen) located at
[./autoload/zen.vim](./autoload/zen.vim).

- [w0rp/ale](https://github.com/w0rp/ale)
- [ervandew/supertab](https://github.com/ervandew/supertab)
- [djoshea/vim-autoread](https://github.com/djoshea/vim-autoread)
- [sgur/vim-editorconfig](https://github.com/sgur/vim-editorconfig)
- [itchyny/lightline.vim](https://github.com/itchyny/lightline.vim)
- [vim-utils/vim-man](https://github.com/vim-utils/vim-man)
- [matze/vim-move](https://github.com/matze/vim-move)
- [andymass/vim-tradewinds](https://github.com/andymass/vim-tradewinds)


### Updates

The `zen.vim` file is modified to use `git clone --depth=1 --single-branch --branch=master`
in order to save bandwidth. In order to make a full plain copy,
just remove the subfolders in [./plugged](./plugged), do a `:ZenInstall`
via `vim`, and execute the [bin/clean.sh](bin/clean.sh) file afterwards
via `bash`.

It is wise to modify the [bin/clean.sh](./bin/clean.sh) when some
unnecessary bloat was added to plugins and appear in a `git diff`
afterwards (Pull Requests welcomed).

