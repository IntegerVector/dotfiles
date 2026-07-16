local M = {}

M.key = '<Leader><down>'
M.modes = { 'n' }
M.command = '<C-w>j'
M.options = { noremap = true, silent = true, expr = false }

return M

