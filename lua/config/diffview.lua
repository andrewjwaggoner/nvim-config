local diffview = {}

function diffview.config()
end

function diffview.lazy()
  return {
    'sindrets/diffview.nvim',
    config = diffview.config,
    cmd = "DiffView",
    lazy = true,
  }
end

return diffview
