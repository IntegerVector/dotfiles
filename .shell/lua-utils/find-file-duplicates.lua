local sh = require 'lua-utils.sh'
local prompt = require 'lua-utils.prompt'.prompt

local M = {}

local os_name = tostring(
  sh('uname')('-s')
)

local function expand_tilde(path)
  if path:match('^~') then
    local home = os.getenv('HOME')
    if not home then
      print('Error: HOME environment variable not set')
      os.exit(1)
    end
    return home .. path:sub(2)
  end
  return path
end

local function get_file_hash(filepath)
  local cmd
  
  if os_name == 'Darwin' then
    -- macOS
    cmd = 'md5 -q \'' .. filepath:gsub('\'', '\'\\\'\'') .. '\''
  else
    -- Linux and others
    cmd = 'md5sum \'' .. filepath:gsub('\'', '\'\\\'\'') .. '\' | awk \'{print $1}\''
  end
  
  local handle = io.popen(cmd)
  if not handle then return nil end
  local hash = handle:read('*a'):match('^%s*(.-)%s*$')
  handle:close()
  return hash
end

local function delete_file(filepath)
  local cmd = 'rm \'' .. filepath:gsub('\'', '\'\\\'\'') .. '\''
  local result = os.execute(cmd)
  return result == 0
end

local function prompt_delete(paths)
  print('Keep which file? (Enter number, or 0 to keep all):')
  for i, path in ipairs(paths) do
    print('  ' .. i .. ') ' .. path)
  end
  
  io.write('Choice: ')
  local choice = tonumber(io.read('*l'))
  
  if not choice or choice == 0 or choice < 1 or choice > #paths then
    print('Keeping all files in this group.\n')
    return
  end
  
  -- Delete all except the chosen one
  for i, path in ipairs(paths) do
    if i ~= choice then
      if delete_file(path) then
        print('✓ Deleted: ' .. path)
      else
        print('✗ Failed to delete: ' .. path)
      end
    else
      print('✓ Keeping: ' .. path)
    end
  end
  print('')
end

local function find_duplicates(directory, delete_mode)
  local hashes = {}
  
  -- Use 'find' command to recursively list files
  local handle = io.popen('find \'' .. directory:gsub('\'', '\'\\\'\'') .. '\' -type f')
  if not handle then
    print('Error: Cannot access directory')
    os.exit(1)
  end
  
  for filepath in handle:lines() do
    local hash = get_file_hash(filepath)
    if hash then
      if not hashes[hash] then
        hashes[hash] = {}
      end
      table.insert(hashes[hash], filepath)
    end
  end
  handle:close()
  
  -- Print results
  local duplicate_count = 0
  local duplicates_list = {}
  
  for hash, paths in pairs(hashes) do
    if #paths > 1 then
      duplicate_count = duplicate_count + 1
      table.insert(duplicates_list, paths)
      print('Duplicate group #' .. duplicate_count .. ':')
      for _, path in ipairs(paths) do
        print('  ' .. path)
      end
      print('')
    end
  end
  
  if duplicate_count == 0 then
    print('No duplicates found.')
    return
  else
    print('Found ' .. duplicate_count .. ' duplicate groups.\n')
  end
  
  if delete_mode then
    for _, paths in ipairs(duplicates_list) do
      prompt_delete(paths)
    end
  end
end

M['find-file-duplicates'] = function(in_path, delete_duplicates)
  if in_path == nil then
    in_path = prompt('Folder to check: ', true)
  end

  if delete_duplicates == nil then
    delete_duplicates = prompt('Do you want to delete duplicates (y/n): ', true)
  end
  
  if delete_duplicates == 'n' then
    delete_duplicates = false
  else
    delete_duplicates = true
  end

  find_duplicates(expand_tilde(in_path), delete_duplicates)
end

M['config:find-file-duplicates'] = function()
  return {
    visible = true,
    help = function()
      return [[
        1) M.find-file-duplicates(in_path)
        returns status string
      ]]
    end
  }
end

return M

