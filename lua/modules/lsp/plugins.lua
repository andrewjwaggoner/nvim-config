local plugin = require('core.pack').register_plugin
local conf = require('modules.lsp.config')

-- language server parser
plugin { 'williamboman/nvim-lsp-installer' }
plugin { 'neovim/nvim-lspconfig',
  config = conf.nvim_lsp,
}
