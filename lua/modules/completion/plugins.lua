local plugin = require('core.pack').register_plugin
local conf = require('modules.completion.config')

-- completion engine
plugin {'hrsh7th/nvim-cmp',
  --event = 'BufReadPre',
  config = conf.nvim_cmp,
  requires = {
    {'hrsh7th/cmp-nvim-lsp', after = 'nvim-lspconfig'},
    {'hrsh7th/cmp-path' , after = 'nvim-cmp'},
    {'hrsh7th/cmp-buffer', after = 'nvim-cmp'},
    {'saadparwaiz1/cmp_luasnip', after = "LuaSnip"},
  },
}

-- Snippet Engine
plugin {"L3MON4D3/LuaSnip",
  event = 'InsertEnter',
  config = conf.lua_snip,
}

plugin {'rafamadriz/friendly-snippets',
  config = conf.friendly_snippets,
}
