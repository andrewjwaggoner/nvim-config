<h1 align="center">
  <img
    src="https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/misc/transparent.png"
    height="30"
    width="0px"
  />
  Cosynvim
  <img
    src="https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/misc/transparent.png"
    height="30"
    width="0px"
  />
</h1>

## Updating your lolcat/figler header


echo 'Neovim' | figlet -f "/<folder>/3d.flf" -c | lolcat > ~/.config/nvim/static/neovim.cat

## What is this

This is a fork of Glepnir's Cosynvim configuration. https://github.com/glepnir/cosynvim

Glepnir did all the heavy lifting for this configuration. Check the above github
link for configuring this in more detail. Below are the relevant pieces I look
back on for reference.

## Structure

```
├── init.lua  
├── lua
│   ├── core                       heart of cosynvim provide api
│   │   ├── init.lua
│   │   ├── keymap.lua             keymap api
│   │   ├── options.lua            vim options
│   │   └── pack.lua               hack packer
│   ├── keymap                     your keymap in here
│   │   ├── config.lua
│   │   └── init.lua
│   └── modules                    plugins module usage example
│       ├── completion
│       │   ├── config.lua
│       │   └── plugins.lua
│       ├── lang
│       │   ├── config.lua
│       │   └── plugins.lua
│       ├── tools
│       │   ├── config.lua
│       │   └── plugins.lua
│       └── ui
│           ├── config.lua
│           ├── eviline.lua
│           └── plugins.lua
├── snippets                       snippets 
│   ├── lua.json
│   └── package.json
└── static                         dashboard logo
    └── neovim.cat

```

A nice structure, right? Looks complicated? You can delete any folder except the core and keymap modules.


### How to install plugins

Api is `require('core.pack').register_plugin`. So pass plugin as param into this function. Usage
like in `modules/your-folder-name/plugins.lua`

```lua
local plugin = require('core.pack').register_plugin
local conf = require('modules.ui.config')

plugin {'glepnir/zephyr-nvim', config = conf.zephyr}
plugin {'plugin github repo name'}
```

what is `config` . this is keyword of [packer.nvim](https://github.com/wbthomason/packer.nvim), you need check the doc of packer to know how to use packer.
if plugin has many configs you can create other file in `modules/your-folder-name/config.lua` avoid
making the plugins.lua file too long.Recommend lazyload plugins. Check the usage in `modules` , it will improve your neovim
start speed. `lazyload` is not magic, it just generate your config into some `autocmds` , you can check the
`packer_compiled.lua` to check it. I don't like the default path config in packer it use `plugins` folder  So i set
compiled file path to `~/.local/share/nvim/site/lua`, you can find compiled file in this path. Use `:h autocmd`
to know more about. When you edit the config and open neovim and it does not take effect. Please try
 `PackerCompile` to generate a new compile file with your new change. In my personal config i have a function that
 can auto compiled . when i edit the lua file that in this path `~/.config/nvim`. But it will make some noise so I didn't
 use it in cosynvim. when i have a newimplement I will update it to cosynvim core.

```lua

-- modules/completion/plugins.lua
plugin {'neovim/nvim-lspconfig',
 -- used filetype to lazyload lsp
 -- config your language filetype in here
  ft = { 'lua','rust','c','cpp'},
  config = conf.nvim_lsp,
}

-- modules/tools/plugins.lua
plugin {'nvim-telescope/telescope.nvim',
  -- use command to lazyload.
  cmd = 'Telescope',
  config = conf.telescope,
  requires = {
    {'nvim-lua/popup.nvim', opt = true},
    {'nvim-lua/plenary.nvim',opt = true},
    {'nvim-telescope/telescope-fzy-native.nvim',opt = true},
  }
}
```

### How to config keymap

In cosynvim there are some apis that make it easy to set keymap. All apis are defined in `core/keymap.lua`.

```lua
keymap.(n/i/c/v/x/t)map -- function to generate keymap by vim.keymap.set
keymap.new_opts -- generate opts into vim.keymap.set
-- function type that work with keymap.new_opts
keymap.silent keymap.noremap keymap.expr keymap.nowait keymap.remap
keymap.cmd -- just return string with <Cmd> and <CR>
keymap.cu -- work like cmd but for visual map
```

Use these APIs to config your keymap in `keymap` folder. In this folder, `keymap/init.lua` is necessary but if you
have many vim mode remap you can config them in `keymap/other-file.lua.` In cosynvim, `config.lua` just an
example file. Config plugins keymap in `keymap/init.lua`. An example of API
usage:

```lua
-- genreate keymap in noremal mode
nmap {
  -- packer
  {'<Leader>pu',cmd('PackerUpdate'),opts(noremap,silent)},
  {'<Leader>pi',cmd('PackerInstall'),opts(noremap,silent)},
  {'<Leader>pc',cmd('PackerCompile'),opts(noremap,silent)},
}
```

`map` foreach every table and generate a new table that can pass to `vim.keymap.set`. `cmd('PackerUpdate')` just
return a string `<cmd>PackerUpdate<CR>` as rhs. lhs is `<leader>pu>`, `opts(noremap,silent)` generate options table
`{noremap = true,silent = true }` . for some vim mode remap. not need use `cmd` function. oh maybe you will be
confused what is `<cmd>` check `:h <cmd>` you will get answer

```lua
  -- window jump
  {"<C-h>",'<C-w>h',opts(noremap)},
```

also you can pass a table not include sub table to `map` like:

```lua
nmap {'key','rhs',opts(noremap,silent)}
```

use `:h vim.keymap.set` to know more about.
