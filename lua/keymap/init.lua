-- Put plugins key definitions in this file
local key = require('core.keymap')
local keymap = require('core.keymap')
local opts,cmd = key.new_opts,key.cmd
local nmap,xmap,vmap = keymap.nmap,keymap.xmap,keymap.vmap
local silent,noremap = keymap.silent,keymap.noremap

-- Leader key!
vim.g.mapleader = " "

-- I'm putting tool-based mappings in here, for no good reason.
nmap {
  -- packer
  {'<Leader>pu',cmd('PackerUpdate'),opts(noremap,silent)},
  {'<Leader>pi',cmd('PackerInstall'),opts(noremap,silent)},
  {'<Leader>pc',cmd('PackerCompile'),opts(noremap,silent)},
  -- dashboard
  {'<Leader>n',cmd('DashboardNewFile'),opts(noremap,silent)},
  {'<Leader>ss',cmd('SessionSave'),opts(noremap,silent)},
  {'<Leader>sl',cmd('SessionLoad'),opts(noremap,silent)},
  -- telescope
  {'<Leader>b',cmd('Telescope buffers'),opts(noremap,silent)},
  {'<Leader>fa',cmd('Telescope live_grep'),opts(noremap,silent)},
  {'<Leader>ff',cmd('Telescope find_files'),opts(noremap,silent)},
  {"<Leader>fr", cmd("Telescope oldfiles")}, -- search recent files
  -- markdown preview
  {'<Leader>mp',cmd('MarkdownPreview'),opts(noremap,silent)},
  {'<Leader>t',cmd('NvimTreeToggle'),opts(noremap,silent)},
  {'<Leader>gm',cmd('GitMessenger'),opts(noremap,silent)},
  {'<Leader>cp',cmd('Colortils picker'),opts(noremap,silent)},
  -- bufferline
  {'<Leader>h',':BufferLineCyclePrev<CR>', opts(noremap)},
  {'<Leader>l',':BufferLineCycleNext<CR>', opts(noremap)},
  -- open a Quickfix window for the last search.
  {"<Leader>?", ":execute 'vimgrep /'.@/.'/g %'<CR>:copen<CR>"},
}

xmap {
  {' ','',opts(noremap)},
  -- quick movements
  {'J', '5j', opts(noremap)},
  {'K', '5k', opts(noremap)},
  {'H', '^', opts(noremap)},
  {'L', '$', opts(noremap)},
}

vmap {
  -- reselect visual block after indent/outdent
  {'<', '<gv',opts(noremap)},
  {'>', '>gv',opts(noremap)},
}

nmap {
  {' ','',opts(noremap)},
  -- window jump
  {'<C-h>','<C-w>h',opts(noremap)},
  {'<C-l>','<C-w>l',opts(noremap)},
  {'<C-j>','<C-w>j',opts(noremap)},
  {'<C-k>','<C-w>k',opts(noremap)},
  -- quick movements
  {'J', '10j', opts(noremap)},
  {'K', '10k', opts(noremap)},
  {'H', '^', opts(noremap)},
  {'L', '$', opts(noremap)},
  -- quick save/exit commands
  {'<Leader>q', ':q<CR>', opts(noremap)},
  {'<Leader>ww', ':w<CR>', opts(noremap)},
  {'<Leader>bd',':bd!<CR>', opts(noremap)},
  {'<Leader><ESC>',':qa!<CR>', opts(noremap)},
}
