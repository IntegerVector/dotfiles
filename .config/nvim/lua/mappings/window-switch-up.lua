local M = {}

M.key = '<Leader>k'
M.modes = { 'n' }
M.options = { noremap = true, silent = true, expr = false }
M.action = '<C-w>k'

return M

