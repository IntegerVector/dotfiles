local M = {}

M.key = '<C-k>'
M.modes = { 'n' }
M.options = { noremap = true, silent = true, expr = false }
M.action = vim.lsp.buf.signature_help

return M

