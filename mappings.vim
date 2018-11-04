
" Toggle NetRW Explorer
function! ToggleNetRW()

	if exists("t:explorer_buf_num")

		let explorer_win_num = bufwinnr(t:explorer_buf_num)
		if explorer_win_num != -1
			let cur_win_num = winnr()
			exec explorer_win_num . 'wincmd w'
			close
			exec cur_win_num . 'wincmd w'
			unlet t:explorer_buf_num
		else
			unlet t:explorer_buf_num
		endif

	else
		exec '1wincmd w'
		Vexplore
		vertical resize 32
		let t:explorer_buf_num = bufnr("%")
	endif

endfunction

" Rebind <F1> inside NetRW Buffer
function! FixNetRWMapping()
	noremap <buffer> <F1> :call ToggleNetRW()<CR>
endfunction



" Toggle Window Zoom
function ToggleWindowZoom()

	if 1 == winnr('$')
		return
	endif

	let restore_cmd = winrestcmd()
	wincmd |
	wincmd _

	if restore_cmd ==# winrestcmd()
		exe t:zoom_restore
	else
		let t:zoom_restore = restore_cmd
	endif

	return '<Nop>'

endfunction



" Toggle Zoom
function! ToggleZoom()

	if v:count
		exe 'norm! '.v:count.'|'
	else
		call ToggleWindowZoom()
	endif

endfunction



" Function Key Bindings
nmap <F1> :echo<CR>
imap <F1> <C-o>:echo<CR>
nnoremap <silent> <F1> :call ToggleNetRW()<CR>
nnoremap <silent> <F2> :nohl<CR>
nnoremap <silent> <F3> mzgg=G'z

" Zoom/Unzoom Window
nnoremap <silent> + :call ToggleZoom()<CR>

" Tab Navigation
nmap <C-t> :echo<CR>
nnoremap <silent> <C-e>s :tabnew<CR>
nnoremap <silent> <C-e>v :tabnew<CR>
nnoremap <silent> <C-e>c :tabclose<CR>
nnoremap <silent> <C-e><left> :tabprevious<CR>
nnoremap <silent> <C-e>h :tabprevious<CR>
nnoremap <silent> <C-e><right> :tabnext<CR>
nnoremap <silent> <C-e>l :tabnext<CR>

" Auto Format bad indent of copy/paste
nnoremap p p=`]

" Special Commands
command W w !sudo tee % > /dev/null

" Special Buffers
augroup netrw_mapping
	autocmd!
	autocmd filetype netrw call FixNetRWMapping()
augroup END

