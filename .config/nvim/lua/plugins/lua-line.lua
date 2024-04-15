return {
  'nvim-lualine/lualine.nvim',
  init = function()
    vim.g.lualine_laststatus = vim.o.laststatus
    if vim.fn.argc(-1) > 0 then
      vim.o.statusline = ' '
    else
      vim.o.laststatus = 0
    end
  end,
  opts = function()
    local lualine_require = require('lualine_require')
    lualine_require.require = require

    vim.o.laststatus = vim.g.lualine_laststatus

    return {
      options = {
        theme = 'auto',
        globalstatus = true,
        disabled_filetypes = { statusline = { 'dashboard', 'alpha', 'starter' } },
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch' },
        lualine_c = { 'filename' },
        lualine_x = {
          { 'encoding', separator = ' ', padding = { left = 1, right = 1 } },
          { 'fileformat', padding = { left = 1, right = 2 } },
        },
        lualine_y = {
          { 'progress', separator = ' ', padding = { left = 1, right = 0 } },
          { 'location', padding = { left = 0, right = 1 } },
        },
        lualine_z = {
          function()
            return os.date('%R')
          end
        },
      },
      extensions = { 'neo-tree', 'lazy' },
    }
  end,
}

