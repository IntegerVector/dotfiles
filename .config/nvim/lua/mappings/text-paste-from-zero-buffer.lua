local M = {}

M.key = '<Leader>p'
M.modes = { 'n', 'v' }
M.options = { noremap = true, silent = true, expr = false }
M.action = '"0p'

return M

