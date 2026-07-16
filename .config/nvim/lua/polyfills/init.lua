local M = {}

local polyfills = {
  require('polyfills.table-unpack')
}

M.setup = function()
  for _, module in ipairs(polyfills) do
    module.setup()
  end
end

return M

