local M = {}

local ttai_characters_map = function(c)
  if c == '.' then
    return {
      '   ',
      '   ',
      '   ',
      '   ',
      '██╗',
      '╚═╝',
    }
  end

  if c == ',' then
    return {
      '   ',
      '   ',
      '   ',
      '   ',
      '▄█╗',
      '╚═╝',
    }
  end

  if c == ':' then
    return {
      '   ',
      '██╗',
      '╚═╝',
      '██╗',
      '╚═╝',
      '   ',
    }
  end

  if c == ';' then
    return {
      '   ',
      '██╗',
      '╚═╝',
      '▄█╗',
      '▀═╝',
      '   ',
    }
  end

  if c == '!' then
    return {
      '██╗',
      '██║',
      '██║',
      '╚═╝',
      '██╗',
      '╚═╝',
    }
  end

  if c == '?' then
    return {
      '██████╗ ',
      '╚════██╗',
      '  ▄███╔╝',
      '  ▀▀══╝ ',
      '  ██╗   ',
      '  ╚═╝   ',
    }
  end

  if c == '/' then
    return {
      '    ██╗',
      '   ██╔╝',
      '  ██╔╝ ',
      ' ██╔╝  ',
      '██╔╝   ',
      '╚═╝    ',
    }
  end

  if c == '_' then
    return {
      '        ',
      '        ',
      '        ',
      '        ',
      '███████╗',
      '╚══════╝',
    }
  end

  if c == '-' then
    return {
      '      ',
      '      ',
      '█████╗',
      '╚════╝',
      '      ',
      '      ',
    }
  end

  if c == '^' then
    return {
      ' ███╗ ',
      '██╔██╗',
      '╚═╝╚═╝',
      '      ',
      '      ',
      '      ',
    }
  end

  if c == '*' then
    return {
      '      ',
      '▄ ██╗▄',
      ' ████╗',
      '▀╚██╔▀',
      '  ╚═╝ ',
      '      ',
    }
  end

  if c == '$' then
    return {
      '▄▄███▄▄·',
      '██╔════╝',
      '███████╗',
      '╚════██║',
      '███████║',
      '╚═▀▀▀══╝',
    }
  end

  if c == '[' then
    return {
      '███╗',
      '██╔╝',
      '██║ ',
      '██║ ',
      '███╗',
      '╚══╝',
    }
  end

  if c == ']' then
    return {
      '███╗',
      '╚██║',
      ' ██║',
      ' ██║',
      '███║',
      '╚══╝',
    }
  end

  if c == '(' then
    return {
      ' ██╗',
      '██╔╝',
      '██║ ',
      '██║ ',
      '╚██╗',
      ' ╚═╝',
    }
  end

  if c == ')' then
    return {
      '██╗ ',
      '╚██╗',
      ' ██║',
      ' ██║',
      '██╔╝',
      '╚═╝ ',
    }
  end

  if c == '0' then
    return {
      ' ██████╗ ',
      '██╔═████╗',
      '██║██╔██║',
      '████╔╝██║',
      '╚██████╔╝',
      ' ╚═════╝ ',
    }
  end

  if c == '1' then
    return {
      ' ██╗',
      '███║',
      '╚██║',
      ' ██║',
      ' ██║',
      ' ╚═╝',
    }
  end

  if c == '2' then
    return {
      '██████╗ ',
      '╚════██╗',
      ' █████╔╝',
      '██╔═══╝ ',
      '███████╗',
      '╚══════╝',    }
  end

  if c == '3' then
    return {
      '██████╗ ',
      '╚════██╗',
      ' █████╔╝',
      ' ╚═══██╗',
      '██████╔╝',
      '╚═════╝ ',
    }
  end

  if c == '4' then
    return {
      '██╗  ██╗',
      '██║  ██║',
      '███████║',
      '╚════██║',
      '     ██║',
      '     ╚═╝',
    }
  end

  if c == '5' then
    return {
      '███████╗',
      '██╔════╝',
      '███████╗',
      '╚════██║',
      '███████║',
      '╚══════╝',
    }
  end

  if c == '6' then
    return {
      ' ██████╗ ',
      '██╔════╝ ',
      '███████╗ ',
      '██╔═══██╗',
      '╚██████╔╝',
      ' ╚═════╝ ',
    }
  end

  if c == '7' then
    return {
      '███████╗',
      '╚════██║',
      '    ██╔╝',
      '   ██╔╝ ',
      '   ██║  ',
      '   ╚═╝  ',
    }
  end

  if c == '8' then
    return {
      ' █████╗ ',
      '██╔══██╗',
      '╚█████╔╝',
      '██╔══██╗',
      '╚█████╔╝',
      ' ╚════╝ ',
    }
  end

  if c == '9' then
    return {
      ' █████╗ ',
      '██╔══██╗',
      '╚██████║',
      ' ╚═══██║',
      ' █████╔╝',
      ' ╚════╝ ',
    }
  end

  if c == 'A' or c == 'a' then
    return {
      ' █████╗ ',
      '██╔══██╗',
      '███████║',
      '██╔══██║',
      '██║  ██║',
      '╚═╝  ╚═╝',
    }
  end

  if c == 'B' or c == 'b' then
    return {
      '██████╗ ',
      '██╔══██╗',
      '██████╔╝',
      '██╔══██╗',
      '██████╔╝',
      '╚═════╝ ',
    }
  end

  if c == 'C' or c == 'c' then
    return {
      ' ██████╗',
      '██╔════╝',
      '██║     ',
      '██║     ',
      '╚██████╗',
      ' ╚═════╝',
    }
  end

  if c == 'D' or c == 'd' then
    return {
      '██████╗ ',
      '██╔══██╗',
      '██║  ██║',
      '██║  ██║',
      '██████╔╝',
      '╚═════╝ ',
    }
  end

  if c == 'E' or c == 'e' then
    return {
      '███████╗',
      '██╔════╝',
      '█████╗  ',
      '██╔══╝  ',
      '███████╗',
      '╚══════╝',
    }
  end

  if c == 'F' or c == 'f' then
    return {
      '███████╗',
      '██╔════╝',
      '█████╗  ',
      '██╔══╝  ',
      '██║     ',
      '╚═╝     ',
    }
  end

  if c == 'G' or c == 'g' then
    return {
      ' ██████╗ ',
      '██╔════╝ ',
      '██║  ███╗',
      '██║   ██║',
      '╚██████╔╝',
      ' ╚═════╝ ',
    }
  end

  if c == 'H' or c == 'h' then
    return {
      '██╗  ██╗',
      '██║  ██║',
      '███████║',
      '██╔══██║',
      '██║  ██║',
      '╚═╝  ╚═╝',
    }
  end

  if c == 'I' or c == 'i' then
    return {
      '██╗',
      '██║',
      '██║',
      '██║',
      '██║',
      '╚═╝',
    }
  end

  if c == 'J' or c == 'j' then
    return {
      '     ██╗',
      '     ██║',
      '     ██║',
      '██   ██║',
      '╚█████╔╝',
      ' ╚════╝ ',
    }
  end

  if c == 'K' or c == 'k' then
    return {
      '██╗  ██╗',
      '██║ ██╔╝',
      '█████╔╝ ',
      '██╔═██╗ ',
      '██║  ██╗',
      '╚═╝  ╚═╝',
    }
  end

  if c == 'L' or c == 'l' then
    return {
      '██╗     ',
      '██║     ',
      '██║     ',
      '██║     ',
      '███████╗',
      '╚══════╝',
    }
  end

  if c == 'M' or c == 'm' then
    return {
      '███╗   ███╗',
      '████╗ ████║',
      '██╔████╔██║',
      '██║╚██╔╝██║',
      '██║ ╚═╝ ██║',
      '╚═╝     ╚═╝',
    }
  end

  if c == 'N' or c == 'n' then
    return {
      '███╗   ██╗',
      '████╗  ██║',
      '██╔██╗ ██║',
      '██║╚██╗██║',
      '██║ ╚████║',
      '╚═╝  ╚═══╝',
    }
  end

  if c == 'O' or c == 'o' then
    return {
      ' ██████╗ ',
      '██╔═══██╗',
      '██║   ██║',
      '██║   ██║',
      '╚██████╔╝',
      ' ╚═════╝ ',
    }
  end

  if c == 'P' or c == 'p' then
    return {
      '██████╗ ',
      '██╔══██╗',
      '██████╔╝',
      '██╔═══╝ ',
      '██║     ',
      '╚═╝     ',
    }
  end

  if c == 'Q' or c == 'q' then
    return {
      ' ██████╗ ',
      '██╔═══██╗',
      '██║   ██║',
      '██║▄▄ ██║',
      '╚██████╔╝',
      ' ╚══▀▀═╝ ',
    }
  end

  if c == 'R' or c == 'r' then
    return {
      '██████╗ ',
      '██╔══██╗',
      '██████╔╝',
      '██╔══██╗',
      '██║  ██║',
      '╚═╝  ╚═╝',
    }
  end

  if c == 'S' or c == 's' then
    return {
      '███████╗',
      '██╔════╝',
      '███████╗',
      '╚════██║',
      '███████║',
      '╚══════╝',
    }
  end

  if c == 'T' or c == 't' then
    return {
      '████████╗',
      '╚══██╔══╝',
      '   ██║   ',
      '   ██║   ',
      '   ██║   ',
      '   ╚═╝   ',
    }
  end

  if c == 'U' or c == 'u' then
    return {
      '██╗   ██╗',
      '██║   ██║',
      '██║   ██║',
      '██║   ██║',
      '╚██████╔╝',
      ' ╚═════╝ ',
    }
  end

  if c == 'V' or c == 'v' then
    return {
      '██╗   ██╗',
      '██║   ██║',
      '██║   ██║',
      '╚██╗ ██╔╝',
      ' ╚████╔╝ ',
      '  ╚═══╝  ',
    }
  end

  if c == 'W' or c == 'w' then
    return {
      '██╗    ██╗',
      '██║    ██║',
      '██║ █╗ ██║',
      '██║███╗██║',
      '╚███╔███╔╝',
      ' ╚══╝╚══╝ ',
    }
  end

  if c == 'X' or c == 'x' then
    return {
      '██╗  ██╗',
      '╚██╗██╔╝',
      ' ╚███╔╝ ',
      ' ██╔██╗ ',
      '██╔╝ ██╗',
      '╚═╝  ╚═╝',
    }
  end

  if c == 'Y' or c == 'y' then
    return {
      '██╗   ██╗',
      '╚██╗ ██╔╝',
      ' ╚████╔╝ ',
      '  ╚██╔╝  ',
      '   ██║   ',
      '   ╚═╝   ',
    }
  end

  if c == 'Z' or c == 'z' then
    return {
      '███████╗',
      '╚══███╔╝',
      '  ███╔╝ ',
      ' ███╔╝  ',
      '███████╗',
      '╚══════╝',
    }
  end

  return {
    '  ',
    '  ',
    '  ',
    '  ',
    '  ',
    '  ',
  }
end

M.ttai = function(text)
  local result = {
    '',
    '',
    '',
    '',
    '',
    '',
  }

  if type(text) ~= 'string' then
    return result
  end

  for c in text:gmatch '.' do
    local ascii_img_table = ttai_characters_map(c)

    for k, v in pairs(ascii_img_table) do
      result[k] = result[k] .. v
    end
  end

  return result
end

M['config:ttai'] = function()
  return {
    visible = true,
    help = function()
      return [[ 
        1) M.transform('string_to_transform')
        returns table with 6 strings that represents string image
      ]]
    end,
    print = function()
      return {
        indent_value = '',
        show_brackets = false,
        show_table_keys = false,
      }
    end
  }
end

return M

