local plugin = require('core.pack').register_plugin
local conf = require('modules.lsp.config')

-- language server parser
plugin { 'neovim/nvim-lspconfig',
  config = conf.nvim_lsp,
  wants = { 'cmp-nvim-lsp', 'nvim-lsp-installer' },
  requires = {
    'hrsh7th/cmp-nvim-lsp',
    'williamboman/nvim-lsp-installer',
    'ray-x/lsp_signature.nvim',
  },
}
