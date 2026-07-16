local M = {}

M.key = '<Leader>w'
M.modes = { 'n' }
M.options = { noremap = true, silent = true, expr = false }
M.action = ':wa<Return>'

return M

