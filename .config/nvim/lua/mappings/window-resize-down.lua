local M = {}

M.key = '<Leader><down>'
M.modes = { 'n' }
M.command = '5<C-w>-'
M.options = { noremap = true, silent = true, expr = false }

return M

