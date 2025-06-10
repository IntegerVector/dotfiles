local M = {}

local show_prompt = function(prompt_text)
  if prompt_text ~= nil then
    io.write(prompt_text)
  end

  return io.read()
end

M.prompt = function(prompt_text, skip_empty_string)
  if skip_empty_string then
    local user_input = ''
    while user_input == '' do
      user_input = show_prompt(prompt_text)
    end

    return user_input
  else
    return show_prompt(prompt_text)
  end
end

M['config:prompt'] = function()
  return {
    visible = false,
    help = function()
      return [[ 
        1) M.prompt('optional prompt text', optional_skip_empty_string_boolean)
        returns user input string
      ]]
    end
  }
end

return M

