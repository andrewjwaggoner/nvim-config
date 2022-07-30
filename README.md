<h1 align="center">
  <img src="https://user-images.githubusercontent.com/11034778/179855960-a54de2e9-91f1-42f2-9038-a3a3803336b5.png" alt="screenshot"/>
</h1>

## What Is This?

This is a fork of Glepnir's Cosynvim configuration. https://github.com/glepnir/cosynvim

Glepnir did all the heavy lifting for this configuration. Check the above github
link for configuring this in more detail. Below are the relevant pieces I look
back on for reference.

## Structure
```
├── init.lua  
├── lua
│   ├── core                       heart of Cosynvim (API layer using Packer) 
│   │   ├── init.lua
│   │   ├── keymap.lua             keymap API wrapper for cleaner keymaps
│   │   ├── options.lua            vim options
│   │   └── pack.lua               hack for packer
│   ├── keymap                     your keymaps go here
│   │   └── init.lua
│   └── modules                    plugins go here, can customize structure 
│       ├── lsp                    LSP (Language Server Parser) folder
│       │   ├── config.lua
│       │   └── plugins.lua
│       ├── commands               folder for custom commands
│       │   └── init.lua
│       ├── completion             completion plugin folder
│       │   ├── config.lua
│       │   └── plugins.lua
│       ├── tools                 tooling plugins (Like git, colorpicker, etc..)
│       │   ├── config.lua
│       │   └── plugins.lua
│       └── ui                    user interface plugin & configuration
│           ├── config.lua
│           ├── eviline.lua
│           └── plugins.lua
├── snippets                       snippets 
│   ├── lua.json
│   └── package.json
└── static                         dashboard logo
     └── neovim.cat

```
A nice structure, right? Looks complicated? You can delete any folder except 
the core and keymap modules.

### Plugins I'm Using

[colortils](https://github.com/nvim-colortils/colortils.nvim) for a simple color picker  
[dashboard-nvim](https://github.com/glepnir/dashboard-nvim) for simple splash screen  
[galaxyline](https://github.com/glepnir/galaxyline.nvim) for easy customizable status line  
[git-messenger](https://github.com/rhysd/git-messenger.vim) to view git history and bit blame easily  
[luasnip](https://github.com/L3MON4D3/LuaSnip) for snippet engine  
[nvim-bufferline](https://github.com/akinsho/bufferline.nvim) for tab functionality  
[nvim-colorizer](https://github.com/norcalli/nvim-colorizer.lua) for simple color code highlighting  
[nvim-surround](https://github.com/tpope/vim-surround) for better surround features  
[nvim-tree](https://github.com/kyazdani42/nvim-tree.lua) for file explorer (requires patched font)  
[nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) for highlighting  
[nvm-cmp](https://github.com/hrsh7th/nvim-cmp) for LSP completion engine  
[telescope](https://github.com/nvim-telescope/telescope.nvim) fuzzy finder over lists  
[vim-fugitive](https://github.com/tpope/vim-fugitive) for easy git commands  
[zephyr-nvim](https://github.com/glepnir/zephyr-nvim) for color scheme  

### How To Install Other Plugins

API usage is `require('core.pack').register_plugin`. Pass your plugin into this 
function. Setup example in `modules/your-folder-name/plugins.lua`
```lua
local plugin = require('core.pack').register_plugin
local conf = require('modules.ui.config')

plugin {'glepnir/zephyr-nvim', config = conf.zephyr}
plugin {'plugin github <repo_name>'}
```
What is the config parameter? This is used in [packer.nvim](https://github.com/wbthomason/packer.nvim). You may need to check 
the documentation of Packer to know how to use it. If your plugin file gets 
complicated you can create another file: `modules/your-folder-name/config.lua` to avoid
making the plugins.lua file too long. Glepnir recommonds lazy-loading plugins. 
Check the usage in modules, it will improve your Neovim startup speed. lazyload 
is not magic, it just load your config into some autocmds, you can check the
packer_compiled.lua to understand it. Glepnir doesn't like the default path 
configuration in Packer. It uses the plugins folder. So I set the compiled file 
path to `~/.local/share/nvim/site/lua`, you can find the compiled file in this path. 
Use `:h autocmd` to learn more about it. When you edit the config and open Neovim, 
you'll notice that it doesn't take effect. Use PackerCompile to generate a new 
compile file with your changes. 

 ### How To Configure Keymap 

 In Cosynvim, there are some APIs that make it easy to set the keymap. All APIs 
 are defined in `core/keymap.lua`.

# Miscellaneous

## Updating Your Lolcat/Figler Header

You'll need figlet & lolcat installed and in your environment `PATH`, or you'll
need to reference them fully. I output to Neovim.cat here, but I may have
another file referenced in my Neovim configuration. Change that or overwrite the
file I'm referencing.  

`
echo 'Neovim' | figlet -f "3d.flf" -c | lolcat > ~/.config/nvim/static/neovim.cat
`
## About ? Appearing In Neovim

If you find that your display looks like this: <Insert Image> Where icons are
replaced with '?', you need to be using a patched font. Go here: https://www.nerdfonts.com

In short, I like SourceCodePro, so I download the SourceCodePro Nerd font and
install it. Then all that's needed is to set your terminal font to the the new font. 
Here's a github URL to cURL: `https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/SourceCodePro/Regular/complete/Sauce%20Code%20Pro%20Nerd%20Font%20Complete.ttf`
