local markdown_preview = {}

function markdown_preview.config()
  vim.fn['mkdp#util#install']()
end

return markdown_preview
