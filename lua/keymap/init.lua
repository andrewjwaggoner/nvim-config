-- Put plugins key definitions in this file
local key = require('core.keymap')
local keymap = require('core.keymap')
local opts, cmd = key.new_opts, key.cmd
local nmap, xmap, vmap = keymap.nmap, keymap.xmap, keymap.vmap
local silent, noremap = keymap.silent, keymap.noremap

-- Leader key!
vim.g.mapleader = " "

-- I'm putting tool-based mappings in here, for no good reason. Most of these
-- will follow some naming convention, like
-- <Leader><ToolStartingCharacter><ActionStartingCharacter>. Hyper frequent
-- commands are special exceptions.
nmap {
  -- single character commands -- hyper-frequent mappings
  { '<Leader>t', cmd('NvimTreeToggle'), opts(noremap, silent) },
  { '<Leader>q', ':q<CR>', opts(noremap) },
  -- bufferline
  { '<Leader>h', ':BufferLineCyclePrev<CR>', opts(noremap) },
  { '<Leader>l', ':BufferLineCycleNext<CR>', opts(noremap) },
  -- open a Quickfix window for the last search.
  { '<Leader>?', ":execute 'vimgrep /'.@/.'/g %'<CR>:copen<CR>" },
  -- save/exit commands
  { '<Leader><ESC>', ':qa!<CR>', opts(noremap) },

  -- two character commands
  -- packer
  { '<Leader>pu', cmd('PackerUpdate'), opts(noremap, silent) },
  { '<Leader>pi', cmd('PackerInstall'), opts(noremap, silent) },
  { '<Leader>pc', cmd('PackerCompile'), opts(noremap, silent) },
  -- buffer functionality
  { '<Leader>bn', cmd('DashboardNewFile'), opts(noremap, silent) },
  { '<Leader>bd', ':bd!<CR>', opts(noremap) },
  -- session functionality
  { '<Leader>ss', cmd('SessionSave'), opts(noremap, silent) },
  { '<Leader>sl', cmd('SessionLoad'), opts(noremap, silent) },
  -- telescope
  { '<Leader>fb', cmd('Telescope buffers'), opts(noremap, silent) },
  { '<Leader>fa', cmd('Telescope live_grep'), opts(noremap, silent) },
  { '<Leader>ff', cmd('Telescope find_files'), opts(noremap, silent) },
  { '<Leader>fr', cmd('Telescope oldfiles') }, -- search recent files
  -- previews
  { '<Leader>pm', cmd('MarkdownPreview'), opts(noremap, silent) },
  -- quick save/exit commands
  { '<Leader>ww', ':w<CR>', opts(noremap) },
  -- LSP commands
  { '<Leader>lr', cmd('lua vim.lsp.buf.rename()'), opts(noremap, silent) }, -- rename
  { '<Leader>lh', cmd('lua vim.lsp.buf.hover()'), opts(noremap, silent) }, -- open hover
  { '<Leader>la', cmd('lua vim.lsp.buf.action()'), opts(noremap, silent) }, -- code action
  { '<Leader>ld', cmd('lua vim.diagnostic.open_float()'), opts(noremap, silent) }, -- line diagnostics
  { '<Leader>lf', cmd('lua vim.lsp.buf.formatting()'), opts(noremap, silent) }, -- format
  { '<Leader>ld', cmd('lua vim.lsp.buf.definition()'), opts(noremap, silent) }, -- go to definition
  { '<Leader>lD', cmd('lua vim.lsp.buf.declaration()'), opts(noremap, silent) }, -- go to declaration
  { '<Leader>ls', cmd('lua vim.lsp.buf.signature_help()'), opts(noremap, silent) }, -- see signature
  { '<Leader>lI', cmd('lua vim.lsp.buf.implementation()'), opts(noremap, silent) }, -- go to implementation
  { '<Leader>lt', cmd('lua vim.lsp.buf.type_definition()'), opts(noremap, silent) }, -- go to type definition
  { '<Leader>ln', cmd('lua vim.diagnostic.goto_next()'), opts(noremap, silent) },
  { '<Leader>lp', cmd('lua vim.diagnostic.goto_prev()'), opts(noremap, silent) },
  { '<Leader>lN', cmd('lua vim.diagnostic.goto_next({severity = vim.diagnostic.severity.ERROR})'), opts(noremap, silent) },
  { '<Leader>lP', cmd('lua vim.diagnostic.goto_prev({severity = vim.diagnostic.severity.ERROR})'), opts(noremap, silent) },
  -- three character commands
  -- open tool commands (Watch out for the naming conventions here)
  { '<Leader>ogm', cmd('GitMessenger'), opts(noremap, silent) },
  { '<Leader>ocp', cmd('Colortils picker'), opts(noremap, silent) },
}

xmap {
  { ' ', '', opts(noremap) },
  -- quick movements
  { 'J', '5j', opts(noremap) },
  { 'K', '5k', opts(noremap) },
  { 'H', '^', opts(noremap) },
  { 'L', '$', opts(noremap) },

  -- LSP commands (Duplicated from xmap)
  { '<Leader>lh', cmd('lua vim.lsp.buf.hover()'), opts(noremap, silent) }, -- open hover
}

vmap {
  -- reselect visual block after indent/outdent
  { '<', '<gv', opts(noremap) },
  { '>', '>gv', opts(noremap) },
}

nmap {
  { ' ', '', opts(noremap) },
  -- window jump
  { '<C-h>', '<C-w>h', opts(noremap) },
  { '<C-l>', '<C-w>l', opts(noremap) },
  { '<C-j>', '<C-w>j', opts(noremap) },
  { '<C-k>', '<C-w>k', opts(noremap) },
  -- quick movements
  { 'J', '10j', opts(noremap) },
  { 'K', '10k', opts(noremap) },
  { 'H', '^', opts(noremap) },
  { 'L', '$', opts(noremap) },
}
