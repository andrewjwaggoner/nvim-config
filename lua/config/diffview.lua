local diffview = {}
vim.keymap.set('n', '<Leader>do', '<Cmd>diffoff<CR>', { silent = true })

function diffview.config()
end

function diffview.lazy()
  return {
    'sindrets/diffview.nvim',
    config = diffview.config,
    cmd = "DiffviewOpen",
    lazy = true }
end

return diffview
