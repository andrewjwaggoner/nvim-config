local settings = require('config')

require('lazy').setup({
  { 'wbthomason/packer.nvim' },
  { 'andrewjwaggoner/cabline.nvim', config = settings.cabline.config },
  { 'folke/tokyonight.nvim', config = settings.tokyonight.config, lazy = false, priority = 1000 },
  { 'github/copilot.vim' },
  { 'glepnir/galaxyline.nvim', config = settings.galaxyline.config, dependencies='kyazdani42/nvim-web-devicons' },
  { 'iamcco/markdown-preview.nvim', lazy = false, config = settings.markdown_preview.config },
  { 'KabbAmine/zeavim.vim', config = settings.zeavim.config },
  { 'kyazdani42/nvim-tree.lua', cmd ='NvimTreeToggle', config = settings.nvim_tree.config, dependencies='kyazdani42/nvim-web-devicons' },
  { 'kylechui/nvim-surround', config = settings.nvim_surround.config },
  { 'L3MON4D3/LuaSnip', build = 'make install_jsregexp' },
  { 'nvim-colortils/colortils.nvim', cmd = "Colortils", config = settings.colortils.config },
  { 'natecraddock/sessions.nvim', config = settings.sessions.config },
  { 'norcalli/nvim-colorizer.lua', config = settings.nvim_colorizer.config },
  { 'nvim-telescope/telescope.nvim', config = settings.telescope.config, dependencies = {
    { 'nvim-telescope/telescope-file-browser.nvim' },
    { 'nvim-lua/plenary.nvim'},
    { 'nvim-lua/popup.nvim'},
    { "benfowler/telescope-luasnip.nvim"},
    { 'nvim-telescope/telescope-fzy-native.nvim'}}},
  { 'nvim-treesitter/nvim-treesitter', after = 'telescope.nvim', config = settings.treesitter.config, event='BufRead', build=':TSUpdate' },
  { 'nvim-treesitter/nvim-treesitter-textobjects', after = 'nvim-treesitter' },
  { 'folke/trouble.nvim', dependencies = 'kyazdani42/nvim-web-devicons', config = settings.trouble.config },
  { 'rhysd/git-messenger.vim' },
  { 'sindrets/diffview.nvim'},
  { 'tpope/vim-fugitive' },
  { 'untitled-ai/jupyter_ascending.vim', config = settings.jupyter_ascending.config },
  { 'williamboman/mason-lspconfig.nvim', config = settings.mason_lspconfig.config, dependencies = {
    { 'williamboman/mason.nvim', config = settings.mason.config},
  }},
  { 'neovim/nvim-lspconfig', config = settings.nvim_lsp.config },
})

settings.snippets = require("snippets")
