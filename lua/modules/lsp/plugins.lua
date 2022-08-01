local plugin = require('core.pack').register_plugin
local conf = require('modules.lsp.config')

-- language server parser
plugin { 'hrsh7th/cmp-nvim-lsp' }
plugin { 'neovim/nvim-lspconfig',
  config = conf.nvim_lsp,
  wants = { 'cmp-nvim-lsp', 'nvim-lsp-installer', 'lsp_signature.nvim' },
  requires = {
    'hrsh7th/cmp-nvim-lsp',
    'williamboman/nvim-lsp-installer',
    'ray-x/lsp_signature.nvim',
  },
}
