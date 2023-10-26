local fugitive = {}

function fugitive.config()
end

function fugitive.lazy()
  return {
    'tpope/vim-fugitive',
    config = fugitive.config,
    cmd = "Git",
    lazy = true,
  }
end

return fugitive
