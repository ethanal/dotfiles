set laststatus=2
let g:airline_powerline_fonts = 1

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
" let g:airline#extensions#tabline#fnamemod = ':t'


" Show full filename in status line.
let g:airline_section_c="%F"

" Disable vim-fugitive integration.
let g:airline#extensions#branch#enabled = 0
