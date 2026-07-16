local M = {}

M.key = '<Leader>k'
M.modes = { 'n' }
M.command = '<C-w>k'
M.options = { noremap = true, silent = true, expr = false }

return M

