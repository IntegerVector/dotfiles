local M = {}

M.key = '<Leader>\''
M.modes = { 'n' }
M.command = ':bnext<Return>'
M.options = { noremap = true, silent = true, expr = false }

return M

