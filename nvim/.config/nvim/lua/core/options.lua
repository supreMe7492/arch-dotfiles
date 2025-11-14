-- Disable default Neovim intro/start screen
vim.opt.shortmess:append("I") -- skip the intro message
vim.opt.showmode = false -- optional, hides --INSERT-- mode
-- Tabs & indentation
vim.opt.expandtab = true -- use spaces instead of tabs
vim.opt.shiftwidth = 2 -- spaces per indentation level
vim.opt.tabstop = 2 -- how many spaces a tab counts for
vim.opt.smartindent = true -- auto-indent new lines intelligently
vim.opt.autoindent = true
vim.opt.softtabstop = 2 -- makes backspace/delete behave correctly
-- Auto-indent the current buffer before saving
--vim.api.nvim_create_autocmd("BufWritePre", {
-- -pattern = "*",
--  callback = function()
--   vim.cmd("normal! gg=G")  -- go to top and re-indent all lines
-- end,
--})

-- Use system clipboard by default
vim.opt.clipboard = "unnamedplus"

-- automatically recover, don’t ask
vim.opt.swapfile = true -- keep swapfiles
vim.opt.updatetime = 300 -- faster swap updates
vim.opt.directory = "/tmp/nvim//" -- make sure swapfiles go to tmp
vim.opt.backup = false -- optional: disable backup files
vim.opt.writebackup = false
-- automatically recover swapfiles without asking
vim.cmd([[set shortmess+=A]])
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath("data") .. "/undo//"
vim.opt.termguicolors = true
