-- gitsigns.lua
local gitsigns = require('gitsigns')
gitsigns.setup {
  signs = {
    add = {hl = 'GitGutterAdd', text = '+'},
    change = {hl = 'GitGutterChange', text = '~'},
    delete = {hl = 'GitGutterDelete', text = '_'},
  },
  current_line_blame = true,
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns
    vim.keymap.set('n', ']c', gs.next_hunk, {buffer = bufnr})
    vim.keymap.set('n', '[c', gs.prev_hunk, {buffer = bufnr})
    vim.keymap.set('n', '<leader>hs', gs.stage_hunk, {buffer = bufnr})
    vim.keymap.set('n', '<leader>hu', gs.undo_stage_hunk, {buffer = bufnr})
    vim.keymap.set('n', '<leader>hr', gs.reset_hunk, {buffer = bufnr})
    vim.keymap.set('n', '<leader>hb', gs.blame_line, {buffer = bufnr})
  end,
}

