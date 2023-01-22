function map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

function cmd(command)
  return ':' .. command .. '<CR>'
end

function nmap(lhs, rhs, opts)
  map('n', lhs, rhs, opts)
end

function vmap(lhs, rhs, opts)
  map('v', lhs, rhs, opts)
end

function imap(lhs, rhs, opts)
  map('i', lhs, rhs, opts)
end

function xmap(lhs, rhs, opts)
  map('x', lhs, rhs, opts)
end

local stdopts = { silent = true }

vim.g.mapleader = ' '
vim.api.nvim_set_keymap("i", "<Tab>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
--imap('<Leader><Tab>', cmd('copilot#Accept("<CR>")'), stdopts)
nmap('<Leader>ex', cmd('Explore!'), stdopts)
nmap('<Leader><ESC>', cmd('qa!'), stdopts)
nmap('<Leader>?', cmd("execute 'vimgrep /'.@/.'/g %'<CR>:copen"), stdopts)
nmap('<Leader>bd', cmd('bd!'), stdopts)
nmap('<Leader>bn', cmd('DashboardNewFile'), stdopts)
nmap('<Leader>br', cmd('Telescope oldfiles'), stdopts)
nmap('<Leader>cc', cmd('Colortils picker'), stdopts)
nmap('<Leader>cd', cmd('Copilot disable'), stdopts)
nmap('<Leader>ce', cmd('Copilot enable'), stdopts)
nmap('<Leader>cg', cmd('GitCommit'), stdopts)
nmap('<Leader>ch', cmd('AutoCmpOn'), stdopts)
nmap('<Leader>cl', cmd('AutoCmpOff'), stdopts)
nmap('<Leader>cp', cmd('Copilot panel'), stdopts)
nmap('<Leader>e', cmd('e'), stdopts)
nmap('<Leader>fb', cmd('Telescope buffers'), stdopts)
nmap('<Leader>ff', cmd('Telescope find_files'), stdopts)
nmap('<Leader>fg', cmd('Telescope live_grep'), stdopts)
nmap('<Leader>fm', cmd('Telescope treesitter'))
nmap('<Leader>fo', cmd('Telescope oldfiles'))
nmap('<Leader>fr', cmd('Telescope registers'), stdopts)
nmap('<Leader>fs', cmd('Telescope spell_suggest'))
nmap('<Leader>gb', cmd('GitMessenger'), stdopts)
nmap('<Leader>gc', cmd('Telescope git_commits'), stdopts)
nmap('<Leader>gd', cmd('Telescope git_bcommits'), stdopts)
nmap('<Leader>gr', cmd('Telescope git_branches'), stdopts)
nmap('<Leader>gs', cmd('Telescope git_status'), stdopts)
nmap('<Leader>gt', cmd('Telescope git_stash'), stdopts)
nmap('<Leader>bd', cmd('Telescope find_files cwd=~/.config/nvim/ search_dirs=snippets,keymap,lua,core,init.lua'), stdopts)
nmap('<Leader>ll', cmd('LspLines'), stdopts)
nmap('<Leader>oh', cmd('noh'), stdopts)
nmap('<Leader>pc', cmd('PackerCompile'), stdopts)
nmap('<Leader>pi', cmd('PackerInstall'), stdopts)
nmap('<Leader>pm', cmd('MarkdownPreview'), stdopts)
nmap('<Leader>pu', cmd('PackerUpdate'), stdopts)
nmap('<Leader>q', cmd('q'), stdopts)
nmap('<Leader>r', cmd('TroubleToggle'), stdopts)
nmap('<Leader>sl', cmd('SessionsLoad'), stdopts)
nmap('<Leader>ss', cmd('SessionsSave'), stdopts)
nmap('<Leader>t', cmd('NvimTreeToggle'), stdopts)
nmap('<Leader>ww', cmd('w'), stdopts)
nmap('<c-h>', '<c-w>h', stdopts)
nmap('<c-j>', '<c-w>j', stdopts)
nmap('<c-k>', '<c-w>k', stdopts)
nmap('<c-l>', '<c-w>l', stdopts)
nmap('H', '^', stdopts)
nmap('J', '5j', stdopts)
nmap('K', '5k', stdopts)
nmap('L', '$', stdopts)
vmap('<', '<gv', stdopts)
vmap('>', '>gv', stdopts)
xmap(' ', '', stdopts)
xmap('H', '^', stdopts)
xmap('J', '5j', stdopts)
xmap('K', '5k', stdopts)
xmap('L', '$', stdopts)
