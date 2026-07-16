local M = {}

M.key = '<Leader>e'
M.modes = { 'n' }
M.options = { noremap = true, silent = true, expr = false }
M.action = ':Neotree toggle<Return>'

return M

