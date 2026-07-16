local M = {}

M.key = '<Leader>.'
M.modes = { 'n' }
M.options = { noremap = true, silent = true, expr = false }
M.action = ':tabm +1<Return>'

return M

