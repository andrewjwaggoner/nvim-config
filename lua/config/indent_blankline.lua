local indent_blankline = {}

function indent_blankline.config()
  require("ibl").setup({})
end
function indent_blankline.lazy()
  return {
    'lukas-reineke/indent-blankline.nvim',
    config = indent_blankline.config,
    lazy = false,
    main = 'ibl' }
end

return indent_blankline
