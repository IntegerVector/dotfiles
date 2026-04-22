local sh = require 'lua-utils.sh'

local M = {}

M['vpn-up'] = function()
  return sh('wg-quick')('up wg0')
end

M['config:vpn-up'] = function()
  return {
    visible = true,
    help = function()
      return [[ 
        1) M.vpn-up()
        starts WireGuard w0 interface
      ]]
    end,
  }
end

return M

