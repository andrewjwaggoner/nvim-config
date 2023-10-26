local colortils = {}

function colortils.config()
  require('colortils').setup()
end

function colortils.lazy()
  return {
    'nvim-colortils/colortils.nvim',
    config = colortils.config,
    cmd = "Colortils",
    lazy = true,
  }
end
return colortils
