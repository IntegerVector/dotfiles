local M = {}

local commands = require('utils.module-loader').load_modules('commands', {
  -- Add tmp disabled commands here
})

M.setup = function()
  for _, module in ipairs(commands) do
    vim.api.nvim_create_user_command(module.name, module.action, module.options)
  end
end

return M

