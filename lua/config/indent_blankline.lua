local indent_blankline = {}

function indent_blankline.config()
end
function indent_blankline.lazy()
  return {
    'lukas-reineke/indent-blankline.nvim',
    config = indent_blankline.config,
    lazy = false }
end

return indent_blankline
