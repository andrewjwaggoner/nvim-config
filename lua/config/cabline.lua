local cabline = {}

function cabline.config()
  require('cabline').setup({})
end
function cabline.lazy()
  return {
    'andrewjwaggoner/cabline.nvim',
    cabline.package_name, 
    config = cabline.config, 
    lazy=true }
end

return cabline
