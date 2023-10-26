-- NOTE: This works by installing an extension for jupyter.
-- pip install jupyter_ascending && \
-- jupyter nbextension install jupyter_ascending --sys-prefix --py && \
-- jupyter nbextension enable jupyter_ascending --sys-prefix --py && \
-- jupyter serverextension enable jupyter_ascending --sys-prefix --py
-- 
-- Afterwards, you can use the following command to make a notebook and py file.
-- python -m jupyter_ascending.scripts.make_pair --base <name>

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

local jupyter_ascending = {}
vim.keymap.set('n', '<Leader>ja', '<Cmd>call jupyter_ascending#execute_all()<CR>', { silent = true })
vim.keymap.set('n', '<Leader>je', '<Cmd>call jupyter_ascending#execute()<CR>', { silent = true })
vim.keymap.set('n', '<Leader>jk', '<Cmd>Jupyter kill<CR>', { silent = true })
vim.keymap.set('n', '<Leader>jl', '<Cmd>Jupyter on<CR>', { silent = true })
vim.keymap.set('n', '<Leader>jr', '<Cmd>call jupyter_ascending#restart()<CR>', { silent = true })

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
