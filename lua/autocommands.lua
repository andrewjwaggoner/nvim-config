local function get_index(key, themes)
  for i, v in ipairs(themes) do
    if v == key then
      return i
    end
  end
  return 0
end

vim.api.nvim_create_user_command('ColorschemeNext', function()
  local current_index = get_index(vim.g.current_style, vim.g.themes)
  local new_index = (current_index % #vim.g.themes) + 1
  local new_theme = vim.g.themes[new_index]
  vim.g.current_style = new_theme
  vim.cmd('colorscheme ' .. new_theme)
  print(new_theme)
end, {
  nargs = '*',
  desc = 'Moves to the next colorscheme we have',
})

vim.api.nvim_create_user_command('Case', function(opts)
  local words = {}
  for word in string.gmatch(opts.args, "%S+") do
    table.insert(words, word)
  end

  local mode = words[1]
  if mode == 'title' then
    vim.cmd('s/\\<./\\u&/g')
  elseif mode == 'lower' then
    vim.cmd('s/\\<.*/\\L&/g')
  elseif mode == 'upper' then
    vim.cmd('s/\\<.*/\\U&/g')
  elseif mode == 'math' then
    vim.cmd('s/\\<./\\u&/g')
  else
    print('Invalid mode')

  vim.defer_fn(function() vim.cmd('noh') end, 500)
  end
end, {
  nargs = 1,
  desc = 'Change line to have a certain casing',
})

vim.api.nvim_create_user_command('LabelStudio', function(opts)
  vim.cmd('!label-studio ' .. opts)
end, {
  nargs = '*',
  desc = 'Turn on Label Studio',
})


vim.api.nvim_create_user_command('Redir', function(ctx)
  local result = vim.api.nvim_exec2(ctx.args, { output = true })
  local lines = vim.split(result.output, '\n')
  vim.cmd('new')
  table.remove(lines,1)  -- remove the command from the output
  vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)
  vim.opt_local.modified = false
end, { nargs = '+', complete = 'command' })

