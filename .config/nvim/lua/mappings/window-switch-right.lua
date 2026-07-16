local M = {}

M.key = '<Leader>l'
M.modes = { 'n' }
M.options = { noremap = true, silent = true, expr = false }
M.action = '<C-w>l'

return M

