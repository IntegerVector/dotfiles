local M = {}

M.key = '<Leader>q'
M.modes = { 'n' }
M.command = ':wq<Return>'
M.options = { noremap = true, silent = true, expr = false }

return M

