local M = {}

M.key = '<Leader>gr'
M.modes = { 'n' }
M.options = { noremap = true, silent = true, expr = false }
M.action = vim.lsp.buf.references

return M

