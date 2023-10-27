function get_index(key, themes)
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
  require('config/galaxyline').config()
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
  end
end, {
  nargs = 1,
  desc = 'Change line to have a certain casing',
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

