local M = {}

M.key = '<Leader>t'
M.modes = { 'n' }
M.options = { noremap = true, silent = true, expr = false }
M.action = ':term<Return>'

return M

