local plugin = require('core.pack').register_plugin
local conf = require('modules.ui.config')

-- color scheme
plugin {'glepnir/zephyr-nvim', config = conf.zephyr}

-- dashboard
plugin {'glepnir/dashboard-nvim',config = conf.dashboard}

-- status line plugin.
plugin {'glepnir/galaxyline.nvim',
  branch = 'main',
  config = conf.galaxyline,
  requires = 'kyazdani42/nvim-web-devicons'
}

-- file explorer
plugin {'kyazdani42/nvim-tree.lua',
  cmd = 'NvimTreeToggle',
  config = conf.nvim_tree,
  requires = 'kyazdani42/nvim-web-devicons'
}

-- buffer plugin
plugin {'akinsho/nvim-bufferline.lua',
   config = conf.nvim_bufferline,
   requires = 'kyazdani42/nvim-web-devicons'
}

-- colorizer for color codes
plugin {'norcalli/nvim-colorizer.lua',
  config = conf.nvim_colorizer
}

-- highlighting
plugin {'nvim-treesitter/nvim-treesitter-textobjects', after = 'nvim-treesitter'}
plugin {'nvim-treesitter/nvim-treesitter',
  event = 'BufRead',
  run = ':TSUpdate',
  after = 'telescope.nvim',
  config = conf.nvim_treesitter,
}
