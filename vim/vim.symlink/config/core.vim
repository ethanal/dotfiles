syntax on
set backspace=indent,eol,start

set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

set ignorecase
set ruler
set number
set relativenumber
set clipboard=unnamed
set wildmenu
set shell=/bin/bash

autocmd FileType make setlocal noexpandtab
autocmd FileType cpp setlocal tabstop=2 shiftwidth=2 expandtab
autocmd FileType yaml setlocal tabstop=2 shiftwidth=2
filetype plugin indent on

set showcmd
let mapleader=" "

" Cycle through tabs with <<, >> keys
" noremap <F7> gT
" noremap <F9> gt

" More natural splits
set splitbelow
set splitright

" This allows buffers to be hidden if you've modified a buffer.
" This is almost a must if you wish to use buffers in this way.
set hidden

" To open a new empty buffer
nmap <leader>t :enew<cr>

" Move to the next buffer
nmap <leader>l :bnext<CR>

" Move to the previous buffer
nmap <leader>h :bprevious<CR>

" Close the current buffer
nmap <leader>w :bd<CR>

