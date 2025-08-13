let g:rustfmt_autosave = 1
let g:rust_keep_autopairs_default = 1

if $RUST_FMT_NO_NIGHTLY == '1'
 let g:rustfmt_command = "rustfmt"
else
 let g:rustfmt_command = "rustfmt +nightly"
endif

" Facilitate cargo output in the quickfix panel
autocmd FileType rust compiler cargo
nmap <silent> <leader>qo :copen<CR>
nmap <silent> <leader>qn :cn<CR>
nmap <silent> <leader>qp :cp<CR>
