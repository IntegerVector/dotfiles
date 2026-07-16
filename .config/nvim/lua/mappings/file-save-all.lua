local M = {}

M.key = '<Leader>w'
M.modes = { 'n' }
M.command = ':wa<Return>'
M.options = { noremap = true, silent = true, expr = false }

return M

