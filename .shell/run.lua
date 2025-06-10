local fancy = require('lua-utils.fancy-print')
local os_name = tostring(
  require('lua-utils.os').get_os_name()
)

if os_name ~= 'Linux' and os_name ~= 'Darwin' then
  print('Only Linux or MacOS supported')
  return
end

if not table.unpack then
  table.unpack = unpack
end

local lua_utils = {}
local lua_utils_config = {}
local all_utils_paths = io.popen('cd ~/.shell/lua-utils && find . -type f | grep .lua'):lines()

for path in all_utils_paths do
  local module_file = string.gsub(string.gsub(path, '.lua', ''), './', '')
  local module = require('lua-utils.' .. module_file)

  for k, v in pairs(module) do
    if type(v) == 'function' then
      if string.find(k, 'config:', 1, true) ~= nil then
        lua_utils_config[string.gsub(k, 'config:', '')] = v
      else
        lua_utils[k] = v
      end
    end
  end
end

for k, _ in pairs(lua_utils) do
  if type(lua_utils_config[k]) == 'function' then
    local util_config = lua_utils_config[k]()

    if util_config.visible ~= true then
      lua_utils[k] = nil
    end
  else
    lua_utils[k] = nil
  end
end

lua_utils.help = function(...)
  local help_args = {...}
  local print_util_help = function(util_name)
    print('')
    if type(lua_utils[util_name]) == 'function' then
      print('Util: "' .. util_name .. '"')
    else
      print('Util: "' .. util_name .. '" not found')
    end
    if type(lua_utils_config[util_name]) == 'function' then
      local util_config = lua_utils_config[util_name]()

      if type(util_config.help) == 'function' then
        print('Usage: ' .. util_config.help())
      else
        print('Util: "' .. util_name .. '" related help data not found')
      end
    else
        print('Util: "' .. util_name .. '" related config data not found')
    end
    print('')
  end

  if #help_args == 0 then
    for u, _ in pairs(lua_utils) do
      print_util_help(u)
    end
  else
    for _, u in pairs(help_args) do
      print_util_help(u)
    end
  end
end

lua_utils_config.help = function()
  return {
    visible = false,
    help = function()
      return [[ 
        1) M.help()
        Returns utils help information string
      ]]
    end
  }
end

if #arg == 0 then
  for k, v in pairs(lua_utils) do
    if type(v) == 'function' then
      print(k)
    end
  end
  return
end

local UTIL_NAME_INDEX = 1
local selected_util_name = arg[UTIL_NAME_INDEX]
table.remove(arg, UTIL_NAME_INDEX) -- remove util name from arg

if type(lua_utils[selected_util_name]) == 'function' then
  local result = lua_utils[selected_util_name](table.unpack(arg))

  if result ~= nil then
    local print_options
    if type(lua_utils_config[selected_util_name]) == 'function' then
      local util_config = lua_utils_config[selected_util_name]()

      if type(util_config.print) == 'function' then
        print_options = util_config.print()
      end
    end
    fancy.print(result, print_options)
  end

else
  print('Util: "' .. selected_util_name .. '" not found')
end

