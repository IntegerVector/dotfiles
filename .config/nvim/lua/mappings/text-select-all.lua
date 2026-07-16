local M = {}

M.key = '<C-a>'
M.modes = { 'n' }
M.command = 'gg<S-v>G'
M.options = { noremap = true, silent = true, expr = false }

return M

