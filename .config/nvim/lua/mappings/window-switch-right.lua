local M = {}

M.key = '<Leader>l'
M.modes = { 'n' }
M.command = '<C-w>l'
M.options = { noremap = true, silent = true, expr = false }

return M

