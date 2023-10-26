local markdown_preview = {}

function markdown_preview.config()
  vim.fn['mkdp#util#install']()
end

function markdown_preview.cond()
  local_buffer = vim.fn.bufname("%")
  match = local_buffer:match('%.md$')
  print(vim.fn.bufname("%"):match('%.md$') == '.md')

  return vim.fn.bufname("%"):match('%.md$') == '.md'
end

function markdown_preview.lazy()
  return  {
    'iamcco/markdown-preview.nvim',
    markdown_preview.package_name,
    cond = markdown_preview.cond,
    config = markdown_preview.config }
end

return markdown_preview
