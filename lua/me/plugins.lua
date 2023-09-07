local settings = require ('me.config')

local ensure_packer=function()
  local fn=vim.fn
  local install_path=fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap=ensure_packer()

return require('packer').startup(function(use)
  use { 'wbthomason/packer.nvim' }
  use { 'andrewjwaggoner/cabline.nvim', config = settings.cabline.config }
  use { 'folke/tokyonight.nvim', config = settings.tokyonight.config }
  use { 'github/copilot.vim' }
  use { 'glepnir/galaxyline.nvim', config = settings.galaxyline.config, requires='kyazdani42/nvim-web-devicons' }
  use { 'iamcco/markdown-preview.nvim', config = settings.markdown_preview.config }
  use { 'KabbAmine/zeavim.vim', config = settings.zeavim.config }
  use { 'kyazdani42/nvim-tree.lua', cmd ='NvimTreeToggle', config = settings.nvim_tree.config, requires='kyazdani42/nvim-web-devicons' }
  use { 'kylechui/nvim-surround', config = settings.nvim_surround.config }
  use { 'L3MON4D3/LuaSnip', tag = "v2.*", config = settings.luasnip.config, run = 'make install_jsregexp' }
  use { 'nvim-colortils/colortils.nvim', cmd = "Colortils", config = settings.colortils.config }
  use { 'natecraddock/sessions.nvim', config = settings.sessions.config }
  use { 'norcalli/nvim-colorizer.lua', config = settings.nvim_colorizer.config }
  use { 'nvim-telescope/telescope.nvim', config = settings.telescope.config, requires = {
    { 'nvim-telescope/telescope-file-browser.nvim' },
    { 'nvim-lua/plenary.nvim', opt = true },
    { 'nvim-lua/popup.nvim', opt = true },
    { "benfowler/telescope-luasnip.nvim", module = "telescope._extensions.luasnip"},  -- if you wish to lazy-load
    { 'nvim-telescope/telescope-fzy-native.nvim', opt = true }}}
  use { 'nvim-treesitter/nvim-treesitter', after = 'telescope.nvim', config = settings.treesitter.config, event='BufRead', run=':TSUpdate' }
  use { 'nvim-treesitter/nvim-treesitter-textobjects', after = 'nvim-treesitter' }
  use { 'folke/trouble.nvim', requires = 'kyazdani42/nvim-web-devicons', config = settings.trouble.config }
  use { 'rhysd/git-messenger.vim' }
  use { 'tpope/vim-fugitive' }
  use { 'untitled-ai/jupyter_ascending.vim', config = settings.jupyter_ascending.config }
  use { 'williamboman/mason-lspconfig.nvim', config = settings.mason_lspconfig.config, requires = {
    { 'williamboman/mason.nvim', config = settings.mason.config},
  }}
  use { 'neovim/nvim-lspconfig', config = settings.nvim_lsp.config }

  if packer_bootstrap then
    require('packer').sync()
  end
end)
