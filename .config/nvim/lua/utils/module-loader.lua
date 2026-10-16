local M = {}

local function is_blacklisted(blacklist, module_name)
  for _, name in ipairs(blacklist) do
    if name == module_name then
      return true
    end
  end

  return false
end

M.load_modules = function(modules_folder_name, blacklist)
  local dir = vim.fn.stdpath('config') .. '/lua/' .. modules_folder_name
  local files = {}

  for name, filetype in vim.fs.dir(dir) do
    if filetype == 'file'
      and name:match('%.lua$')
      and name ~= 'init.lua'
      and name ~= 'index.lua'
    then
      files[#files + 1] = name
    end
  end

  table.sort(files)

  local modules = {}
  for _, filename in ipairs(files) do
    local module_name = filename:gsub('%.lua$', '')

    if not is_blacklisted(blacklist, module_name) then
      modules[#modules + 1] = require(modules_folder_name .. '.' .. module_name)
    end
  end

  return modules
end

return M

