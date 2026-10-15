local M = {}

M.key = '<Leader>rn'
M.modes = { 'n' }
M.options = { noremap = true, silent = true, expr = false }
M.action = vim.lsp.buf.rename

return M

