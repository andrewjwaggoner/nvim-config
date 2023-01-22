local nvim_tree = {}

function nvim_tree.config()
  require('nvim-tree').setup({
    sync_root_with_cwd = true,
    hijack_cursor = true,
    view = {
        adaptive_size = true,
        mappings = {
          list = {
            { key = "_", action = "cd" },
          },
        },
      },
  })
end

return nvim_tree
