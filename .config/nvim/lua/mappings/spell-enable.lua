local M = {}

M.key = '<Leader>z'
M.modes = { 'n' }
M.command = ':set spell<Return>'
M.options = { noremap = true, silent = true, expr = false }

return M

