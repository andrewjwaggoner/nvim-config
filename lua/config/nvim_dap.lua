local nvim_dap = {}

nvim_dap.config = function()
  dap = require('dap')
  vim.keymap.set('n', '<Leader>dt', function() dap.toggle_breakpoint() end, { silent = true })
  vim.keymap.set('n', '<Leader>ds', function() dap.step_over() end, { silent = true })
  vim.keymap.set('n', '<Leader>di', function() dap.step_into() end, { silent = true })
  vim.keymap.set('n', '<Leader>dr', function() dap.repl.open() end, { silent = true })

    dap.adapters.python = {
    type = 'executable';
    command = 'python';
    args = { '-m', 'debugpy.adapter' };
  }

end

nvim_dap.lazy = function()
  return {
    'https://github.com/mfussenegger/nvim-dap',
    name = 'nvim-dap',
    lazy = true,
    config = nvim_dap.config,
    ft = { "python", "lua", "c", "cpp", "java", "c#" }
  }
end

return nvim_dap
