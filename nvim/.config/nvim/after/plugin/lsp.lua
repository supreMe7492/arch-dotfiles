-- Mason setup
require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = { "lua_ls", "ts_ls", "html", "cssls", "clangd", "pyright" },
	automatic_installation = true,
})

-- Capabilities for nvim‑cmp (keep this)
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- on_attach remains the same
local on_attach = function(client, bufnr)
	local opts = { buffer = bufnr, noremap = true, silent = true }
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
	vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
	vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
	vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
end

-- Use vim.lsp.config and vim.lsp.enable (the new API)
vim.lsp.config("lua_ls", {
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		Lua = {
			diagnostics = { globals = { "vim" } },
			workspace = { library = vim.api.nvim_get_runtime_file("", true) },
		},
	},
})
vim.lsp.config("ts_ls", {
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
})
vim.lsp.config("html", { on_attach = on_attach, capabilities = capabilities })
vim.lsp.config("cssls", { on_attach = on_attach, capabilities = capabilities })
vim.lsp.config("clangd", {
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = { "c", "cpp", "objc" },
})
vim.lsp.config("pyright", { on_attach = on_attach, capabilities = capabilities })

vim.lsp.enable({ "lua_ls", "ts_ls", "html", "cssls", "clangd", "pyright" })

-- Diagnostics config (quiet/hide things)

vim.diagnostic.config({
	virtual_text = {
		severity = { min = vim.diagnostic.severity.WARN },
		spacing = 1,
	},
	underline = false,
	signs = false,
	update_in_insert = false,
})
