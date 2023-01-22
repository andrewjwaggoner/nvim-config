<h1 align="center">
  <img src="https://user-images.githubusercontent.com/11034778/201424828-95bd7cc5-9cd5-40f5-aa41-8cc8923ee6e0.png" alt="screenshot"/>
</h1>

Install ripgrep

## What Is This?

This is my person neovim configuration. It used to be based on Glepnir's configuration, but I've since rewritten it from scratch.


## Structure
```
├── init.lua  
├── lua
│   ├── core                       core functionality
│   │   └── pack.lua               hack for packer
│   │   ├── init.lua
│   │   ├── options.lua            vim options
│   │   ├── utils.lua              contains methods for cleaner keymaps
│   ├── keymap                     your keymaps go here
│   │   ├── init.lua
│   │   └── lsp.lua                LSP keymaps that attached to active buffers
│   └── modules                    plugins go here, can customize structure 
│       ├── lsp                    LSP (Language Server Parser) folder
│       │   ├── config.lua
│       │   └── plugins.lua
│       ├── commands               folder for custom commands
│       │   └── init.lua
│       ├── completion             completion plugin folder
│       │   ├── config.lua
│       │   └── plugins.lua
│       ├── tools                  tooling plugins (Like git, colorpicker, etc..)
│       │   ├── config.lua
│       │   └── plugins.lua
│       └── ui                     user interface plugin & configuration
│           ├── config.lua
│           ├── galaxyline.lua
│           └── plugins.lua
├── snippets                       snippets 
│   ├── lua.json
│   └── package.json

```
A nice structure, right? Looks complicated? You can delete any folder except 
the core folder easily. Obviously, since it's Neovim, you can delete literally
ANYTHING you'd like! This structure is mostly for organization, and I've tried
to keep it idiomatic, so looking at other configs and examples should be
straightforward.

### Plugins I'm Using

[Luasnip](https://github.com/L3MON4D3/LuaSnip) for snippet engine  
[cabline.nvim](https://github.com/andrewjwaggoner/cabline.nvim) custom tabline for my own workflow  
[cmp-buffer](https://github.com/hrsh7th/cmp-buffer) cmp source for buffer words  
[cmp-cmdline](https://github.com/hrsh7th/cmp-cmdline) cmp source for vim commandline  
[cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp) may be able to remove  
[cmp-path](https://github.com/hrsh7th/cmp-path) cmp for directories  
[cmp_luasnip](https://github.com/saadparwaiz1/cmp_luasnip) luasnip completion source for nvim-cmp  
[colortils.nvim](https://github.com/nvim-colortils/colortils.nvim) for a simple color picker  
[dashboard-nvim](https://github.com/glepnir/dashboard-nvim) for simple splash screen  
[friendly-snippets](https://github.com/rafamadriz/friendly-snippets) set of common snippets for a lot of different languages.  
[galaxyline.nvim](https://github.com/glepnir/galaxyline.nvim) for easy customizable status line  
[git-messenger.nvim](https://github.com/rhysd/git-messenger.vim) to view git history and bit blame easily  
[gruvbox](https://github.com/morhetz/gruvbox) other color scheme, not used actively  
[lsp-signature.nvim](https://github.com/ray-x/lsp_signature.nvim) shows function signature as you type  
[markdown-preview.nvim](https://github.com/iamcco/markdown-preview.nvim) live server for easy markdown previews  
[nvim-cmp](https://github.com/hrsh7th/nvim-cmp) for LSP completion engine  
[nvim-colorizer.lua](https://github.com/norcalli/nvim-colorizer.lua) for simple color code highlighting  
[nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) standard LSP for Neovim.  
[nvim-surround](https://github.com/tpope/vim-surround) for better surround features  
[nvim-tree.lua](https://github.com/kyazdani42/nvim-tree.lua) for file explorer (requires patched font)  
[nvim-treesitter-textobjects](https://github.com/nvim-treesitter/nvim-treesitter-textobjects) helper for highlighting  
[nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) for highlighting  
[nvim-web-devicons](https://github.com/kyazdani42/nvim-web-devicons) colored icons  
[packer.nvim](https://github.com/wbthomason/packer.nvim) Main plugin to handle plugins  
[telescope-fzy-native.nvim](https://github.com/nvim-telescope/telescope-fzy-native.nvim) may not need  
[telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) fuzzy finder over lists  
[trouble.nvim](https://github.com/folke/trouble.nvim) awesome plugin for displaying troublesome things, with native LSP integration and telescope integration  
[vim-fugitive](https://github.com/tpope/vim-fugitive) for easy git commands  
[zephyr-nvim](https://github.com/glepnir/zephyr-nvim) for color scheme  

### How To Install Other Plugins

Plugin is slightly different from direct Packer usage. See: `require('core.pack').register_plugin`. 
Pass the plugin you want into this function. Setup examples are in `modules/your-folder-name/plugins.lua`.

```
local plugin = require('core.pack').register_plugin
local conf = require('modules.ui.config')

plugin {'glepnir/zephyr-nvim', config = conf.zephyr}
plugin {'plugin github <repo_name>'}
```

 What is the config parameter? This is used in [packer.nvim](https://github.com/wbthomason/packer.nvim). 
You may need to check the documentation of Packer to know how to use it. If your plugin file gets 
complicated you can create another file: `modules/your-folder-name/config.lua` to avoid
making the plugins.lua file too long. I recommend lazy-loading plugins, although
NeoVim seems to be quite fast even with many loaded. Check the usage in modules, it will improve your 
Neovim startup speed. lazy-loading is not magic, it just loads your config into some autocmds, you can check the
packer_compiled.lua to understand it. 

NOTE: Not using the default path configuration in Packer. It currently uses the plugins folder. So the
compiled file path to `~/.local/share/nvim/site/lua`. Use `:h autocmd` to learn more about it. When you edit the config and open Neovim, 
you'll notice that it doesn't take effect. Use PackerCompile to generate a new  compile file with your changes. 

 ### How To Configure Keymap 

These are setup in the standard neovim way. See the keymap folder for details.
There are some small wrappers to make the syntax a little nicer, but they're
unecessary.

# Miscellaneous

## Your Dashboard Header
The configuration for this is in `lua/modules/ui/config.lua`. I would recommend looking 
through this if you'd like to configure this startup page. I commonly put bindings I don't remember 
or commands I find useful for admin work here.

You can specify a file instead of inlining it in the configuration file. This does not work properly 
on Windows systems as far as I know, but if you'd like to RGB your header, see the documentation for 
`dashboard.nvim` and the section below.

## About ? Appearing In Neovim

If you find that your display looks like this: <Insert Image> Where icons are
replaced with '?', you need to be using a patched font. Go here: https://www.nerdfonts.com

In short, I like SourceCodePro, so I download the SourceCodePro Nerd font and
install it. Then all that's needed is to set your terminal font to the the new font. 
Here's a github URL: `https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/SourceCodePro/Regular/complete`

NOTE: If you're using Windows, you'll want to use a fixed-width font, or you
won't be able to use it in Powershell/Terminal.
