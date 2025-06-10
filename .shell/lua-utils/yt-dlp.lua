local sh = require 'lua-utils.sh'
local prompt = require ('lua-utils.user-interaction').prompt

local M = {}

M.yt_dlp = function(video_url, file_path)
  if video_url == nil then
    video_url = prompt('Video URL: ', true)
  end

  if file_path == nil then
    file_path = prompt('Downloaded video file path: ', true)
  end

  print(sh('yt-dlp')('--list-formats ' .. '"' .. video_url .. '"'))

  local format = prompt('Choose file format (default: 720): ')
  format = format or '720'

  print(sh('yt-dlp')('-o ' .. file_path .. ' -f "bestvideo[height<=' .. format .. ']+bestaudio" ' .. '"' .. video_url .. '"'))
end

M['config:yt_dlp'] = function()
  return {
    visible = true,
    help = function()
      return [[ 
        1) M.yt_dlp(optional_video_url, optional_file_path)
        returns status string
      ]]
    end
  }
end

return M

