local treesitter = {}

function treesitter.config()
  vim.api.nvim_command('set foldmethod=expr')
  vim.api.nvim_command('set foldexpr=nvim_treesitter#foldexpr()')
  require 'nvim-treesitter.configs'.setup {
    ensure_installed = "all",
    ignore_install = { 'phpdoc' },
    highlight = {
      enable = true,
    },
    compilers = { "clang" },
    textobjects = {
      select = {
        enable = true,
        keymaps = {
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["ac"] = "@class.outer",
          ["ic"] = "@class.inner",
        },
      },
    },
  }
end
function treesitter.lazy()
  return {
    'nvim-treesitter/nvim-treesitter',
    lazy = true,
    config = treesitter.config,
    event='BufRead', build=':TSUpdate' 
  }
end

return treesitter
