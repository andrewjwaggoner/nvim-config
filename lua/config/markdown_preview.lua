local markdown_preview = {}

function markdown_preview.config()
  vim.fn['mkdp#util#install']()
end

function markdown_preview.lazy()
  return  {
    'iamcco/markdown-preview.nvim',
    markdown_preview.package_name,
    lazy = false,
    cmd = 'MarkdownPreview',
    config = markdown_preview.config }
end

return markdown_preview
