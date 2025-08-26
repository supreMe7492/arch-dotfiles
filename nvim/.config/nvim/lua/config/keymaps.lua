-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- Select all text
vim.keymap.set("n", "<C-a>", "ggVG", { desc = "Select all" })
-- Remove the LazyVim snacks keymap for <leader>e and others
vim.keymap.del("n", "<leader>e") -- snacks explorer
vim.keymap.del("n", "<leader>E") -- snacks statuscolumn, if it exists
vim.keymap.del("n", "<leader>cS") -- snacks symbol outline or whatever

-- Yank whole buffer to system clipboard
vim.keymap.set("n", "<C-c>", "<cmd>%y+<cr>", { desc = "Yank entire file" })

-- ; as command mode
vim.keymap.set("n", "1", ":", { noremap = true, desc = "Command mode shortcut" })
--tabs
-- vim.keymap.set("n", "<Tab>", ":bnext<CR>", { desc = "Go to next buffer" })
-- vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", { desc = "Go to previous buffer" })
-- Close current buffer
vim.keymap.set("n", "<C-w>", "<cmd>bd<cr>", { desc = "Close buffer" })

vim.keymap.del("n", "\\\\")
-- Remove other <leader>d mappings from snacks and LazyVim
vim.keymap.del("n", "<leader>dps") -- LazyVim's profiler start
vim.keymap.del("n", "<leader>dph") -- snacks profiler heap
vim.keymap.del("n", "<leader>dpp") -- snacks profiler pause
-- Undo in insert mode (like Ctrl+Z)
vim.keymap.set("i", "<C-z>", "<C-o>u", { noremap = true, silent = true })
--paste in insert using ctrl+v
vim.keymap.set("i", "<C-v>", "<C-r>+", { noremap = true, silent = true })
--esc in ctrl + .
vim.keymap.set("i", "<C-.>", "<Esc>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-.>", "o", { noremap = true, silent = true })
vim.keymap.set("n", "<C-,>", "i", { noremap = true, silent = true })
