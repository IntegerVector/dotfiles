local M = {}

local mappings = require('utils.module-loader').load_modules('mappings', {
  -- Add tmp disabled mappings here
})

M.setup = function()
  for _, module in ipairs(mappings) do
    for _, mode in ipairs(module.modes) do
      vim.keymap.set(mode, module.key, module.action, module.options)
    end
  end
end

return M

