local M = {}

M.key = 'gi'
M.modes = { 'n' }
M.options = { noremap = true, silent = true, expr = false }
M.action = vim.lsp.buf.implementation

return M

