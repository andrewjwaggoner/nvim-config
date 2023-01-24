local settings = require ('me.config')

print(settings.galaxyline)

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
  use { 'andrewjwaggoner/cabline.nvim', config=settings.cabline.config }
  use { 'folke/tokyonight.nvim', config=settings.tokyonight.config }
  use { 'github/copilot.vim' }
  use { 'glepnir/galaxyline.nvim', config=settings.galaxyline.config, requires='kyazdani42/nvim-web-devicons' }
  use { 'iamcco/markdown-preview.nvim', config = settings.markdown_preview.config }
  use { 'kyazdani42/nvim-tree.lua', cmd='NvimTreeToggle', config=settings.nvim_tree.config, requires='kyazdani42/nvim-web-devicons' }
  use { 'kylechui/nvim-surround', config = settings.nvim_surround.config }
  use { 'nvim-colortils/colortils.nvim', cmd = "Colortils", config = settings.colortils.config }
  use { 'natecraddock/sessions.nvim', config = settings.sessions.config }
  use { 'norcalli/nvim-colorizer.lua', config=settings.nvim_colorizer.config }
  use { 'nvim-telescope/telescope.nvim', config = settings.telescope.config, requires = {
    { 'nvim-telescope/telescope-file-browser.nvim' },
    { 'nvim-lua/plenary.nvim', opt = true },
    { 'nvim-lua/popup.nvim', opt = true },
    { 'nvim-telescope/telescope-fzy-native.nvim', opt = true }}}
  use { 'nvim-treesitter/nvim-treesitter', after='telescope.nvim', config=settings.treesitter.config, event='BufRead', run=':TSUpdate' }
  use { 'nvim-treesitter/nvim-treesitter-textobjects', after='nvim-treesitter' }
  use { 'folke/trouble.nvim', requires = 'kyazdani42/nvim-web-devicons', config = settings.trouble.config }
  use { 'rhysd/git-messenger.vim' }
  use { 'tpope/vim-fugitive' }
  use { 'neovim/nvim-lspconfig', config=settings.nvim_lsp.config }
  use { 'williamboman/mason-lspconfig.nvim' }
  use { 'williamboman/mason.nvim' }

  if packer_bootstrap then -- Automatically set up your configuration after cloning packer.nvim. 
    require('packer').sync()
  end
end)
