local sh = require 'lua-utils.sh'

local M = {}

M['vpn-down'] = function()
  return sh('wg-quick')('down wg0')
end

M['config:vpn-down'] = function()
  return {
    visible = true,
    help = function()
      return [[ 
        1) M.vpn_down()
        stops WireGuard w0 interface
      ]]
    end,
  }
end

return M

