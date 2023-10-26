local nvim_colorizer = {}

function nvim_colorizer.config()
  require('colorizer').setup({ '*' }) -- do it on all filetypes
end

function nvim_colorizer.lazy()
  return {
    'norcalli/nvim-colorizer.lua',
    config = nvim_colorizer.config,
    lazy = false,
  }
end
return nvim_colorizer
