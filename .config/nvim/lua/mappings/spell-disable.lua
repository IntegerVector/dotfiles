local M = {}

M.key = '<Leader>Z'
M.modes = { 'n' }
M.options = { noremap = true, silent = true, expr = false }
M.action = ':set nospell<Return>'

return M

