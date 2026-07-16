local M = {}

M.key = '<Leader>p'
M.modes = { 'n', 'v' }
M.command = '"0p'
M.options = { noremap = true, silent = true, expr = false }

return M

