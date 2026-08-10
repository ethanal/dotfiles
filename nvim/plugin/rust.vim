let g:rust_keep_autopairs_default = 1

" Facilitate cargo output in the quickfix panel
autocmd FileType rust compiler cargo
nmap <silent> <leader>qo :copen<CR>
nmap <silent> <leader>qn :cn<CR>
nmap <silent> <leader>qp :cp<CR>
