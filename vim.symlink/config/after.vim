" Disable underlined line number
highlight CursorLineNr term=bold cterm=none ctermfg=11 gui=bold guifg=Yellow

" Remap gd to open a vertical split
au FileType go nmap <buffer> <silent> gd <Plug>(go-def-vertical)
