local lualine = { package_name = "nvim-lualine/lualine.nvim" }

lualine.config = function()
  require('lualine').setup {
    options = {
      icons_enabled = true,
      theme = 'auto',
      component_separators = { left = '', right = ''},
      section_separators = { left = '', right = ''},
      disabled_filetypes = {
        statusline = {},
        winbar = {},
      },
      ignore_focus = {},
      always_divide_middle = true,
      globalstatus = false,
      refresh = {
        statusline = 1000,
        tabline = 1000,
        winbar = 1000,
      }
    },
    sections = {
      lualine_a = {'mode'},
      lualine_b = {'branch', 'diff', 'diagnostics'},
      lualine_c = {'filename'},
      lualine_x = {"require'lsp-status'.status()", 'encoding'},
      lualine_y = {'progress'},
      lualine_z = {'location'}
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {'filename'},
      lualine_x = {'location'},
      lualine_y = {},
      lualine_z = {}
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {}
  }
end

lualine.opts = function()
--   local trouble = require("trouble")
--   local symbols = trouble.statusline({
--     mode = "lsp_document_symbols",
--     groups = {},
--     title = false,
--     filter = { range = true },
--     format = "{kind_icon}{symbol.name:Normal}",
--     -- The following line is needed to fix the background color
--     -- Set it to the lualine section you want to use
--     hl_group = "lualine_c_normal",
--   })
--   table.insert(opts.sections.lualine_c, {
--     symbols.get,
--     cond = symbols.has,
--   })
end

lualine.lazy = function()
  return {
    lualine.package_name,
    config = lualine.config,
    lazy = false,
    name = "lualine",
    opts = lualine.opts,
    priority = 1000,
  }
end

return lualine
