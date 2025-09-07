local code_companion = {}

function code_companion.setup_env()
  vim.env["CODECOMPANION_TOKEN_PATH"] = vim.fn.expand("~/.config")
  vim.env.LAZY_STDPATH = ".repro"
end

function code_companion.setup_keymaps()
  vim.keymap.set({ "n", "v" }, "<C-i>", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })
  vim.keymap.set({ "n", "v" }, "<Leader>ai", "<cmd>CodeCompanionChat Toggle<cr>", { noremap = true, silent = true })
  vim.keymap.set("v", "cca", "<cmd>CodeCompanionChat Add<cr>", { noremap = true, silent = true })
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
  vim.cmd([[cab ccb CodeCompanion #{buffer} #{chat}]])
  vim.cmd([[cab aie CodeCompanion #{buffer} #{chat} /explain]])
  vim.cmd([[cab pi PasteImage]])
end

function code_companion.display_options()
  return {
    action_palette = {
      width = 95,
      height = 10,
      prompt = "Prompt ", -- Prompt used for interactive LLM calls
      provider = "telescope",
      opts = {
        show_default_actions = false,
        show_default_prompt_library = false,
        title = "CodeCompanion actions",
      },
    },
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
        layout = "vertical",
        position = "right",
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
      start_in_insert_mode = true,
      token_count = function(tokens, adapter)
        return " (" .. adapter .. ": " .. tokens .. " tokens)"
      end,
    },
  }
end

function code_companion.spinner_options()
    return {
      extensions = {
        spinner = {},
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
    job_start_delay = 250,
    submit_delay = 500,
    system_prompt = code_companion.system_prompt,
  }
end

function code_companion.prompt_library()
  local join_prompts = function(tbl)
    local prompts = {}
    for _, entry in ipairs(tbl) do
      if type(entry) == "table" then
        for _, p in ipairs(entry) do
          table.insert(prompts, p)
        end
      end
    end
    return prompts
  end

  local prompt_library = {
    ["Automate"] = require("prompts.automate"),
    ["Gentoo"] = require("prompts.gentoo"),
    ["Genealogy"] = require("prompts.genealogy"),
    ["Code Flow"] = require("workflows.codeflow"),
  }

  -- If a prompt file returns a table with multiple prompt sets, join them
  for _, v in pairs(prompt_library) do
    if v.prompts and type(v.prompts[1]) == "table" and type(v.prompts[1].role) ~= "string" then
      v.prompts = join_prompts(v.prompts)
    end
  end

  return prompt_library
end

function code_companion.build_options()
  return vim.tbl_deep_extend(
    "force",
    { prompt_library = code_companion.prompt_library()},
    code_companion.general_options(),
    { display = code_companion.display_options() },
    { strategies = code_companion.strategies_options(),
      opts = code_companion.spinner_options() }
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
  return string.format(require("prompts.system"), language)
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

function code_companion.lazy()
  return {
    "olimorris/codecompanion.nvim",
    cmd = { "CodeCompanion", "CodeCompanionChat", "CodeCompanionActions" },
    config = code_companion.config,
    event = "VeryLazy",
    dependencies = {
      {"nvim-lua/plenary.nvim", version = false},
      {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
      "franco-ruggeri/codecompanion-spinner.nvim",
      code_companion.img_clip_dep(),
      code_companion.mini_dep(),
    },
  }
end

return code_companion
