local M = {}

M.key = '<Leader>['
M.modes = { 'n' }
M.command = 'gT'
M.options = { noremap = true, silent = true, expr = false }

return M

