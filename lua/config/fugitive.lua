local fugitive = {}
vim.keymap.set('n', '<Leader>ga', '<Cmd>Git commit --amend<CR>', { silent = true })
vim.keymap.set('n', '<Leader>gw', '<Cmd>Git commit -a<CR>', { silent = true })
function fugitive.config()
end
function fugitive.lazy()
  return {
    'tpope/vim-fugitive',
    config = fugitive.config,
    cmd = "Git",
    lazy = true }
end

return fugitive
