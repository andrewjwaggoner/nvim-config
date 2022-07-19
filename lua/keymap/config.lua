-- recommend some vim mode key defines in this file
local keymap = require('core.keymap')
local nmap,imap,cmap,xmap = keymap.nmap,keymap.imap,keymap.cmap,keymap.xmap
local silent,noremap = keymap.silent,keymap.noremap
local opts = keymap.new_opts
local cmd = keymap.cmd

-- Use space as leader key
vim.g.mapleader = " "

-- leaderkey
nmap {' ','',opts(noremap)}
xmap {' ','',opts(noremap)}

-- usage example
nmap {
  -- remove trailing white space
  {'<Leader>t',cmd('TrimTrailingWhitespace'),opts(noremap)},
  -- window jump
  {'<C-h>','<C-w>h',opts(noremap)},
  {'<C-l>','<C-w>l',opts(noremap)},
  {'<C-j>','<C-w>j',opts(noremap)},
  {'<C-k>','<C-w>k',opts(noremap)},
  -- buffer cycle
  {'<Leader>h',':BufferLineCyclePrev<CR>', opts(noremap)},
  {'<Leader>l',':BufferLineCycleNext<CR>', opts(noremap)},
  {'<Leader>bd',':bd!<CR>', opts(noremap)},
  -- quick moments
  {'J', '10j', opts(noremap)},
  {'K', '10k', opts(noremap)},
  {'H', '^', opts(noremap)},
  {'L', '$', opts(noremap)},
  -- quick save/exit commands
  {'<Leader>qa', ':qa<CR>', opts(noremap)},
  {'<Leader>w', ':w<CR>', opts(noremap)},
}

-- insert mode
--imap {
--}

--cmap {
--}
