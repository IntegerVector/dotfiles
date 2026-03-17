local sh = require 'lua-utils.sh'
local prompt = require ('lua-utils.user-interaction').prompt

local M = {}

M['scraper'] = function(url, output_folder , output_file, is_loopped, start_index, end_index, index_prefix, index_postfix)
  if url == nil then
    url = prompt('URL: ', true)
  end

  if output_folder == nil then
    output_folder = prompt('Output folder path (with "/" in the end): ', true)
  end

  if output_file == nil then
    output_file = prompt('Output file name: ', true)
  end

  if is_loopped == 'false' or is_loopped == 'n' then
    sh('curl')(url .. ' -o ' .. output_folder .. output_file)
    return
  end

  if is_loopped == nil then
    is_loopped = prompt('Do you want to loop script? (y/n): ', true)
    if is_loopped == 'n' then
      sh('curl')(url .. ' -o ' .. output_folder .. output_file)
      return
    end
  end

  if start_index == nil then
    start_index = tonumber(prompt('Specify start index: ', true))
  else
    start_index = tonumber(start_index)
  end

  if end_index == nil then
    end_index = tonumber(prompt('Specify end index: ', true))
  else
    end_index = tonumber(end_index)
  end

  if index_prefix == nil then
    index_prefix = prompt('Specify index prefix (will be placed after url, before index): ')
    index_prefix = index_prefix == '' and '' or index_prefix
  end

  if index_postfix == nil then
    index_postfix = prompt('Specify index postfix (will be placed after index): ')
    index_postfix = index_postfix == '' and '' or index_postfix
  end

  repeat
    sh('curl')(url .. index_prefix .. start_index .. index_postfix .. ' -o ' .. output_folder .. start_index .. output_file)
    start_index = start_index + 1
  until start_index > end_index
end


M['config:scraper'] = function()
  return {
    visible = true,
    help = function()
      return [[ 
        1) M.get(url, output_path, is_loopped, start_index, end_index, index_prefix, index_postfix)

        save data from web to a file
      ]]
    end
  }
end

return M

