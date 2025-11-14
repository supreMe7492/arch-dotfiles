
require('bufferline').setup {
  options = {
    numbers = nil,                    -- no numbers
    show_buffer_close_icons = true,   -- show close button on each buffer
    show_close_icon = false,          -- remove the global close icon on the right
    close_command = "bdelete! %d",    -- command when close button is clicked
    right_mouse_command = "bdelete! %d",
    left_trunc_marker = '',
    right_trunc_marker = '',
    max_name_length = 30,
    max_prefix_length = 30,
    tab_size = 21,
    enforce_regular_tabs = false,
    always_show_bufferline = true,

       custom_filter = function(buf_number)
      if vim.bo[buf_number].filetype ~= "NvimTree" then
        return true
      end
    end, 
  }
}

-- Keymaps for buffer navigation
vim.keymap.set('n', '<Tab>', '<Cmd>BufferLineCycleNext<CR>', {silent = true})
vim.keymap.set('n', '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', {silent = true})
vim.keymap.set('n', '<C-w>', '<Cmd>bd<CR>', {silent = true})  -- close current buffer

