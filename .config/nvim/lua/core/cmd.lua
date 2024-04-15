local u = require 'core.utils'

return {
  { n = 'Tab', f = u.set_tab_size, o = { nargs = 1 } },
  { n = 'FileFormat', f = u.set_file_format, o = { nargs = 1 } },
  { n = 'CopyName', f = u.copy_file_name, o = { nargs = 0 } },
  { n = 'CopyPath', f = u.copy_file_path, o = { nargs = 0 } },
  { n = 'CopyFullPath', f = u.copy_file_full_path, o = { nargs = 0 } },
}

