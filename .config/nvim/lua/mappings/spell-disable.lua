local M = {}

M.key = '<Leader>Z'
M.modes = { 'n' }
M.command = ':set nospell<Return>'
M.options = { noremap = true, silent = true, expr = false }

return M

