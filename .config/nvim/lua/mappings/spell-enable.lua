local M = {}

M.key = '<Leader>z'
M.modes = { 'n' }
M.options = { noremap = true, silent = true, expr = false }
M.action = ':set spell<Return>'

return M

