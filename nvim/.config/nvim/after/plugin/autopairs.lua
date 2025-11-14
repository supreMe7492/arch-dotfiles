require('nvim-autopairs').setup{
  check_ts = true,        -- integrate with Treesitter
  ts_config = {
    lua = {'string'},     -- don't autopair in lua strings
    javascript = {'template_string'}
  },
  fast_wrap = {},
}

