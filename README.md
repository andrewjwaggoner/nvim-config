<h1 align="center">
  <img src="https://user-images.githubusercontent.com/11034778/215368402-c2a76b55-6ae2-448d-87ff-d49ef3a77f97.png" alt="screenshot"/>
</h1>

## What Is This?

This is my person neovim configuration. It used to be based on Glepnir's configuration, but I've since rewritten it from scratch.

## Structure
```
├── init.lua
├── lazy-lock.lua              version locks packages, should be in source control
├── plugin
├── lua
│   ├── snippets
│   ├── config                 this folder houses all of our setup functions
│   ├── options.lua            vim options
│   ├── plugins.lua            plugin manager
│   ├── autocommands.lua       your custom autocommands go here
│   └── mappings.lua           your keymaps go here
```
A nice structure, right? Looks complicated? Obviously, since it's Neovim, you can delete literally
ANYTHING you'd like! This structure is mostly for organization, and I've tried
to keep it idiomatic, so looking at other configs and examples should be
straightforward. 

### Plugins I'm Using

[cabline.nvim](https://github.com/andrewjwaggoner/cabline.nvim) custom tabline for my own workflow  
[colortils.nvim](https://github.com/nvim-colortils/colortils.nvim) for a simple color picker  
[git-messenger.nvim](https://github.com/rhysd/git-messenger.vim) to view git history and bit blame easily  
[lazy.nvim](https://github.com/folke/lazy.nvim) plugin manager
[luasnip](https://github.com/L3MON4D3/LuaSnip/) for snippets
[markdown-preview.nvim](https://github.com/iamcco/markdown-preview.nvim) live server for easy markdown previews  
[mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim) for blending mason and lspconfig  
[mason.nvim](https://github.com/williamboman/mason.nvim) for handling LSP/DAP stuff  
[nvim-colorizer.lua](https://github.com/norcalli/nvim-colorizer.lua) for simple color code highlighting  
[nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) standard LSP for Neovim.  
[nvim-surround](https://github.com/tpope/vim-surround) for better surround features  
[nvim-tree.lua](https://github.com/kyazdani42/nvim-tree.lua) for file explorer (requires patched font)  
[nvim-treesitter-textobjects](https://github.com/nvim-treesitter/nvim-treesitter-textobjects) helper for highlighting  
[nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) for highlighting  
[nvim-web-devicons](https://github.com/kyazdani42/nvim-web-devicons) colored icons  
[plenary.nvim](https://github.com/nvim-lua/plenary.nvim) helper functions for lua  
[popup.nvim](https://github.com/nvim-lua/popup.nvim) popup API plugin for neovim  
[telescope-fzy-native.nvim](https://github.com/nvim-telescope/telescope-fzy-native.nvim) fzy native for telescope  
[telescope-luasnip.nvim](https://github.com/benfowler/telescope-luasnip.nvim) telescope integration for luasnip
[telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) fuzzy finder over lists  
[tokyonight.nvim](https://github.com/folke/tokyonight.nvim) theme I'm using  
[trouble.nvim](https://github.com/folke/trouble.nvim) awesome plugin for displaying troublesome things, with native LSP integration and telescope integration  
[vim-fugitive](https://github.com/tpope/vim-fugitive) for easy git commands  

### The Config Folder

The main config folder is `lua/config`. This is where all of the setup functions exist. I package them up via `init.lua`
so that I can just require `plugins` and get all of the setup functions. This is a nice way to keep things organized.
They are split up by plugin, so you can easily find the setup function for a specific plugin. 

What is the config parameter? This is used in [Lazy](https://github.com/folke/lazy.nvim).
You may need to check the documentation of Lazy to know how to use it. 

### How To Configure Keymaps

These are setup in the standard neovim way. See the keymap folder for details.
There are some small wrappers to make the syntax a little nicer, but they're
unecessary.

## About ? Appearing In Neovim

If you find that your display looks like this: <Insert Image> Where icons are
replaced with '?', you need to be using a patched font. Go here: https://www.nerdfonts.com

In short, I like SourceCodePro, so I download the SourceCodePro Nerd font and
install it. Then all that's needed is to set your terminal font to the the new font. 
Here's a github URL: `https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/SourceCodePro/Regular/complete`

NOTE: If you're using Windows, you'll want to use a fixed-width font, or you
won't be able to use it in Powershell/Terminal.

### Fzf Dependency

This uses fzf for fuzzy finding. You'll need to install it. It's included in most OS package managers. Without it, you won't be able 
to use Telescope's live grep, or any of the other fzf features.

### LSP

Mason doesn't set up every LSP for you. If you're using a language server that requires a global install, you'll need to install it yourself.
If you run into an LSP that isn't working, check the language server's documentation, and also use :LspInfo to see if it's running.
