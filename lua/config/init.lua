local plugins = {}

local function is_windows()
  return package.config:sub(1, 1) == '\\'
end

local function get_api_directory_call()
  if is_windows() then
    return "dir /B "
  end
  return "ls " 
end

local function get_current_file_path()
  local str = debug.getinfo(2, "S").source:sub(2)
  local match = str:match("(.*[/\\])")
  if is_windows() then
    match = string.gsub(match, "/", "\\")
  end
  return match
end

local function getLuaFiles(nvim_directory)
  local luaFiles = {}
  local cmd = get_api_directory_call() .. nvim_directory .. '*.lua'
  local success, pipe = pcall(io.popen, cmd, 'r')

  if success then
    for line in pipe:lines() do
      if line ~= 'init.lua' and line ~= nil then
        table.insert(luaFiles, line)
      end
    end
    pipe:close()
  else
  end
  return luaFiles
end

-- Load modules based on file names
local luaFiles = getLuaFiles(get_current_file_path())

for _, filename in ipairs(luaFiles) do
    local moduleName = filename:match(".*(config[/\\].+)%..+")
    if moduleName and moduleName ~= 'config/init' then
        plugins[moduleName] = require(moduleName)
    end
end

return plugins
