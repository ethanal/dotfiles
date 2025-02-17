vim.opt.termguicolors = true

require("nvim-tree").setup({
	hijack_cursor = true,
	actions = {
		open_file = {
			quit_on_open = true,
			window_picker = {
				enable = false
			},
		},
	},
	view = {
		signcolumn = "auto",
		width = 60,
	},
	renderer = {
		indent_markers = {
			enable = true,
			inline_arrows = false,
		},
		icons = {
			glyphs = {
	            symlink = "",
	            bookmark = "⦿",
	            folder = {
	              arrow_closed = "▸",
	              arrow_open = "▾",
	              open = "?",
	            },
			},
			show = {
	            file = false,
	            folder = false,
	            folder_arrow = true,
	            git = false,
			}
		}
	},
	git = {
		timeout = 1000,
	},
	filters = {
		custom = {
			"^\\.git$",
			"^\\.bazel-build-stamp$",
			"^\\.DS_Store$"
		}
	}
})

local view = require("nvim-tree.view")
function nvim_tree_focus_or_toggle()
	if view.is_visible() then
		local curwin = vim.api.nvim_get_current_win()
		local curwinconfig = vim.api.nvim_win_get_config(curwin)
		local curbuf = vim.api.nvim_win_get_buf(curwin)
		local bufname = vim.api.nvim_buf_get_name(curbuf)

		if bufname:match "NvimTree" then
			view.close()
		else
			view.focus()
		end
	else
		-- vim.cmd("NvimTreeFindFile")
		vim.cmd("NvimTreeOpen")
	end
end

vim.keymap.set("n", "<leader>n", "<CMD>lua nvim_tree_focus_or_toggle()<CR>")
vim.keymap.set("n", "<leader>f", "<CMD>NvimTreeFindFile<CR>")
