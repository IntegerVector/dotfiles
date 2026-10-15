local M = {}

M.key = 'K'
M.modes = { 'n' }
M.options = { noremap = true, silent = true, expr = false }
M.action = vim.lsp.buf.hover

return M

