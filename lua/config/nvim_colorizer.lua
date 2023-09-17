local nvim_colorizer = {}

function nvim_colorizer.config()
  require('colorizer').setup({ '*' }) -- do it on all filetypes
end

return nvim_colorizer
