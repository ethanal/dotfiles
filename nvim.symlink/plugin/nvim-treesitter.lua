require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "bash",
    "c",
    "css",
    "dockerfile",
    "go",
    "html",
    "java",
    "javascript",
    "json",
    "latex",
    "lua",
    "markdown",
    "markdown_inline",
    "python",
    "rust",
    "terraform",
    "tlaplus",
    "toml",
    "typescript",
    "vim",
    "vimdoc",
    "xml",
    "yaml",
  },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,
  auto_install = false,

  highlight = {
    enable = true,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}

vim.api.nvim_set_hl(0, "@variable", { link = "Normal" })
vim.api.nvim_set_hl(0, "@comment.documentation.rust", { link = "Special" })
vim.api.nvim_set_hl(0, "@punctuation.bracket", { link = "Normal" })
vim.api.nvim_set_hl(0, "@punctuation.delimiter", { link = "Normal" })
vim.api.nvim_set_hl(0, "@character.special", { link = "Normal" })
vim.api.nvim_set_hl(0, "@constant", { link = "Constant" })
vim.api.nvim_set_hl(0, "@constant.builtin", { link = "Constant" })
vim.api.nvim_set_hl(0, "@module.rust", { link = "Include" })
vim.api.nvim_set_hl(0, "@module.go", { link = "Normal" })
