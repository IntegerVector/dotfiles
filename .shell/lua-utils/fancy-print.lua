local M = {}

local construct_indent = function(indent_size, indent_value)
  indent_size = indent_size or 0
  indent_value = indent_value or '  '

  local indent_str = ''

  if indent_size > 0 then
    while indent_size ~= 0 do
      indent_str = indent_str .. indent_value
      indent_size = indent_size - 1
    end
  end

  return indent_str
end

local fancy_print
fancy_print = function(key, value, indent_size, indent_value, show_brackets, show_table_keys)
  local indent = construct_indent(indent_size, indent_value)

  if type(value) ~= 'table' and key == nil then
    print(indent .. tostring(value))
    return
  end

  if type(value) ~= 'table' and key ~= nil then
    if show_table_keys then
      print(indent .. tostring(key) .. ' = ' .. tostring(value))
    else
      print(indent .. tostring(value))
    end
    return
  end

  if show_brackets then
    if key == nil then
      print(indent .. '{')
    else
      print(indent .. tostring(key) .. ' = ' .. '{')
    end
  end

  for k, v in pairs(value) do
    fancy_print(k, v, indent_size + 1, indent_value, show_brackets, show_table_keys)
  end

  if show_brackets then
    print(indent .. '},')
  end
end

M.print = function(value, options)
  local default_options = {
    indent_value = '  ',
    show_brackets = true,
    show_table_keys = true,
    transform = function(v)
      return v
    end
  }

  if type(options) ~= 'table' then
    options = default_options
  end

  if type(options.indent_value) ~= 'string' then
    options.indent_value = '  '
  end
  if type(options.show_brackets) ~= 'boolean' then
    options.show_brackets = true
  end
  if type(options.show_table_keys) ~= 'boolean' then
    options.show_table_keys = true
  end

  if type(options.transform) == 'function' then
    fancy_print(nil, options.transform(value), 0, options.indent_value, options.show_brackets, options.show_table_keys)
  else
    fancy_print(nil, value, 0, options.indent_value, options.show_brackets, options.show_table_keys)
  end
end

M['config:print'] = function()
  return {
    visible = false,
    help = function()
      return [[ 
        1) M.print(any_value, options)

        options = {
          indent_value = '  ',
          show_brackets = true,
          show_table_keys = true,
        }

        prints value to console
        returns nothing
      ]]
    end
  }
end

return M

