set cmdheight=0

let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" https://github.com/neovim/neovim/issues/1858
let g:airline_symbols.whitespace = 'SP'

let g:airline_symbols.linenr = ' L'
let g:airline_symbols.colnr = ' C'
let g:airline_symbols.maxlinenr = ''

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
" let g:airline#extensions#tabline#fnamemod = ':t'


" Show full filename in status line.
let g:airline_section_c="%F"

" Disable vim-fugitive integration.
let g:airline#extensions#branch#enabled = 0
