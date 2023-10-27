local plugins = {}

local function is_windows()
  return package.config:sub(1, 1) == '\\'
end

local function get_directory_command()
  if is_windows() then
    return "where " .. vim.fn.stdpath('config') .. '/lua/config:*.lua'
  end
  return 'find ' .. vim.fn.stdpath('config') .. '/lua/config/ -type f'
end

local function get_config_files()
  local configFiles = {}
  local success, pipe = pcall(io.popen, get_directory_command(), 'r')

  if success then
    for line in pipe:lines() do
      if line ~= 'init.lua' and line ~= nil then -- ignore current file for obvious reasons
        table.insert(configFiles, line)
      end
    end
    pipe:close()
  else
    print('Error while reading config directory: ' .. vim.fn.getcwd())
  end
  return configFiles
end

-- Load modules based on file names
for _, filename in ipairs(get_config_files()) do
  local moduleName = filename:match(".*[/\\](.*).lua") or ''
  if moduleName and (moduleName ~= 'init' and moduleName ~= 'config/init') then
    plugins[moduleName] = require('config/' .. moduleName)
  end
end

return plugins
