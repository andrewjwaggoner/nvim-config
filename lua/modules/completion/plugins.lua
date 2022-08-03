local plugin = require('core.pack').register_plugin
local conf = require('modules.completion.config')

-- completion engine
plugin { 'hrsh7th/nvim-cmp',
  config = conf.nvim_cmp,
  requires = {
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/cmp-path' },
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-cmdline' },
    { 'saadparwaiz1/cmp_luasnip' },
    { 'L3MON4D3/LuaSnip', config = conf.lua_snip }
  },
}

-- Snippet Engine
plugin { 'rafamadriz/friendly-snippets',
  config = conf.friendly_snippets,
}
