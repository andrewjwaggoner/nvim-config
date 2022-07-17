-- Put plugins key definitions in this file
require('keymap.config')
local key = require('core.keymap')
local nmap = key.nmap
local silent,noremap = key.silent,key.noremap
local opts = key.new_opts
local cmd = key.cmd

nmap {
  -- packer
  {'<Leader>pu',cmd('PackerUpdate'),opts(noremap,silent)},
  {'<Leader>pi',cmd('PackerInstall'),opts(noremap,silent)},
  {'<Leader>pc',cmd('PackerCompile'),opts(noremap,silent)},
  -- dashboard
  {'<Leader>n',cmd('DashboardNewFile'),opts(noremap,silent)},
  {'<Leader>ss',cmd('SessionSave'),opts(noremap,silent)},
  {'<Leader>sl',cmd('SessionLoad'),opts(noremap,silent)},
  -- Telescope
  {'<Leader>b',cmd('Telescope buffers'),opts(noremap,silent)},
  {'<Leader>fa',cmd('Telescope live_grep'),opts(noremap,silent)},
  {'<Leader>ff',cmd('Telescope find_files'),opts(noremap,silent)},
  -- Markdown Preview
  {'<Leader>mp',cmd('MarkdownPreview'),opts(noremap,silent)},
  {'<Leader>t',cmd('NvimTreeToggle'),opts(noremap,silent)},
  {'<Leader>gm',cmd('GitMessenger'),opts(noremap,silent)},
  {'<Leader>cp',cmd('Colortils picker'),opts(noremap,silent)},
}

vim.api.nvim_create_user_command('TitleCase', function()
  vim.cmd("s/\\<./\\u&/g")
  vim.cmd("noh")
end, {
    nargs = "*",
    desc = "Say hi to someone",
})

-- ":s/\<./\u&/g"
