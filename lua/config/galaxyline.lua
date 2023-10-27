local galaxyline = {}

function galaxyline.config()
  local status_ok, gl = pcall(require, 'galaxyline')
  local _, color_theme = pcall(require, 'galaxyline.theme')
  local colors = color_theme.default
  local _, condition = pcall(require, 'galaxyline.condition')
  if not status_ok then
    return
  end

  gl.short_line_list = { 'NvimTree', 'Lazy' }

local hi_str = vim.api.nvim_exec('hi Normal', true)
colors.fg  = hi_str:match('guifg=(#[%x]+)') or nil
colors.bg  = hi_str:match('guibg=(#[%x]+)') or nil
colors.fg = hi_str:match('gui=([%a,]+)') or nil -- currently not mapped


  gl.section.left[1] = {
    RainbowRed = {
      provider = function()
        return '█ '
      end,
      highlight = { colors.blue, colors.bg },
    },
  }

  gl.section.left[2] = {
    ViMode = {
      provider = function()
        -- auto change color according the vim mode
        local mode_color = {
          ['!'] = colors.red,
          [''] = colors.blue,
          [''] = colors.orange,
          ['r?'] = colors.cyan,
          c = colors.magenta,
          ce = colors.red,
          cv = colors.red,
          i = colors.green,
          ic = colors.yellow,
          n = colors.red,
          no = colors.red,
          r = colors.cyan,
          R = colors.violet,
          rm = colors.cyan,
          Rv = colors.violet,
          s = colors.orange,
          S = colors.orange,
          t = colors.red,
          v = colors.blue,
          V = colors.blue,
        }
        vim.api.nvim_command('hi GalaxyViMode guifg=' .. mode_color[vim.fn.mode()] .. ' guibg=' .. colors.bg)
        return '  '
      end,
    },
  }

  gl.section.left[3] = {
    FileSize = {
      condition = condition.buffer_not_empty,
      highlight = { colors.fg, colors.bg },
      provider = 'FileSize',
    },
  }

  gl.section.left[4] = {
    FileIcon = {
      condition = condition.buffer_not_empty,
      highlight = { require('galaxyline.provider_fileinfo').get_file_icon_color, colors.bg },
      provider = 'FileIcon',
    },
  }

  gl.section.left[5] = {
    FileName = {
      condition = condition.buffer_not_empty,
      highlight = { colors.fg, colors.bg, 'bold' },
      provider = 'FileName',
    },
  }

  gl.section.left[6] = {
    LineInfo = {
      highlight = { colors.fg, colors.bg },
      provider = 'LineColumn',
      separator = ' ',
      separator_highlight = { 'NONE', colors.bg },
    },
  }

  gl.section.left[7] = {
    PerCent = {
      highlight = { colors.fg, colors.bg, 'bold' },
      provider = 'LinePercent',
      separator = ' ',
      separator_highlight = { 'NONE', colors.bg },
    },
  }

  gl.section.left[8] = {
    DiagnosticError = {
      highlight = { colors.red, colors.bg },
      icon = '  ',
      provider = 'DiagnosticError',
    },
  }

  gl.section.left[9] = {
    DiagnosticWarn = {
      highlight = { colors.yellow, colors.bg },
      icon = '  ',
      provider = 'DiagnosticWarn',
    },
  }

  gl.section.left[10] = {
    DiagnosticHint = {
      highlight = { colors.cyan, colors.bg },
      icon = '  ',
      provider = 'DiagnosticHint',
    },
  }

  gl.section.left[11] = {
    DiagnosticInfo = {
      highlight = { colors.blue, colors.bg },
      icon = '  ',
      provider = 'DiagnosticInfo',
    },
  }

  gl.section.mid[1] = {
    ShowLspClient = {
      condition = function()
        local tbl = { ['dashboard'] = true, [''] = true }
        if tbl[vim.bo.filetype] then
          return false
        end
        return true
      end,
      highlight = { colors.yellow, colors.bg, 'bold' },
      icon = ' LSP:',
      provider = 'GetLspClient',
    },
  }

  gl.section.right[1] = {
    FileEncode = {
      condition = condition.hide_in_width,
      highlight = { colors.green, colors.bg, 'bold' },
      provider = 'FileEncode',
      separator = ' ',
      separator_highlight = { 'NONE', colors.bg },
    },
  }

  gl.section.right[2] = {
    FileFormat = {
      condition = condition.hide_in_width,
      highlight = { colors.green, colors.bg, 'bold' },
      provider = 'FileFormat',
      separator = ' ',
      separator_highlight = { 'NONE', colors.bg },
    },
  }

  gl.section.right[3] = {
    GitIcon = {
      provider = function()
        return '  '
      end,
      condition = condition.check_git_workspace,
      highlight = { colors.violet, colors.bg, 'bold' },
      separator = ' ',
      separator_highlight = { 'NONE', colors.bg },
    },
  }

  gl.section.right[4] = {
    GitBranch = {
      condition = condition.check_git_workspace,
      highlight = { colors.violet, colors.bg, 'bold' },
      provider = 'GitBranch',
    },
  }

  gl.section.right[5] = {
    Separator = {
      provider = function()
        return ' '
      end,
    },
  }

  gl.section.right[6] = {
    DiffAdd = {
      condition = condition.hide_in_width,
      highlight = { colors.green, colors.bg },
      icon = '  ',
      provider = 'DiffAdd',
    },
  }

  gl.section.right[7] = {
    DiffModified = {
      condition = condition.hide_in_width,
      highlight = { colors.orange, colors.bg },
      icon = ' 柳',
      provider = 'DiffModified',
    },
  }

  gl.section.right[8] = {
    DiffRemove = {
      condition = condition.hide_in_width,
      highlight = { colors.red, colors.bg },
      icon = '  ',
      provider = 'DiffRemove',
    },
  }

  gl.section.right[9] = {
    RainbowBlue = {
      provider = function()
        return ' █'
      end,
      highlight = { colors.blue, colors.bg },
    },
  }

  gl.section.short_line_left[1] = {
    BufferType = {
      highlight = { colors.blue, colors.bg, 'bold' },
      provider = 'FileTypeName',
      separator = ' ',
      separator_highlight = { 'NONE', colors.bg },
    },
  }

  gl.section.short_line_left[2] = {
    SFileName = {
      condition = condition.buffer_not_empty,
      highlight = { colors.fg, colors.bg, 'bold' },
      provider = 'SFileName',
    },
  }

  gl.section.short_line_right[1] = {
    BufferIcon = {
      highlight = { colors.fg, colors.bg },
      provider = 'BufferIcon',
    },
  }

end

function galaxyline.lazy()
  return { 
    'glepnir/galaxyline.nvim',
    galaxyline.package_name, 
    config = galaxyline.config, 
    dependencies='kyazdani42/nvim-web-devicons'
  }
end

return galaxyline
