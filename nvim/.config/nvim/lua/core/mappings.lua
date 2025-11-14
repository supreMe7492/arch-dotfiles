vim.g.mapleader = " "
-- Select all text
vim.keymap.set("n", "<C-a>", "ggVG", { desc = "Select all" })

-- Yank whole buffer to system clipboard
vim.keymap.set("n", "<C-c>", "<cmd>%y+<cr>", { desc = "Yank entire file" })

-- ; as command mode
vim.keymap.set("n", ";", ":", { noremap = true, desc = "Command mode shortcut" })

-- Close current buffer
vim.keymap.set("n", "<C-w>", "<cmd>bd<cr>", { desc = "Close buffer" })

vim.keymap.set("i", "<C-z>", "<C-o>u", { noremap = true, silent = true })
--esc in ctrl + .
vim.keymap.set("i", "<C-.>", "<Esc>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-.>", "o", { noremap = true, silent = true })
vim.keymap.set("n", "<C-,>", "i", { noremap = true, silent = true })
