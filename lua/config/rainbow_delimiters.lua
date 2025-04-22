local rainbow = {}

function rainbow.config()
  local rainbow_delimiters = require('rainbow-delimiters')

  vim.g.rainbow_delimiters = {
    strategy = {
        [''] = rainbow_delimiters.strategy['global'],
        vim = rainbow_delimiters.strategy['local'],
    },
    query = {
        [''] = 'rainbow-delimiters',
        lua = 'rainbow-blocks',
    },
    priority = {
        [''] = 110,
        lua = 210,
    },
    highlight = {
        'RainbowDelimiterRed',
        'RainbowDelimiterYellow',
        'RainbowDelimiterBlue',
        'RainbowDelimiterOrange',
        'RainbowDelimiterGreen',
        'RainbowDelimiterViolet',
        'RainbowDelimiterCyan',
    },
  }
end

function rainbow.lazy()
  return {
    'hiphish/rainbow-delimiters.nvim',
    ft = { "lua", "vim", 'clojure', 'fennel', 'racket', 'lisp' },
    config = rainbow.config,
    lazy = true }
end

return rainbow
