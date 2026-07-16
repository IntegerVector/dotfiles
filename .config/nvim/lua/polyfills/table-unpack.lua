local M = {}

M.setup = function()
  if not table.unpack then
    table.unpack = unpack
  end
end

return M

