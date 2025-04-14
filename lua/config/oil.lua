local oil = {}

  vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

function oil.config()
  require("oil").setup({
    float = {
    padding = 2,
    max_width = 0,
    max_height = 0,
    border = "rounded",
    win_options = {
      winblend = 0,
    }}})
end

function oil.lazy()
  return {
    'stevearc/oil.nvim',
    ---@module 'oil'
    ---@type any
    opts = {},
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = false,
  }
end

return oil
