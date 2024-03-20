let g:copilot_filetypes = {
\ '*': v:true,
\ 'pandoc': v:false,
\ 'gitcommit': v:false,
\ 'markdown': v:false,
\ }

imap <C-I> <Plug>(copilot-suggest)
