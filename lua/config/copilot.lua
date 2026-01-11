local copilot = {}

function copilot.config()
  vim.g.copilot_enabled = 1
  vim.g.copilot_filetypes = {
    ["TelescopePrompt"] = false,
    ["markdown"] = true,
    ["lua"] = true,
    ["python"] = true,
  }
  vim.api.nvim_set_keymap("i", "<C-c>", "copilot#Accept('<CR>')", { expr = true, silent = true })
end

function copilot.set_workspace_to_cwd()
  local cwd = vim.fn.getcwd()
  vim.g.copilot_workspace = cwd
  vim.g.copilot_workspace_folders = { cwd }
end

function copilot.lazy()
  return {
    "github/copilot.vim",
    config = copilot.config,
    event = "InsertEnter",
    lazy = false,
  }
end

vim.api.nvim_create_user_command('MakeAiWorkFile', function()
  copilot.set_workspace_to_cwd()
  vim.cmd('edit ' .. vim.fn.expand('%:p'))
end, { desc = 'Set Copilot workspace to current file' })

vim.api.nvim_create_user_command('MakeAiWorkDir', function()
  copilot.set_workspace_to_cwd()
end, { desc = 'Set Copilot workspace to current working directory' })

return copilot


