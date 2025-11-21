-- after/plugin/nvim-tree.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
	view = {
		side = "right",
		width = 30,
		--`  hide_root_folder = false,
	},
	actions = {
		open_file = {
			quit_on_open = true, -- closes tree when opening a file
		},
	},
	git = {
		ignore = false,
	},
	filters = {
		dotfiles = false,
	},
	renderer = {
		icons = {
			show = {
				file = true,
				folder = true,
				git = false,
			},
		},
	},
	hijack_cursor = true,
	hijack_netrw = true,
	update_focused_file = {
		enable = true,
		update_cwd = true,
	},
	diagnostics = {
		enable = true,
		icons = {
			hint = "",
			info = "",
			warning = "",
			error = "",
		},
	},
})

-- toggle keymap
vim.keymap.set("n", "\\", "<Cmd>NvimTreeToggle<CR>", { silent = true })
