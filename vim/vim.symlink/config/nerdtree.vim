" Toggle NERD Tree with ctrl-N
map <leader>n :NERDTreeToggle<CR>

" Close vim if the last window left open is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

