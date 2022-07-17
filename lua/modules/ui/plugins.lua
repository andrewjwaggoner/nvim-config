local plugin = require('core.pack').register_plugin
local conf = require('modules.ui.config')

-- Color scheme
plugin {'glepnir/zephyr-nvim', config = conf.zephyr}

-- Dashboard
plugin {'glepnir/dashboard-nvim',config = conf.dashboard}

-- status line plugin.
plugin {'glepnir/galaxyline.nvim',
  branch = 'main',
  config = conf.galaxyline,
  requires = 'kyazdani42/nvim-web-devicons'
}

-- File explorer
plugin {'kyazdani42/nvim-tree.lua',
  cmd = 'NvimTreeToggle',
  config = conf.nvim_tree,
  requires = 'kyazdani42/nvim-web-devicons'
}

-- Buffer plugin
plugin {'akinsho/nvim-bufferline.lua',
   config = conf.nvim_bufferline,
   requires = 'kyazdani42/nvim-web-devicons'
}

-- Colorizer for color codes
plugin {'norcalli/nvim-colorizer.lua',
  config = conf.nvim_colorizer
}
