local M = {}

M.key = '<Leader>v'
M.modes = { 'n' }
M.options = { noremap = true, silent = true, expr = false }
M.action = vim.diagnostic.open_float

return M

