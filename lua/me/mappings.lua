local stdopts = { silent = true }
local ls = require('luasnip')

vim.g.mapleader = ' '

vim.keymap.set("i", "<C-K>", function() ls.expand_or_jump() end, {silent = true})
vim.keymap.set("i", "<C-H>", function() ls.jump(-1) end, {silent = true})
vim.keymap.set("i", "<C-L>", function() ls.jump( 1) end, {silent = true})
vim.keymap.set("i", "<C-E>", function() if ls.choice_active() then ls.change_choice(1) end end, {silent = true})

vim.keymap.set("s", "<C-K>", function() ls.expand() end, {silent = true})
vim.keymap.set("s", "<C-H>", function() ls.jump(-1) end, {silent = true})
vim.keymap.set("s", "<C-L>", function() ls.jump( 1) end, {silent = true})
vim.keymap.set("s", "<C-E>", function() if ls.choice_active() then ls.change_choice(1) end end, {silent = true})

vim.keymap.set('n', '<Leader><ESC>'    , '<Cmd>qa!<CR>', stdopts)
vim.keymap.set('n', '<Leader><Leader>c', '<Cmd>source ~/.config/nvim/init.lua<CR>', stdopts)
vim.keymap.set('n', '<Leader><Leader>s', '<Cmd>source ~/.config/nvim/lua/me/config/luasnip.lua<CR>', stdopts)
vim.keymap.set('n', '<Leader>?'        , '<Cmd>execute "vimgrep /" . @/ . "/g %" <bar> copen<CR>', stdopts)
vim.keymap.set('n', '<Leader>cc'       , '<Cmd>Colortils picker<CR>', stdopts)
vim.keymap.set('n', '<Leader>cd'       , '<Cmd>Copilot disable<CR>', stdopts)
vim.keymap.set('n', '<Leader>ce'       , '<Cmd>Copilot enable<CR>', stdopts)
vim.keymap.set('n', '<Leader>cg'       , '<Cmd>Git commit -a<CR>', stdopts)
vim.keymap.set('n', '<Leader>cp'       , '<Cmd>Copilot panel<CR>', stdopts)
vim.keymap.set('n', '<Leader>ex'       , '<Cmd>Explore!<CR>', stdopts)
vim.keymap.set('n', '<Leader>fb'       , '<Cmd>Telescope buffers<CR>', stdopts)
vim.keymap.set('n', '<Leader>ff'       , '<Cmd>Telescope find_files<CR>', stdopts)
vim.keymap.set('n', '<Leader>fg'       , '<Cmd>Telescope live_grep<CR>', stdopts)
vim.keymap.set('n', '<Leader>fm'       , '<Cmd>Telescope treesitter<CR>', stdopts)
vim.keymap.set('n', '<Leader>fo'       , '<Cmd>Telescope oldfiles<CR>', stdopts)
vim.keymap.set('n', '<Leader>fr'       , '<Cmd>Telescope registers<CR>', stdopts)
vim.keymap.set('n', '<Leader>fs'       , '<Cmd>Telescope spell_suggest<CR>', stdopts)
vim.keymap.set('n', '<Leader>ga'       , '<Cmd>Git commit --amend<CR>', stdopts)
vim.keymap.set('n', '<Leader>gc'       , '<Cmd>Telescope git_commits<CR>', stdopts)
vim.keymap.set('n', '<Leader>gd'       , '<Cmd>Telescope git_bcommits<CR>', stdopts)
vim.keymap.set('n', '<Leader>gr'       , '<Cmd>Telescope git_branches<CR>', stdopts)
vim.keymap.set('n', '<Leader>gs'       , '<Cmd>Telescope git_status<CR>', stdopts)
vim.keymap.set('n', '<Leader>gt'       , '<Cmd>Telescope git_stash<CR>', stdopts)
vim.keymap.set('n', '<Leader>hh'       , '<Cmd>GitMessenger<CR>', stdopts)
vim.keymap.set('n', '<Leader>ja'       , '<Cmd>call jupyter_ascending#execute_all()<CR>', stdopts)
vim.keymap.set('n', '<Leader>je'       , '<Cmd>call jupyter_ascending#execute()<CR>', stdopts)
vim.keymap.set('n', '<Leader>jk'       , '<Cmd>Jupyter kill<CR>', stdopts)
vim.keymap.set('n', '<Leader>jl'       , '<Cmd>Jupyter on<CR>', stdopts)
vim.keymap.set('n', '<Leader>jr'       , '<Cmd>call jupyter_ascending#restart()<CR>', stdopts)
vim.keymap.set('n', '<Leader>nc'       , '<Cmd>Telescope find_files cwd=~/.config/nvim/ search_dirs=snippets,keymap,lua,core,init.lua<CR>', stdopts)
vim.keymap.set('n', '<Leader>oh'       , '<Cmd>noh<CR>', stdopts)
vim.keymap.set('n', '<Leader>pc'       , '<Cmd>PackerCompile<CR>', stdopts)
vim.keymap.set('n', '<Leader>pi'       , '<Cmd>PackerInstall<CR>', stdopts)
vim.keymap.set('n', '<Leader>pm'       , '<Cmd>MarkdownPreview<CR>', stdopts)
vim.keymap.set('n', '<Leader>pu'       , '<Cmd>PackerUpdate<CR>', stdopts)
vim.keymap.set('n', '<Leader>q'        , '<Cmd>q!<CR>', stdopts)
vim.keymap.set('n', '<Leader>r'        , '<Cmd>TroubleToggle<CR>', stdopts)
vim.keymap.set('n', '<Leader>sl'       , '<Cmd>SessionsLoad<CR>', stdopts)
vim.keymap.set('n', '<Leader>ss'       , '<Cmd>SessionsSave<CR>', stdopts)
vim.keymap.set('n', '<Leader>t'        , '<Cmd>NvimTreeToggle<CR>', stdopts)
vim.keymap.set('n', '<Leader>z'        , '<Cmd>Zeavim<CR>', stdopts)

vim.keymap.set('n', '<C-h>', '<C-w>h', stdopts)
vim.keymap.set('n', '<C-j>', '<C-w>j', stdopts)
vim.keymap.set('n', '<C-k>', '<C-w>k', stdopts)
vim.keymap.set('n', '<C-l>', '<C-w>l', stdopts)

vim.keymap.set('n', 'H', '^', stdopts)
vim.keymap.set('n', 'J', '5j', stdopts)
vim.keymap.set('n', 'K', '5k', stdopts)
vim.keymap.set('n', 'L', '$', stdopts)
vim.keymap.set('v', '<', '<gv', stdopts)
vim.keymap.set('v', '>', '>gv', stdopts)
vim.keymap.set('x', ' ', '', stdopts)
vim.keymap.set('x', 'H', '^', stdopts)
vim.keymap.set('x', 'J', '5j', stdopts)
vim.keymap.set('x', 'K', '5k', stdopts)
vim.keymap.set('x', 'L', '$', stdopts)

