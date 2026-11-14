call plug#begin()

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'RRethy/base16-nvim'

Plug 'LunarWatcher/auto-pairs'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-airline/vim-airline'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'mrjones2014/smart-splits.nvim'
Plug 'fatih/vim-go', {'for': 'go'}
Plug 'mattn/emmet-vim', {'for': 'html'}
Plug 'jremmen/vim-ripgrep'
Plug 'ntpeters/vim-better-whitespace'
Plug 'tpope/vim-fugitive'
Plug 'lewis6991/gitsigns.nvim'
Plug 'tpope/vim-rhubarb'
Plug 'rust-lang/rust.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'psliwka/vim-smoothie'
Plug 'tpope/vim-commentary'
Plug 'easymotion/vim-easymotion'
" Plug 'ojroques/nvim-oscyank'

" Dependency of telescope
Plug 'nvim-lua/plenary.nvim'

Plug 'nvim-telescope/telescope.nvim'

Plug 'muniftanjim/nui.nvim'
Plug 'nvim-tree/nvim-web-devicons'

call plug#end()

set termguicolors
set background=dark
colorscheme base16-solarized-custom
