vim.g.mapleader = ' '
-- Keymappings that don't belong to package.
vim.keymap.set('n', '<Leader><ESC>'    , '<Cmd>qa!<CR>', { silent = true })
vim.keymap.set('n', '<Leader><Leader>c', '<Cmd>source ~/.config/nvim/init.lua<CR>', { silent = true })
vim.keymap.set('n', '<Leader>?'        , '<Cmd>execute "vimgrep /" . @/ . "/g %" <bar> copen<CR>', { silent = true })
vim.keymap.set('n', '<Leader>ex'       , '<Cmd>Explore!<CR>', { silent = true })
vim.keymap.set('n', '<Leader>oh'       , '<Cmd>noh<CR>', { silent = true })
vim.keymap.set('n', '<Leader>q'        , '<Cmd>q!<CR>', { silent = true })
vim.keymap.set('n', '<Leader>h'        , '<Cmd>q:<CR>', { silent = true})
vim.keymap.set('n', '<C-h>', '<C-w>h', { silent = true })
vim.keymap.set('n', '<C-j>', '<C-w>j', { silent = true })
vim.keymap.set('n', '<C-k>', '<C-w>k', { silent = true })
vim.keymap.set('n', '<C-l>', '<C-w>l', { silent = true })
vim.keymap.set('n', 'H', '^', { silent = true })
vim.keymap.set('n', 'J', '5j', { silent = true })
vim.keymap.set('n', 'K', '5k', { silent = true })
vim.keymap.set('n', 'L', '$', { silent = true })
vim.keymap.set('v', '<', '<gv', { silent = true })
vim.keymap.set('v', '>', '>gv', { silent = true })
vim.keymap.set('x', ' ', '', { silent = true })
vim.keymap.set('x', 'H', '^', { silent = true })
vim.keymap.set('x', 'J', '5j', { silent = true })
vim.keymap.set('x', 'K', '5k', { silent = true })
vim.keymap.set('x', 'L', '$', { silent = true })
