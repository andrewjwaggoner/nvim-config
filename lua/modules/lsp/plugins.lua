local plugin = require('core.pack').register_plugin
local conf = require('modules.lsp.config')

-- language server parser
plugin {'williamboman/nvim-lsp-installer'}
plugin {'neovim/nvim-lspconfig',
 -- use filetype to lazy-load lsp
  ft = { 'markdown','lua','rust','c','cpp', 'py', 'clj', 'js', 'css','html', 'cs'},
  config = conf.nvim_lsp,
}
