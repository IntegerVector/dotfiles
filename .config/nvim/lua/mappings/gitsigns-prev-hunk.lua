local M = {}

local gs = package.loaded.gitsigns
local buffer = package.loaded.gitsigns.custom_buffer

M.key = '<leader>g['
M.modes = { 'n' }
M.options = { noremap = true, silent = true, expr = false, buffer = buffer, desc = 'gitsigns: prev hunk' }
M.action = function()
  if vim.wo.diff then
    vim.cmd.normal({ '[c', bang = true })
  else
    gs.nav_hunk('prev')
  end
end

return M
