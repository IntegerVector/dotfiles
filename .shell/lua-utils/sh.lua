local M = {}

local function arg(key, value)
  if not value then
    return key
  end

  if type(value) == 'string' and #value > 0 then
    return key..'=\''..value..'\''
  end

  if type(value) == 'number' then
    return key..'='..tostring(value)
  end

  if type(value) == 'boolean' and value == true then
    return key
  end

  error('invalid argument type: ' .. type(value) .. ' = ' .. value)
end

local function flatten(table)
  local result = {args = {}, input = ''}

  local function f(t)
    local keys = {}

    for k = 1, #t do
      keys[k] = true
      local v = t[k]

      if type(v) == 'table' then
        f(v)
      else
        result.args[#result.args + 1] = v
      end
    end

    for k, v in pairs(t) do
      if k == '__input' then
        result.input = result.input .. v
      elseif not keys[k] and k:sub(1, 1) ~= '_' then
        local key = '-'..k

        if #k > 1 then
          key = '-' ..key
        end

        result.args[#result.args + 1] = arg(key, v)
      end
    end

  end

  f(table)

  return result
end

local function command(cmd, ...)
  local prearg = {...}

  return function(...)
    local args = flatten({...})
    local s = cmd

    for _, v in ipairs(prearg) do
      s = s .. ' ' .. v
    end

    for _, v in pairs(args.args) do
      s = s .. ' ' .. v
    end

    local p = io.popen(s, 'r')

    if p ~= nil then
      local output = p:read('*a')
      local _, exit, status = p:close()

      local t = {
        __input = output,
        __exitcode = exit == 'exit' and status or 127,
        __signal = exit == 'signal' and status or 0,
      }

      local mt = {
        __index = function(self, k, ...)
          return _G[k]
        end,
        __tostring = function(self)
          return self.__input:match('^%s*(.-)%s*$')
        end
      }

      return setmetatable(t, mt)
    end
  end
end

local mt = getmetatable(_G) or {}
setmetatable(_G, mt)

mt.__index = function(t, cmd)
  return command(cmd)
end

M.sh = command

M['config:sh'] = function()
  return {
    visible = false,
    help = function()
      return [[ 
        1) M.sh("cli_command_name", ...arguments)
        2) M("cli_command_name")(...arguments)
        3) cli_command_name(...arguments)
        returns command result string
      ]]
    end
  }
end

setmetatable(M, {
  __call = function(_, cmd, ...)
    return command(cmd, ...)
  end
})

return M

