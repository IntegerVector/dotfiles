local sh = require 'lua-utils.sh'

local M = {}

M['ai'] = function()
  os.execute('headroom wrap opencode --no-serena')
end

M['config:ai'] = function()
  return {
    visible = true,
    help = function()
      return [[ 
        1) M.ai()
        strts openCode with token optimizations
        returns nothing
      ]]
    end
  }
end

return M

