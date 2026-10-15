local M = {}

M.key = 'gD'
M.modes = { 'n' }
M.options = { noremap = true, silent = true, expr = false }
M.action = vim.lsp.buf.declaration

return M

