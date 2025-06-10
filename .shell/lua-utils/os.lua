local sh = require 'lua-utils.sh'

local M = {}

M.get_os_name = function()
  return sh('uname')('-s')
end

M['config:get_os_name'] = function()
  return {
    visible = true,
    help = function()
      return [[ 
        1) M.get_os_name()
        returns kernel name
      ]]
    end,
    print = function()
      return {
        transform = function(v)
          return v.__input
        end
      }
    end
  }
end

return M

