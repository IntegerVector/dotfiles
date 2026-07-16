local M = {}

M.key = '<Leader>e'
M.modes = { 'n' }
M.command = ':Neotree toggle<Return>'
M.options = { noremap = true, silent = true, expr = false }

return M

