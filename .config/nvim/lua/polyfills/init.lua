local M = {}

local polyfills = require('utils.module-loader').load_modules('polyfills', {
  -- Add tmp disabled polyfills here
})

M.setup = function()
  for _, module in ipairs(polyfills) do
    module.setup()
  end
end

return M

