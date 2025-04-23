local oil = {}

  vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
  vim.keymap.set("n", "<leader>to", "<cmd>Telescope oil<CR>", { noremap = true, silent = true })

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

    require("telescope").setup({
        extensions = {
            oil = {
                hidden = true,
                debug = false,
                no_ignore = false,
                show_preview = true,
            },
        }
    })
end

function oil.lazy()
  return {
    'stevearc/oil.nvim',
    ---@module 'oil'
    ---@type any
    opts = {},
    dependencies = { "albenisolmos/telescope-oil.nvim", "nvim-tree/nvim-web-devicons" },
    lazy = false,
  }
end

return oil
