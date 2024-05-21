-- NOTE: This works by installing an extension for jupyter.
-- pip install jupyter_ascending && \
-- jupyter nbextension install jupyter_ascending --sys-prefix --py && \
-- jupyter nbextension enable jupyter_ascending --sys-prefix --py && \
-- jupyter serverextension enable jupyter_ascending --sys-prefix --py
--
-- Afterwards, you can use the following command to make a notebook and py file.
-- python -m jupyter_ascending.scripts.make_pair --base <name>

vim.api.nvim_create_user_command('Jupyter', function(opts)
  local words = {}
  for word in string.gmatch(opts.args, "%S+") do
    table.insert(words, word)
  end
  local mode = words[1]

  if mode == nil or mode == 'on' then
    vim.cmd('silent !jupyter-svc on ' .. vim.fn.bufname())
    print("Use # %% to separate cells, # %% [markdown] for markdown cells")
  elseif mode == 'off' then
    vim.cmd('silent !jupyter-svc off ')
    print("killing jupyter notebook...")
  elseif mode == 'sync' then
    vim.cmd('silent !jupyter-svc sync ' .. vim.fn.bufname())
  elseif mode == 'execute' then
    vim.cmd('silent !jupyter-svc cell ' .. vim.fn.bufname() .. ' ' .. vim.fn.line('.'))
  elseif mode == 'all' then
    vim.cmd('silent !jupyter-svc execute "' .. vim.fn.bufname() .. '"')
  else
    vim.cmd('silent !jupyter-svc ' .. opts.args)
  end
end, {
  nargs = '*',
  desc = 'Control jupyter notebook of current buffer',
})

local jupyter_ascending = {}
vim.keymap.set('n', '<Leader>ja', '<Cmd>Jupyter all<CR>', { silent = true })
vim.keymap.set('n', '<Leader>je', '<Cmd>Jupyter execute<CR>', { silent = true })
vim.keymap.set('n', '<Leader>jk', '<Cmd>Jupyter off<CR>', { silent = true })
vim.keymap.set('n', '<Leader>jl', '<Cmd>Jupyter on<CR>', { silent = true })
vim.keymap.set('n', '<Leader>js', '<Cmd>Jupyter sync<CR>', { silent = true })

function jupyter_ascending.config()
end
function jupyter_ascending.lazy()
  return {
    'untitled-ai/jupyter_ascending.vim',
    jupyter_ascending.package_name,
    lazy = true,
    config = jupyter_ascending.config }
end

return jupyter_ascending
