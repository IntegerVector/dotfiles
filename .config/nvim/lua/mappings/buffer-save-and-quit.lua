local M = {}

M.key = '<Leader>q'
M.modes = { 'n' }
M.options = { noremap = true, silent = true, expr = false }
M.action = ':silent! w | bd! <Return>'

return M

