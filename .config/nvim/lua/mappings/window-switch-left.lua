local M = {}

M.key = '<Leader>h'
M.modes = { 'n' }
M.options = { noremap = true, silent = true, expr = false }
M.action = '<C-w>h'

return M

