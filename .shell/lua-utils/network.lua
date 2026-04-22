local sh = require 'lua-utils.sh'

local M = {}

M['get-ip'] = function()
  return sh('curl')('ifconfig.me')
end

M['config:get-ip'] = function()
  return {
    visible = true,
    help = function()
      return [[ 
        1) M.get-ip()
        returns public IP
      ]]
    end,
    print = function()
      return {
        transform = function(v)
          return v.__input
        end,
      }
    end,
  }
end

return M

