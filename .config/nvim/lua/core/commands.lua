local file = require "core.file"
local editor = require "core.editor"

return {
  { name = "Tab", command = editor.set_tab_size, options = { nargs = 1 } },
  { name = "FileFormat", command = file.set_format, options = { nargs = 1 } },
  { name = "CopyName", command = file.copy_name, options = { nargs = 0 } },
  { name = "CopyPath", command = file.copy_path, options = { nargs = 0 } },
  { name = "CopyFullPath", command = file.copy_full_path, options = { nargs = 0 } },
}

