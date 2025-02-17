call plug#begin()

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'RRethy/base16-nvim'

Plug 'LunarWatcher/auto-pairs'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-airline/vim-airline'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'christoomey/vim-tmux-navigator'
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
Plug 'ojroques/nvim-oscyank'
Plug 'github/copilot.vim'

" Dependency of telescope, avante
Plug 'nvim-lua/plenary.nvim'

Plug 'nvim-telescope/telescope.nvim', { 'branch': '0.1.x' }

Plug 'muniftanjim/nui.nvim'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'yetone/avante.nvim', { 'branch': 'main', 'do': 'make' }

call plug#end()

hi clear
let g:colors_name = 'base16-solarized-dark-custom'
lua require('base16-colorscheme').setup({
     \ base00 = '#002b36', base01 = '#073642', base02 = '#586e75', base03 = '#657b83',
     \ base04 = '#839496', base05 = '#93a1a1', base06 = '#eee8d5', base07 = '#fdf6e3',
     \ base08 = '#dc322f', base09 = '#cb4b16', base0A = '#b58900', base0B = '#2aa198',
     \ base0C = '#6c71c4', base0D = '#268bd2', base0E = '#859900', base0F = '#d33682'
     \})

" Line numbers
highlight clear SignColumn
highlight clear LineNr
highlight LineNr guifg=#657b83
