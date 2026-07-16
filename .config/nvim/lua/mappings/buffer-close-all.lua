local M = {}

M.key = '<Leader>Q'
M.modes = { 'n' }
M.options = { noremap = true, silent = true, expr = false }
M.action = ':%bd | e# | bd#<Return>'

return M

