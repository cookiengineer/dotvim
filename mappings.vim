
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
nnoremap <silent> <F1> :call ToggleNetRW()<CR>
nnoremap <silent> <F2> :nohl<CR>
nnoremap <silent> <F3> mzgg=G'z

" Zoom/Unzoom Window
nnoremap <silent> + :call ToggleZoom()<CR>

" Auto Format bad indent of copy/paste
nnoremap p p=`]

" Special Commands
command W w !sudo tee % > /dev/null

