hi clear
let g:colors_name = 'base16-solarized-custom'
let g:airline_theme = 'base16_solarized_' . &background

if &background ==# 'light'
    lua require('base16-colorscheme').setup('solarized-light')
    highlight TelescopeNormal guifg=#073642 guibg=#fdf6e3
    highlight TelescopeBorder guifg=#657b83 guibg=#fdf6e3
    highlight TelescopeResultsTitle guifg=#073642 guibg=#fdf6e3 gui=bold
    highlight TelescopePreviewTitle guifg=#073642 guibg=#eee8d5 gui=bold
    highlight TelescopePromptNormal guifg=#073642 guibg=#eee8d5
    highlight TelescopePromptBorder guifg=#657b83 guibg=#eee8d5
    highlight TelescopePromptPrefix guifg=#073642 guibg=#eee8d5
    highlight TelescopePromptTitle guifg=#073642 guibg=#eee8d5 gui=bold
    highlight TelescopeSelection guifg=#002b36 guibg=#eee8d5 gui=NONE
    highlight TelescopeSelectionCaret guifg=#073642 guibg=#eee8d5 gui=bold
    highlight TelescopeMatching guifg=#a52a24 guibg=#eee0a5 gui=bold
    highlight TelescopePromptCounter guifg=#586e75 guibg=#eee8d5
else
    lua require('base16-colorscheme').setup({
         \ base00 = '#002b36', base01 = '#073642', base02 = '#586e75', base03 = '#657b83',
         \ base04 = '#839496', base05 = '#93a1a1', base06 = '#eee8d5', base07 = '#fdf6e3',
         \ base08 = '#dc322f', base09 = '#cb4b16', base0A = '#b58900', base0B = '#2aa198',
         \ base0C = '#6c71c4', base0D = '#268bd2', base0E = '#859900', base0F = '#d33682'
         \})
    hi TelescopeSelection guibg=#163540
    hi TelescopePromptNormal guibg=#163540
    hi TelescopePromptPrefix guibg=#163540
    hi TelescopePromptBorder guibg=#163540
endif

" Line numbers
highlight clear SignColumn
highlight clear LineNr
highlight LineNr guifg=#657b83
