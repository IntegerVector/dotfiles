local M = {}

M.key = '<Leader>ca'
M.modes = { 'n', 'v' }
M.options = { noremap = true, silent = true, expr = false }
M.action = vim.lsp.buf.code_action

return M

