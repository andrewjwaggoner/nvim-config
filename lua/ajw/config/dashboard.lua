local dashboard = {}

local function padLines(lines, lhs_padding, rhs_padding)
  for i=1, #lines do
    lines[i] = lhs_padding + lines[i] + rhs_padding
  end

  return lines
end

-- https://stackoverflow.com/questions/25527048/split-string-in-equal-chunks-in-lua
local function splitByChunk(text, chunkSize)
    local s = {}
    for i=1, #text, chunkSize do
        s[#s+1] = text:sub(i,i+chunkSize - 1)
    end
    return s
end

local function get_daily_quote()
  local quote_2 = "test test test"
  local frog_quote = 'If it’s your job to eat a frog, it’s best to do it first thing in the morning. And If it’s your job to eat two frogs, it’s best to eat the biggest one first.'
  return quote_2
end

function dashboard.config()
  local db = require('dashboard')

  db.custom_header = { -- 55 characters wide
    '',
    ' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
    ' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
    ' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
    ' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
    ' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
    ' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
    '',
    '        If it’s your job to eat a frog, it’s best       ',
    '        to do it first thing in the morning. And If     ',
    '        it’s your job to eat two frogs, it’s best       ',
    '        to eat the biggest one first.                   ',
    '',
  }

  db.custom_center = {
    { icon = '  ',
      desc = 'Update Plugins                          ',
      shortcut = 'SPC p u' },
    { icon = '  ',
      desc = 'Browse Neovim config files              ',
      shortcut = 'SPC b d' },
    { icon = '  ',
      desc = 'Browse Recent                           ',
      shortcut = 'SPC b r' },
    { icon = '  ',
      desc = 'Toggle File Tree                        ',
      shortcut = 'SPC t' },
  }
end

return dashboard
