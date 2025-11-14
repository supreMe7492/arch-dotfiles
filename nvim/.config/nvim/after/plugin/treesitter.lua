require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "c",
    "lua",
    "vim",
    "vimdoc",
    "query",
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",          -- React / JSX / TSX
    "json",
    "markdown",
    "markdown_inline"
  },

  sync_install = false,
  auto_install = true,

  highlight = {
    enable = true,

    -- disable highlighting for nothing unless you really need to
    disable = function(lang, buf)
      local max_filesize = 100 * 1024 -- 100 KB
      local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
      if ok and stats and stats.size > max_filesize then
        return true
      end
    end,

    additional_vim_regex_highlighting = false,
  },
}

require('treesitter-context').setup{
  enable = true,            -- enable plugin
  max_lines = 3,            -- max lines to show in context
  trim_scope = 'outer',     -- trim outer scope if too big
  patterns = {
    default = {'class', 'function', 'method'},
    lua = {'function', 'local_function'},
    python = {'class', 'def'},
  },
}
