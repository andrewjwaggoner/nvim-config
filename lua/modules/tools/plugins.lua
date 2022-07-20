local plugin = require('core.pack').register_plugin
local conf = require('modules.tools.config')

-- Plugin for markdown live server
plugin {'iamcco/markdown-preview.nvim',
  config = conf.markdown_preview
}

-- Surround plugin
plugin {'kylechui/nvim-surround',
  config = conf.nvim_surround
}

-- Git wrapper
plugin {'tpope/vim-fugitive'}

-- Reveal git information quickly
plugin {'rhysd/git-messenger.vim'}

-- Color picker
plugin {'max397574/colortils.nvim',
  cmd = "Colortils",
  config = conf.colortils
}

-- Fuzzy finder over lists
plugin {'nvim-telescope/telescope.nvim',
  cmd = 'Telescope',
  config = conf.telescope,
  requires = {
    {'nvim-lua/popup.nvim', opt = true},
    {'nvim-lua/plenary.nvim',opt = true},
    {'nvim-telescope/telescope-fzy-native.nvim',opt = true},
  }
}
