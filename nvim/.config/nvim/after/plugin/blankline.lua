
require("ibl").setup {
  indent = {
    char = "│",   -- vertical line character
  },
  scope = {
    enabled = true,        -- highlights current scope
    show_start = true,     -- mark start of scope
    show_end = true,       -- mark end of scope
  },
  exclude = {
    buftypes = { "terminal" },
    filetypes = { "dashboard", "NvimTree", "packer" },
  },
}

