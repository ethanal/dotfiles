" Toggle or focus NERD Tree with ctrl-N
nnoremap <silent><expr> <leader>n (bufname(winbufnr(0))=='[BufExplorer]' ? ":ToggleBufExplorer\<CR>:NERDTreeFocus\<CR>" : (winnr()==g:NERDTree.GetWinNum() ? ":NERDTreeClose\<CR>" : ":NERDTreeFocus\<CR>")) <bar> :AirlineRefresh

let g:NERDTreeQuitOnOpen = 1

" Close vim if the last window left open is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

