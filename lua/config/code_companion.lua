local code_companion = {}



function code_companion.config()

  --vim.env["CODECOMPANION_TOKEN_PATH"] = vim.fn.expand("~/.config")
  vim.env.LAZY_STDPATH = ".repro"

  --hotkeys for prompt library
  vim.keymap.set({ "n", "v" }, "<C-a>", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })
  vim.keymap.set({ "n", "v" }, "<Leader>ai", "<cmd>CodeCompanionChat Toggle<cr>", { noremap = true, silent = true })
  vim.keymap.set("v", "ga", "<cmd>CodeCompanionChat Add<cr>", { noremap = true, silent = true })

  -- Expand 'cc' into 'CodeCompanion' in the command line
  vim.cmd([[cab cc CodeCompanion]])
  vim.cmd([[cab ccp CodeCompanion #{buffer} /explain]])

  --Refer to: https://github.com/olimorris/codecompanion.nvim/blob/main/lua/codecompanion/config.lua
  require('codecompanion').setup({
    strategies = {
      chat = {
      adapter = "copilot",
      roles = {
        ---The header name for the LLM's messages
        ---@type string|fun(adapter: CodeCompanion.Adapter): string
        llm = function(adapter)
          return "CodeCompanion (" .. adapter.formatted_name .. ")"
        end,

        ---The header name for your messages
        ---@type string
        user = "Me",
      },
      inline = { adapter = "copilot" },
    },
    opts = {
      log_level = "DEBUG",
    }
  }})
end

function code_companion.lazy()
  return {
    "olimorris/codecompanion.nvim",
    opts = {},
    cmd = { "CodeCompanion", "CodeCompanionChat", "CodeCompanionActions" },
    config = code_companion.config,
    dependencies = {
      {"nvim-lua/plenary.nvim"},
      {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
      {
       "saghen/blink.cmp",
       lazy = false,
       version = "*",
       opts = {
         keymap = {
           preset = "enter",
           ["<S-Tab>"] = { "select_prev", "fallback" },
           ["<Tab>"] = { "select_next", "fallback" },
         },
         cmdline = { sources = { "cmdline" } },
         sources = {
           default = { "lsp", "path", "buffer" },
         },
       },
     },
    },
    lazy=false,
  }
end

return code_companion
