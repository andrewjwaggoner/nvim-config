-- recommend putting vim mode key mappings in this file
local keymap = require('core.keymap')
local nmap,imap,cmap,xmap,vmap = keymap.nmap,keymap.imap,keymap.cmap,keymap.xmap,keymap.vmap
local silent,noremap = keymap.silent,keymap.noremap
local opts = keymap.new_opts
local cmd = keymap.cmd

-- leader key mappings
vim.g.mapleader = " "
nmap {' ','',opts(noremap)}
xmap {' ','',opts(noremap)}

-- reselect visual block after indent/outdent
vmap({ '<', '<gv',opts(noremap)})
vmap({ '>', '>gv',opts(noremap)})

nmap {
  -- window jump
  {'<C-h>','<C-w>h',opts(noremap)},
  {'<C-l>','<C-w>l',opts(noremap)},
  {'<C-j>','<C-w>j',opts(noremap)},
  {'<C-k>','<C-w>k',opts(noremap)},
  -- quick moments
  {'J', '10j', opts(noremap)},
  {'K', '10k', opts(noremap)},
  {'H', '^', opts(noremap)},
  {'L', '$', opts(noremap)},
  -- quick save/exit commands
  {'<Leader>q', ':q<CR>', opts(noremap)},
  {'<Leader>ww', ':w<CR>', opts(noremap)},
  {'<Leader>bd',':bd!<CR>', opts(noremap)},
  {'<Leader><ESC>',':qa!<CR>', opts(noremap)},
  -- open a Quickfix window for the last search.
  {"<Leader>?", ":execute 'vimgrep /'.@/.'/g %'<CR>:copen<CR>"},
  -- search recent files
  {"<Leader>br", cmd("browse oldfiles")}
}

-- custom commands for easy casing functions
vim.api.nvim_create_user_command('TitleCase', function()
  vim.cmd("s/\\<./\\u&/g")
  vim.cmd("noh")
end, {
    nargs = "*",
    desc = "Change line to have title casing",
})

vim.api.nvim_create_user_command('LowerCase', function()
  vim.cmd("s/\\<.*/\\L&/g")
  vim.cmd("noh")
end, {
    nargs = "*",
    desc = "Change line to have lower casing",
})

vim.api.nvim_create_user_command('UpperCase', function()
  vim.cmd("s/\\<.*/\\U&/g")
  vim.cmd("noh")
end, {
    nargs = "*",
    desc = "Change line to have upper casing",
})

