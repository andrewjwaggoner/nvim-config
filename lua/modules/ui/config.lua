local config = {}

function config.zephyr()
  vim.cmd('colorscheme zephyr')
end

function config.galaxyline()
  require('modules.ui.eviline')
end

function config.dashboard()
  local home = os.getenv('HOME')
  local db = require('dashboard')
  db.session_directory = home .. '/.cache/nvim/session'
  db.preview_command = 'cat | lolcat -F 0.3'
  db.preview_file_path = home .. '/.config/nvim/static/neovim.cat'
  db.preview_file_height = 18
  db.preview_file_width = 80
  db.custom_center = {
      {icon = '  ',
      desc = 'Update Plugins                          ',
      shortcut = 'SPC p u',
      action ='PackerUpdate'},
      {icon = '  ',
      desc = 'Find File                               ',
      action = 'Telescope find_files find_command=rg,--hidden,--files',
      shortcut = 'SPC f f'},
      {icon = '  ',
      desc = 'Browse Recent                           ',
      action = 'Browse oldfiles',
      shortcut = 'SPC b r'},
    }
end

function config.nvim_bufferline()
  require('bufferline').setup{
    options = {
      modified_icon = '✥',
      buffer_close_icon = '',
      always_show_bufferline = false,
    }
  }
end

function config.nvim_tree()
	require('nvim-tree').setup({
		disable_netrw = false,
		hijack_cursor = true,
		hijack_netrw = true,
  })
end

function config.nvim_colorizer()
  require('colorizer').setup({'*'}) -- do it on all filetypes
end

function config.nvim_treesitter()
  vim.api.nvim_command('set foldmethod=expr')
  vim.api.nvim_command('set foldexpr=nvim_treesitter#foldexpr()')
  require'nvim-treesitter.configs'.setup {
    ensure_installed = "all",
    ignore_install = { 'phpdoc' },
    highlight = {
      enable = true,
    },
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

return config
