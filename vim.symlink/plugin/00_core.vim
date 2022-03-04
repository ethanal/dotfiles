syntax on
set backspace=indent,eol,start

set encoding=utf-8
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
"set nocursorcolumn
"set nocursorline
" Use new regular expression engine
set re=0

" Time out on key codes but not mappings.
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
set nowritebackup
set swapfile
set dir=~/.tmp

" This allows buffers to be hidden if you've modified a buffer.
set hidden

autocmd FileType make setlocal noexpandtab
filetype plugin indent on

let mapleader=" "
" To open a new empty buffer
nmap <silent> <leader>t :enew<cr>

" Move to the next buffer
nmap <silent> <leader>l :bnext<CR>

" Move to the previous buffer
nmap <silent> <leader>h :bprevious<CR>

" Close the current buffer
nmap <silent> <leader>w :bp <BAR> bd #<CR>

" Do not show q: window
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
autocmd BufRead,BufNewFile *.nomad set filetype=terraform

" Code folding
setlocal foldmethod=indent
set foldlevelstart=99999
set nofoldenable

" Enable mouse
set mouse=a
set ttymouse=xterm2

" When using `dd` in the quickfix list, remove the item from the quickfix list.
" https://stackoverflow.com/questions/42905008/quickfix-list-how-to-add-and-remove-entries
function! RemoveQFItem()
  let curqfidx = line('.') - 1
  let qfall = getqflist()
  call remove(qfall, curqfidx)
  call setqflist(qfall, 'r')
  execute curqfidx + 1 . "cfirst"
  :copen
endfunction
:command! RemoveQFItem :call RemoveQFItem()
" Use map <buffer> to only map dd in the quickfix window. Requires +localmap
autocmd FileType qf map <buffer> dd :RemoveQFItem<cr>

" Disable recording
map q <Nop>

" Make option+right arrow advance words.
map <Esc>f w
