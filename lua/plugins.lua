local settings = require('config')
local modules = {}

-- Iterate through the properties of the settings table
for moduleName, moduleConfig in pairs(settings) do
  if moduleConfig and type(moduleConfig.lazy) == "function" then
    table.insert(modules, moduleConfig.lazy())
  end
end

require('lazy').setup(modules)
