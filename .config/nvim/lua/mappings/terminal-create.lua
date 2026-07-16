local M = {}

M.key = '<Leader>t'
M.modes = { 'n' }
M.command = ':term<Return>'
M.options = { noremap = true, silent = true, expr = false }

return M

