local code_companion = {}

vim.env["CODECOMPANION_TOKEN_PATH"] = vim.fn.expand("~/.config")


function code_companion.config()

  --hotkeys for prompt library
  vim.keymap.set({ "n", "v" }, "<C-a>", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })
  vim.keymap.set({ "n", "v" }, "<Leader>ai", "<cmd>CodeCompanionChat Toggle<cr>", { noremap = true, silent = true })
  vim.keymap.set("v", "ga", "<cmd>CodeCompanionChat Add<cr>", { noremap = true, silent = true })

  -- Expand 'cc' into 'CodeCompanion' in the command line
  vim.cmd([[cab cc CodeCompanion]])
  vim.cmd([[cab ccp CodeCompanion #{buffer} /explain]])

  --Refer to: https://github.com/olimorris/codecompanion.nvim/blob/main/lua/codecompanion/config.lua
  require('codecompanion').setup({
    display = {
      diff = {
        enabled = true,
        close_chat_at = 240, -- Close an open chat buffer if the total columns of your display are less than...
        layout = "vertical", -- vertical|horizontal split for default provider
        opts = { "internal", "filler", "closeoff", "algorithm:patience", "followwrap", "linematch:120" },
        provider = "default", -- default|mini_diff
      },
    },
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
    },
  tools = {
        groups = {
          ["full_stack_dev"] = {
            description = "Full Stack Developer - Can run code, edit code and modify files",
            tools = {
              "create_file",
              "file_search",
              "grep_search",
              "insert_edit_into_file",
              "read_file",
            },
            opts = {
              collapse_tools = true,
            },
          },
          ["files"] = {
            description = "Tools related to creating, reading and editing files",
            tools = {
              "create_file",
              "file_search",
              "insert_edit_into_file",
              "read_file",
            },
            opts = {
              collapse_tools = true,
            },
          },
        },
        ["create_file"] = {
          callback = "strategies.chat.agents.tools.create_file",
          description = "Create a file in the current working directory",
          opts = {
            requires_approval = true,
          },
        },
        ["file_search"] = {
          callback = "strategies.chat.agents.tools.file_search",
          description = "Search for files in the current working directory by glob pattern",
          opts = {
            max_results = 500,
          },
        },
        ["grep_search"] = {
          callback = "strategies.chat.agents.tools.grep_search",
          enabled = function()
            -- Currently this tool only supports ripgrep
            return vim.fn.executable("rg") == 1
          end,
          description = "Search for text in the current working directory",
          opts = {
            max_results = 100,
            respect_gitignore = true,
          },
        },
        ["insert_edit_into_file"] = {
          callback = "strategies.chat.agents.tools.insert_edit_into_file",
          description = "Insert code into an existing file",
          opts = {
            requires_approval = { -- Require approval before the tool is executed?
              buffer = true, -- For editing buffers in Neovim
              file = true, -- For editing files in the current working directory
            },
            user_confirmation = false, -- Require confirmation from the user before moving on in the chat buffer?
          },
        },
        ["read_file"] = {
          callback = "strategies.chat.agents.tools.read_file",
          description = "Read a file in the current working directory",
        },
        ["next_edit_suggestion"] = {
          callback = "strategies.chat.agents.tools.next_edit_suggestion",
          description = "Suggest and jump to the next position to edit",
        },
        opts = {
          auto_submit_errors = false, -- Send any errors to the LLM automatically?
          auto_submit_success = true, -- Send any successful output to the LLM automatically?
          folds = {
            enabled = true, -- Fold tool output in the buffer?
            failure_words = { -- Words that indicate an error in the tool output. Used to apply failure highlighting
              "error",
              "failed",
              "invalid",
              "rejected",
            },
          },
          wait_timeout = 30000, -- How long to wait for user input before timing out (milliseconds)

          ---Tools and/or groups that are always loaded in a chat buffer
          ---@type string[]
          default_tools = {"full_stack_dev", "insert_edit_into_file", "read_file"},
        },
      }}
  })
end

function code_companion.lazy()
  return {
    "olimorris/codecompanion.nvim",
    opts = {},
    cmd = { "CodeCompanion", "CodeCompanionChat", "CodeCompanionActions" },
    config = code_companion.config,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "ravitemer/mcphub.nvim",
      {"MeanderingProgrammer/render-markdown.nvim",
        ft = { "markdown", "codecompanion" }},
    },
    lazy=false
  }
end

return code_companion
