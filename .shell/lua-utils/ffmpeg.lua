local sh = require 'lua-utils.sh'
local prompt = require ('lua-utils.user-interaction').prompt

local M = {}

M.video_to_mp4 = function(in_path, out_path)
  if in_path == nil then
    in_path = prompt('File path: ', true)
  end

  if out_path == nil then
    out_path = prompt('Result file path: ', true)
  end

  return sh('ffmpeg')('-i ' .. in_path .. ' -c:v libx264 -c:a aac ' .. out_path)
end

M['config:video_to_mp4'] = function()
  return {
    visible = true,
    help = function()
      return [[ 
        1) M.webm_to_mp4(optional_in_path, optional_out_path)
        returns status string
      ]]
    end
  }
end

M.video_remove_sound = function(in_path, out_path)
  if in_path == nil then
    in_path = prompt('File path: ', true)
  end

  if out_path == nil then
    out_path = prompt('Result file path: ', true)
  end

  return sh('ffmpeg')('-i ' .. in_path .. ' -c copy -an ' .. out_path)
end

M['config:video_remove_sound'] = function()
  return {
    visible = true,
    help = function()
      return [[ 
        1) M.remove_sound(optional_in_path, optional_out_path)
        returns status string
      ]]
    end
  }
end

M.video_to_gif = function(in_path, out_path, fps, skip_sec)
  if in_path == nil then
    in_path = prompt('File path: ', true)
  end

  if out_path == nil then
    out_path = prompt('Result file path: ', true)
  end

  if fps == nil then
    fps = prompt('FPS: ', true)
  end

  if skip_sec == nil then
    skip_sec = prompt('Skip first seconds (put 0 if not needed): ', true)
  end

  return sh('ffmpeg')('-i ' .. in_path .. ' -ss ' .. skip_sec .. ' -vf "fps=' .. fps .. '" -loop 0 ' .. out_path)
end

M['config:video_to_gif'] = function()
  return {
    visible = true,
    help = function()
      return [[ 
        1) M.mp4_to_gif(optional_in_path, optional_out_path, optional_fps, optional_skip_sec)
        returns status string
      ]]
    end
  }
end

return M

