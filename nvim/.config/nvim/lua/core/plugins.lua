local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")
	-- My plugins here
	-- telescope:
	use({
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	--colorscheme
	use({
		"projekt0n/github-nvim-theme",
		config = function()
			require("github-theme").setup({
				-- ...
			})
			vim.cmd("colorscheme github_dark_high_contrast")
		end,
	})

	--treesitter
	use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })

	use({
		"nvim-treesitter/nvim-treesitter-context",
		requires = { "nvim-treesitter/nvim-treesitter" },
	})
	--lsp
	use({
		"neovim/nvim-lspconfig", -- LSP client configs
		"williamboman/mason.nvim", -- easy installer for LSP servers
		"williamboman/mason-lspconfig.nvim", -- bridge between mason and lspconfig
	})

	--cmp-shit
	use({
		"hrsh7th/nvim-cmp", -- Completion engine
		"hrsh7th/cmp-nvim-lsp", -- LSP completions
		"hrsh7th/cmp-buffer", -- buffer words
		"hrsh7th/cmp-path", -- file paths
		"hrsh7th/cmp-cmdline",
		"L3MON4D3/LuaSnip", -- Snippets engine
		"saadparwaiz1/cmp_luasnip", -- Snippets source
	})

	--git-signs
	use({
		"lewis6991/gitsigns.nvim",
		requires = { "nvim-lua/plenary.nvim" },
	})
	use("tpope/vim-fugitive")
	--buffer and status
	use("nvim-lualine/lualine.nvim")
	use("akinsho/bufferline.nvim")

	--nvim-tree
	use("nvim-tree/nvim-tree.lua")

	--file-icons
	use("nvim-tree/nvim-web-devicons")
	--workflow-plugins
	use({
		"folke/which-key.nvim",
		config = function()
			require("which-key").setup({})
		end,
	})

	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup({})
		end,
	})

	use({
		"folke/todo-comments.nvim",
		requires = "nvim-lua/plenary.nvim",
		config = function()
			require("todo-comments").setup({})
		end,
	})

	use("RRethy/vim-illuminate")
	--autopairs
	use("windwp/nvim-autopairs")
	--auto-tag
	use("windwp/nvim-ts-autotag")
	--null-ls for prettier

	use({
		"stevearc/conform.nvim",
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
					javascript = { "prettier", stop_after_first = true },
					typescript = { "prettier", stop_after_first = true },
					html = { "prettier" },
					css = { "prettier" },
					json = { "prettier" },
					markdown = { "prettier" },
					tsx = { "prettier", stop_after_first = true },
					jsx = { "prettier", stop_after_first = true },
				},
				format_on_save = {
					timeout_ms = 500,
				},
			})
		end,
	})
	--blank-line
	use("lukas-reineke/indent-blankline.nvim")

	--emmet

	use({
		"mattn/emmet-vim",
		ft = { "html", "css", "javascript", "typescript", "jsx", "tsx" },
		config = function()
			vim.g.user_emmet_expandabbr_key = "<C-y>,"
			vim.g.user_emmet_mode = "a"
		end,
	})

	--color highlight

	use({
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup(
				{ "*" }, -- highlight all files, or use {"css", "scss", "html"} specifically
				{
					RGB = true, -- #RGB hex codes
					RRGGBB = true, -- #RRGGBB hex codes
					names = true, -- "blue" etc.
					RRGGBBAA = true, -- #RRGGBBAA hex codes
					css = true, -- enable CSS parsing
					css_fn = true, -- enable rgb(), hsl() etc.
				}
			)
		end,
	})

	--terminal

	use({
		"akinsho/toggleterm.nvim",
		config = function()
			require("toggleterm").setup({
				size = function(term)
					return math.floor(vim.o.lines * 0.3) -- 30% of editor height
				end,
				open_mapping = [[<C-t>]], -- Ctrl+T toggles terminal
				direction = "horizontal", -- bottom terminal
				close_on_exit = true, -- auto-close terminal when process exits
				start_in_insert = true, -- start in insert mode
				persist_size = true, -- remember terminal size
				shade_filetypes = {},
				auto_scroll = true,
			})
		end,
	})
	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require("packer").sync()
	end
end)
