let g:copilot_filetypes = {
\ '*': v:true,
\ 'pandoc': v:false,
\ 'gitcommit': v:false,
\ 'markdown': v:false,
\ }

command! CE Copilot enable
command! CD Copilot disable
imap <C-Y> <Plug>(copilot-suggest)
imap <C-L> <Plug>(copilot-accept-word)
