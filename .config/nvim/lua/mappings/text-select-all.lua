local M = {}

M.key = '<C-a>'
M.modes = { 'n' }
M.options = { noremap = true, silent = true, expr = false }
M.action = 'gg<S-v>G'

return M

