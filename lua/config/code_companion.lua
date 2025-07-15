local code_companion = {}

function code_companion.setup_env()
  -- vim.env["CODECOMPANION_TOKEN_PATH"] = vim.fn.expand("~/.config")
  vim.env.LAZY_STDPATH = ".repro"
end

function code_companion.setup_keymaps()
  vim.keymap.set({ "n", "v" }, "<C-i>", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })
  vim.keymap.set({ "n", "v" }, "<Leader>ai", "<cmd>CodeCompanionChat Toggle<cr>", { noremap = true, silent = true })
  vim.keymap.set("v", "ga", "<cmd>CodeCompanionChat Add<cr>", { noremap = true, silent = true })
  vim.keymap.set("v", "pi", "<cmd>PasteImage<cr>", { noremap = true, silent = true })
  vim.keymap.set('n', '<leader>da', function()
    require('mini.diff').apply_hunks({ cursor = true })
  end, { desc = 'Apply hunk at cursor' })
  vim.keymap.set('n', '<leader>dA', function()
    require('mini.diff').apply_hunks()
  end, { desc = 'Apply all hunks in buffer' })
end

function code_companion.setup_commands()
  vim.cmd([[cab cc CodeCompanion]])
  vim.cmd([[cab aie CodeCompanion #{buffer} /explain]])
  vim.cmd([[cab pi PasteImage]])
end

function code_companion.display_options()
  return {
    chat = {
      icons = {
        buffer_pin = " ",
        buffer_watch = "👀 ",
      },
      debug_window = {
        width = vim.o.columns - 5,
        height = vim.o.lines - 2,
      },
      window = {
        layout = "float",
        border = "single",
        height = 0.8,
        width = 0.45,
        relative = "editor",
        full_height = true,
        opts = {
          breakindent = true,
          cursorcolumn = false,
          cursorline = false,
          foldcolumn = "0",
          linebreak = true,
          list = false,
          numberwidth = 1,
          signcolumn = "no",
          spell = false,
          wrap = true,
        },
      },
      start_in_insert_mode = false,
      token_count = function(tokens, adapter)
        return " (" .. tokens .. " tokens)"
      end,
    },
  }
end

function code_companion.strategies_options()
  return {
    chat = {
      adapter = "copilot",
      roles = {
        llm = function(adapter)
          return "CodeCompanion (" .. adapter.formatted_name .. ")"
        end,
        user = "Me",
      },
      slash_commands = {
      },
      inline = { adapter = "copilot" },
      cmd = { adapter = "copilot" },
    },
  }
end

function code_companion.general_options()
  return {
    log_level = "ERROR",
    language = "English",
    send_code = true,
    job_start_delay = 1500,
    submit_delay = 2000,
    system_prompt = code_companion.system_prompt,
  }
end

function code_companion.prompt_library()
  local prompt_library = {
    ["Gentoo"] = {
      strategy = "chat",
      description = "Asks a question specifically about gentoo linux",
      opts = {
        is_slash_cmd = true,
        auto_submit = false,
        short_name = "gentoo",
      },
      prompts = {
        {
          role = "system",
          content = "You are an experienced linux developer who specifically uses gentoo. You don't care about anything else and won't mention it. 3. Do not suggest next steps if I'm giving simple orders. If I'm pondering options suggest next steps to me.",
        },
        {
          role = "user",
          content = "explain:"
        }
      },
    }
  }
  return prompt_library
end

function code_companion.build_options()
  return vim.tbl_deep_extend(
    "force",
    { prompt_library = code_companion.prompt_library()},
    code_companion.general_options(),
    { display = code_companion.display_options() },
    { strategies = code_companion.strategies_options() }
  )
end

function code_companion.config()
  code_companion.setup_env()
  code_companion.setup_keymaps()
  code_companion.setup_commands()
  require('codecompanion').setup(code_companion.build_options())
end

function code_companion.system_prompt(opts)
  local language = opts.language or "English"
  return string.format(
[[
You are an AI programming assistant named "CodeCompanion". You are currently plugged into the Neovim text editor on a user's machine.

Your core tasks include:
- Answering general programming questions.
- Explaining how the code in a Neovim buffer works.
- Reviewing the selected code from a Neovim buffer.
- Generating unit tests for the selected code.
- Proposing fixes for problems in the selected code.
- Looking at one file to and writing similar text to buffer.
- Scaffolding code for a new workspace.
- Finding relevant code to the user's query.
- Answering questions about Neovim.
- Answering questions about Linux.
- Answering guestions about Gentoo.
- Running tools.

You must:
- Follow the user's requirements carefully and to the letter.
- Use the context and attachments the user provides.
- Keep your answers short and impersonal, especially if the user's context is outside your core tasks.
- Minimize additional prose unless clarification is needed.
- Use Markdown formatting in your answers.
- Include the programming language name at the start of each Markdown code block.
- Do not include line numbers in code blocks.
- Avoid wrapping the whole response in triple backticks.
- Only return code that's directly relevant to the task at hand. You may omit code that isn’t necessary for the solution.
- Avoid using H1, H2 or H3 headers in your responses as these are reserved for the user.
- Use actual line breaks in your responses; only use "\n" when you want a literal backslash followed by 'n'.
- All non-code text responses must be written in the %s language indicated.
- Multiple, different tools can be called as part of the same response.

When given a task:
1. Think step-by-step and, unless the user requests otherwise or the task is very simple, describe your plan in detailed pseudocode.
2. Output the final code in a single code block, ensuring that only relevant code is included.
3. Do not suggest next steps if I'm giving simple orders. If I'm pondering options suggest next steps to me.
4. Provide exactly one complete reply per conversation turn.
5. If necessary, execute multiple tools in a single turn.]],
    language
  )
end

function code_companion.img_clip_dep()
  local img_clip_dep = {
  "HakonHarnes/img-clip.nvim",
  opts = {
    filetypes = {
      codecompanion = {
        prompt_for_file_name = false,
        template = "/tmp/[Image]($FILE_PATH)",
        use_absolute_path = true,
      },
    },
  },
}
  return img_clip_dep
end

function code_companion.mini_dep()
  local mini_dep = {
    "echasnovski/mini.diff",
    config = function()
      local diff = require("mini.diff")
      diff.setup({
        source = diff.gen_source.none(),
        signs = {
          add = { text = "+", hl = "DiffAdd" },
          change = { text = "~", hl = "DiffChange" },
          delete = { text = "_", hl = "DiffDelete" },
        },
        view = {
          style = "sign",
          show_deleted = true,
          show_untracked = true,
        },
        mappings = {
          apply = "ga",
          reset = "gr",
          stage = "gs",
          unstage = "gu",
        },
        highlight = {
          enabled = true,
          style = "line",
        },
      })
    end,
  }

  return mini_dep
end

function code_companion.blink_dep()
  local blink_dep = {
    ' saghen/blink.cmp',
    -- optional: provides snippets for the snippet source
    dependencies = { 'rafamadriz/friendly-snippets' },
    version = '1.*',
    opts = {
      'enter',
      keymap = { preset = 'default' },
      appearance = {
        nerd_font_variant = 'normal'
      },
      completion = { documentation = { auto_show = false },
        ghost_text = {
          enabled = false,
          show_with_selection = true,
          show_without_selection = false,
          show_with_menu = true,
          show_without_menu = true,
        },
      },
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
      },
      fuzzy = { implementation = "prefer_rust_with_warning" }
    },
    opts_extend = { "sources.default" }
  }
  return blink_dep
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
      code_companion.img_clip_dep(),
      code_companion.mini_dep(),
      code_companion.blink_dep(),
    },
    lazy=false,
  }
end

return code_companion
