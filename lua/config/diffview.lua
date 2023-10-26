local diffview = {}

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
