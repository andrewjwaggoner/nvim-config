--- Helper methods to parse parameters
function Extract_words(str)
  local words = {}
  for word in string.gmatch(str, "%S+") do
    table.insert(words, word)
  end
  return words
end

-- custom commands for easy casing functions
vim.api.nvim_create_user_command('TitleCase', function()
  vim.cmd('s/\\<./\\u&/g')
  vim.cmd('noh')
end, {
  nargs = 0,
  desc = 'Change line to have title casing',
})

vim.api.nvim_create_user_command('LowerCase', function()
  vim.cmd('s/\\<.*/\\L&/g')
  vim.cmd('noh')
end, {
  nargs = 0,
  desc = 'Change line to have lower casing',
})

vim.api.nvim_create_user_command('UpperCase', function()
  vim.cmd('s/\\<.*/\\U&/g')
  vim.cmd('noh')
end, {
  nargs = 0,
  desc = 'Change line to have upper casing',
})

vim.api.nvim_create_user_command('MathCast', function()
  vim.cmd('s/\\<./\\u&/g')
  vim.cmd('noh')
end, {
  nargs = 0,
  desc = 'Convert math words to symbols',
})

vim.api.nvim_create_user_command('Jupyter', function(opts)
  local words = Extract_words(opts.args)
  local mode = words[1]

  if mode == nil then
    vim.cmd('!jupyter-svc on ' .. vim.fn.bufname())
    print("Use # %% to separate cells, # %% [markdown] for markdown cells")
    return
  else
    vim.cmd('!jupyter-svc ' .. opts.args)
  end
end, {
  nargs = '*',
  desc = 'Control jupyter notebook of current buffer',
})

vim.api.nvim_create_user_command('LabelStudio', function(opts)
  vim.cmd('!label-studio ' .. opts)
end, {
  nargs = '*',
  desc = 'Turn on label studio',
})

vim.api.nvim_create_user_command('Redir', function(ctx)
  local lines = vim.split(vim.api.nvim_exec(ctx.args, true), '\n', { plain = true })
  vim.cmd('new')
  table.remove(lines,1)  -- remove the command from the output
  vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)
  vim.opt_local.modified = false
end, { nargs = '+', complete = 'command' })

vim.api.nvim_create_user_command('Put', function(cmd)
  vim.cmd('silent! let @a = execute(\'!' .. cmd.args .. '\')')
  -- Remove lines command and whitespace from the register
  local register_content = vim.fn.getreg('a')
  local lines = vim.split(register_content, '\n')
  table.remove(lines, 1)
  table.remove(lines, 1)
  table.remove(lines, 1)
  local updated_content = table.concat(lines, '\n')
  vim.fn.setreg('a', updated_content)
  -- Output to buffer
  vim.api.nvim_command('normal! \"ap')
end, {
  nargs = '*',
  desc = 'Put the output of a command into the current buffer',
})

