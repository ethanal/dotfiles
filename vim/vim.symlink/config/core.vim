syntax on
set backspace=indent,eol,start

set autoindent
set smartindent
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

set ignorecase
set smartcase  " Don't ignore case in searches when pattern contains upper case chars
set ruler
set number
set relativenumber
set clipboard=unnamed
set wildmenu
set shell=/bin/bash

" Speed stuff up
set ttyfast
set lazyredraw

" Speed up syntax highlighting
set re=1
set nocursorcolumn
set nocursorline

" Time out on key codes but not mappings.
" Basically this makes terminal Vim work sanely.
set notimeout
set ttimeout
set ttimeoutlen=10

" Better completion
set complete=.,w,b,u,t
set completeopt=longest,menuone

" More natural splits
set splitbelow
set splitright

" Don't clutter workspace
set nobackup
set swapfile
set dir=~/.tmp

" This allows buffers to be hidden if you've modified a buffer.
set hidden

autocmd FileType make setlocal noexpandtab
filetype plugin indent on

let mapleader=" "
" To open a new empty buffer
nmap <leader>t :enew<cr>

" Move to the next buffer
nmap <leader>l :bnext<CR>

" Move to the previous buffer
nmap <leader>h :bprevious<CR>

" Close the current buffer
nmap <leader>w :bp <BAR> bd #<CR>

" Do not show stupid q: window
map q: :q

" Make
nmap <leader>m :make<CR>

" Spell check
autocmd FileType gitcommit setlocal spell

" Spell check config
" Don't mark lower word as incorrect because they aren't capitalized.
set spellcapcheck=

" Highlight characters in lines > 80 chars.
autocmd BufWinEnter,WinEnter *.c,*.cc,*.cpp,*.h,*.py let w:m1=matchadd('ErrorMsg', '\%>80v.\+', -1)
autocmd BufWinLeave,WinLeave * call clearmatches()

" Syntax highlighting file patterns
autocmd BufRead,BufNewFile Dockerfile* setfiletype dockerfile
autocmd BufRead,BufNewFile *.proto* setfiletype proto

" Code folding
setlocal foldmethod=indent
set foldlevelstart=99999
set nofoldenable

" Enable mouse
set mouse=a
