local M = {}

M.key = '<Leader>F'
M.modes = { 'n' }
M.options = { noremap = true, silent = true, expr = false }
M.action = function()
  vim.lsp.buf.format { async = true }
  end

return M

