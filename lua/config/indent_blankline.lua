local indent_blankline = {}

function indent_blankline.config()
  local highlight = {
    "RainbowViolet",
    "RainbowBlue",
    "RainbowCyan",
    "RainbowGreen",
    "RainbowOrange",
    "RainbowRed",
    "RainbowYellow",
  }

  local hooks = require "ibl.hooks"
  -- create the highlight groups in the highlight setup hook, so they are reset
  -- every time the colorscheme changes
  hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
    vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
    vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
    vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
    vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
    vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
    vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5E5AF" })
  end)

  require("ibl").setup { indent = { highlight = highlight } }
end

function indent_blankline.lazy()
  return {
    'lukas-reineke/indent-blankline.nvim',
    config = indent_blankline.config,
    lazy = false }
end

return indent_blankline
