local M = {}

local commands = {
  require('commands.file-copy-data'),
  require('commands.file-set-format'),
  require('commands.tab-set-size'),
  require('commands.color-scheme-set'),
}

M.setup = function()
  for _, module in ipairs(commands) do
    vim.api.nvim_create_user_command(module.name, module.action, module.options)
  end
end

return M

