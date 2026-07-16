local M = {}

M.key = '<Leader>,'
M.modes = { 'n' }
M.command = ':tabm -1<Return>'
M.options = { noremap = true, silent = true, expr = false }

return M

