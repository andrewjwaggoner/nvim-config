-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/andrew/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/andrew/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/andrew/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/andrew/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/andrew/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["cabline.nvim"] = {
    config = { "\27LJ\2\n9\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\fcabline\frequire\0" },
    loaded = true,
    path = "/Users/andrew/.local/share/nvim/site/pack/packer/start/cabline.nvim",
    url = "https://github.com/andrewjwaggoner/cabline.nvim"
  },
  ["colortils.nvim"] = {
    commands = { "Colortils" },
    config = { "\27LJ\2\n;\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14colortils\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/andrew/.local/share/nvim/site/pack/packer/opt/colortils.nvim",
    url = "https://github.com/max397574/colortils.nvim"
  },
  ["copilot.vim"] = {
    loaded = true,
    path = "/Users/andrew/.local/share/nvim/site/pack/packer/start/copilot.vim",
    url = "https://github.com/github/copilot.vim"
  },
  ["galaxyline.nvim"] = {
    config = { "\27LJ\2\n\20\0\0\1\0\1\0\2'\0\0\0L\0\2\0\t‚ñä Â\3\0\0\a\1&\0M5\0\1\0-\1\0\0009\1\0\1=\1\2\0-\1\0\0009\1\3\1=\1\4\0-\1\0\0009\1\5\1=\1\6\0-\1\0\0009\1\a\1=\1\b\0-\1\0\0009\1\t\1=\1\n\0-\1\0\0009\1\0\1=\1\v\0-\1\0\0009\1\0\1=\1\f\0-\1\0\0009\1\r\1=\1\14\0-\1\0\0009\1\15\1=\1\16\0-\1\0\0009\1\0\1=\1\17\0-\1\0\0009\1\0\1=\1\18\0-\1\0\0009\1\a\1=\1\19\0-\1\0\0009\1\20\1=\1\21\0-\1\0\0009\1\a\1=\1\22\0-\1\0\0009\1\20\1=\1\23\0-\1\0\0009\1\5\1=\1\24\0-\1\0\0009\1\5\1=\1\25\0-\1\0\0009\1\0\1=\1\26\0-\1\0\0009\1\3\1=\1\27\0-\1\0\0009\1\3\1=\1\28\0006\1\29\0009\1\30\0019\1\31\1'\3 \0006\4\29\0009\4!\0049\4\"\4B\4\1\0028\4\4\0'\5#\0-\6\0\0009\6$\6&\3\6\3B\1\2\1'\1%\0L\1\2\0\2¿\nÔåå  \abg\f guibg=\tmode\afn\27hi GalaxyViMode guifg=\17nvim_command\bapi\bvim\6V\6v\6t\6S\6s\aRv\arm\6R\vviolet\6r\ano\6n\aic\vyellow\6i\ngreen\acv\ace\6c\fmagenta\ar?\tcyan\6\19\vorange\6\22\tblue\6!\1\0\0\bredS\0\0\2\0\4\0\v5\0\0\0006\1\1\0009\1\2\0019\1\3\0018\1\1\0\15\0\1\0X\2\2Ä+\1\1\0L\1\2\0+\1\2\0L\1\2\0\rfiletype\abo\bvim\1\0\2\5\2\14dashboard\2\21\0\0\1\0\1\0\2'\0\0\0L\0\2\0\n Ôëø \17\0\0\1\0\1\0\2'\0\0\0L\0\2\0\6 \20\0\0\1\0\1\0\2'\0\0\0L\0\2\0\t ‚ñäè\22\1\0\f\0}\0Õ\0026\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1Ä2\0EÅ6\2\1\0'\4\3\0B\2\2\0029\2\4\0026\3\1\0'\5\5\0B\3\2\0029\4\6\0015\5\b\0=\5\a\0019\5\t\0045\6\16\0005\a\v\0003\b\n\0=\b\f\a4\b\3\0009\t\r\2>\t\1\b9\t\14\2>\t\2\b=\b\15\a=\a\17\6>\6\1\0059\5\t\0045\6\20\0005\a\19\0003\b\18\0=\b\f\a=\a\21\6>\6\2\0059\5\t\0045\6\26\0005\a\23\0009\b\22\3=\b\24\a4\b\3\0009\t\25\2>\t\1\b9\t\14\2>\t\2\b=\b\15\a=\a\27\6>\6\3\0059\5\t\0045\6\31\0005\a\28\0009\b\22\3=\b\24\a4\b\3\0006\t\1\0'\v\29\0B\t\2\0029\t\30\t>\t\1\b9\t\14\2>\t\2\b=\b\15\a=\a \6>\6\4\0059\5\t\0045\6#\0005\a!\0009\b\22\3=\b\24\a5\b\"\0009\t\25\2>\t\1\b9\t\14\2>\t\2\b=\b\15\a=\a$\6>\6\5\0059\5\t\0045\6(\0005\a%\0004\b\3\0009\t\25\2>\t\1\b9\t\14\2>\t\2\b=\b\15\a5\b&\0009\t\14\2>\t\2\b=\b'\a=\a)\6>\6\6\0059\5\t\0045\6-\0005\a+\0005\b*\0009\t\25\2>\t\1\b9\t\14\2>\t\2\b=\b\15\a5\b,\0009\t\14\2>\t\2\b=\b'\a=\a.\6>\6\a\0059\5\t\0045\0061\0005\a0\0004\b\3\0009\t/\2>\t\1\b9\t\14\2>\t\2\b=\b\15\a=\a2\6>\6\b\0059\5\t\0045\0065\0005\a4\0004\b\3\0009\t3\2>\t\1\b9\t\14\2>\t\2\b=\b\15\a=\a6\6>\6\t\0059\5\t\0045\0069\0005\a8\0004\b\3\0009\t7\2>\t\1\b9\t\14\2>\t\2\b=\b\15\a=\a:\6>\6\n\0059\5\t\0045\6<\0005\a;\0004\b\3\0009\t\r\2>\t\1\b9\t\14\2>\t\2\b=\b\15\a=\a=\6>\6\v\0059\5>\0045\6B\0005\a@\0003\b?\0=\b\24\a5\bA\0009\t3\2>\t\1\b9\t\14\2>\t\2\b=\b\15\a=\aC\6>\6\1\0059\5D\0045\6J\0005\aF\0009\bE\3=\b\24\a5\bH\0009\tG\2>\t\1\b9\t\14\2>\t\2\b=\b\15\a5\bI\0009\t\14\2>\t\2\b=\b'\a=\aK\6>\6\1\0059\5D\0045\6O\0005\aL\0009\bE\3=\b\24\a5\bM\0009\tG\2>\t\1\b9\t\14\2>\t\2\b=\b\15\a5\bN\0009\t\14\2>\t\2\b=\b'\a=\aP\6>\6\2\0059\5D\0045\6W\0005\aR\0003\bQ\0=\b\f\a9\bS\3=\b\24\a5\bU\0009\tT\2>\t\1\b9\t\14\2>\t\2\b=\b\15\a5\bV\0009\t\14\2>\t\2\b=\b'\a=\aX\6>\6\3\0059\5D\0045\6[\0005\aY\0009\bS\3=\b\24\a5\bZ\0009\tT\2>\t\1\b9\t\14\2>\t\2\b=\b\15\a=\a\\\6>\6\4\0059\5D\0045\6_\0005\a^\0003\b]\0=\b\f\a=\a`\6>\6\5\0059\5D\0045\6b\0005\aa\0009\bE\3=\b\24\a4\b\3\0009\tG\2>\t\1\b9\t\14\2>\t\2\b=\b\15\a=\ac\6>\6\6\0059\5D\0045\6f\0005\ad\0009\bE\3=\b\24\a4\b\3\0009\te\2>\t\1\b9\t\14\2>\t\2\b=\b\15\a=\ag\6>\6\a\0059\5D\0045\6i\0005\ah\0009\bE\3=\b\24\a4\b\3\0009\t/\2>\t\1\b9\t\14\2>\t\2\b=\b\15\a=\aj\6>\6\b\0059\5D\0045\6m\0005\al\0003\bk\0=\b\f\a4\b\3\0009\t\r\2>\t\1\b9\t\14\2>\t\2\b=\b\15\a=\an\6>\6\t\0059\5o\0045\6s\0005\aq\0005\bp\0009\t\r\2>\t\1\b9\t\14\2>\t\2\b=\b\15\a5\br\0009\t\14\2>\t\2\b=\b'\a=\at\6>\6\1\0059\5o\0045\6w\0005\au\0009\b\22\3=\b\24\a5\bv\0009\t\25\2>\t\1\b9\t\14\2>\t\2\b=\b\15\a=\ax\6>\6\2\0059\5y\0045\6{\0005\az\0004\b\3\0009\t\25\2>\t\1\b9\t\14\2>\t\2\b=\b\15\a=\a|\6>\6\1\0052\0\0ÄK\0\1\0K\0\1\0\15BufferIcon\1\0\0\1\0\1\rprovider\15BufferIcon\21short_line_right\14SFileName\1\0\0\1\4\0\0\0\0\tbold\1\0\1\rprovider\14SFileName\15BufferType\1\0\0\1\2\0\0\tNONE\1\0\2\rprovider\17FileTypeName\14separator\6 \1\4\0\0\0\0\tbold\20short_line_left\16RainbowBlue\1\0\0\1\0\0\0\15DiffRemove\1\0\0\1\0\2\rprovider\15DiffRemove\ticon\n ÔÖÜ \17DiffModified\1\0\0\vorange\1\0\2\rprovider\17DiffModified\ticon\t Ôßâ\fDiffAdd\1\0\0\1\0\2\rprovider\fDiffAdd\ticon\n ÔÉæ \14Separator\1\0\0\1\0\0\0\14GitBranch\1\0\0\1\4\0\0\0\0\tbold\1\0\1\rprovider\14GitBranch\fGitIcon\1\0\0\1\2\0\0\tNONE\1\4\0\0\0\0\tbold\vviolet\24check_git_workspace\1\0\1\14separator\6 \0\15FileFormat\1\0\0\1\2\0\0\tNONE\1\4\0\0\0\0\tbold\1\0\2\rprovider\15FileFormat\14separator\6 \15FileEncode\1\0\0\1\2\0\0\tNONE\1\4\0\0\0\0\tbold\ngreen\1\0\2\rprovider\15FileEncode\14separator\6 \18hide_in_width\nright\18ShowLspClient\1\0\0\1\4\0\0\0\0\tbold\1\0\2\rprovider\17GetLspClient\ticon\rÔÇÖ LSP:\0\bmid\19DiagnosticInfo\1\0\0\1\0\2\rprovider\19DiagnosticInfo\ticon\n ÔÅö \19DiagnosticHint\1\0\0\1\0\2\rprovider\19DiagnosticHint\ticon\n ÔÅ™ \tcyan\19DiagnosticWarn\1\0\0\1\0\2\rprovider\19DiagnosticWarn\ticon\n ÔÅ± \vyellow\20DiagnosticError\1\0\0\1\0\2\rprovider\20DiagnosticError\ticon\n ÔÅó \bred\fPerCent\1\0\0\1\2\0\0\tNONE\1\0\2\rprovider\16LinePercent\14separator\6 \1\4\0\0\0\0\tbold\rLineInfo\1\0\0\24separator_highlight\1\2\0\0\tNONE\1\0\2\rprovider\15LineColumn\14separator\6 \rFileName\1\0\0\1\4\0\0\0\0\tbold\1\0\1\rprovider\rFileName\rFileIcon\1\0\0\24get_file_icon_color!galaxyline.provider_fileinfo\1\0\1\rprovider\rFileIcon\rFileSize\1\0\0\afg\14condition\1\0\1\rprovider\rFileSize\21buffer_not_empty\vViMode\1\0\0\1\0\0\0\15RainbowRed\1\0\0\14highlight\abg\tblue\rprovider\1\0\0\0\tleft\1\5\0\0\rNvimTree\nvista\tdbui\vpacker\20short_line_list\fsection\25galaxyline.condition\fdefault\21galaxyline.theme\15galaxyline\frequire\npcall\0" },
    loaded = true,
    path = "/Users/andrew/.local/share/nvim/site/pack/packer/start/galaxyline.nvim",
    url = "https://github.com/glepnir/galaxyline.nvim"
  },
  ["git-messenger.vim"] = {
    loaded = true,
    path = "/Users/andrew/.local/share/nvim/site/pack/packer/start/git-messenger.vim",
    url = "https://github.com/rhysd/git-messenger.vim"
  },
  ["markdown-preview.nvim"] = {
    config = { "\27LJ\2\n4\0\0\2\0\3\0\0056\0\0\0009\0\1\0009\0\2\0B\0\1\1K\0\1\0\22mkdp#util#install\afn\bvim\0" },
    loaded = true,
    path = "/Users/andrew/.local/share/nvim/site/pack/packer/start/markdown-preview.nvim",
    url = "https://github.com/iamcco/markdown-preview.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/Users/andrew/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    loaded = true,
    path = "/Users/andrew/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\2\nA\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\2\0\0\6*\nsetup\14colorizer\frequire\0" },
    loaded = true,
    path = "/Users/andrew/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua",
    url = "https://github.com/norcalli/nvim-colorizer.lua"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\n∑\2\0\0\n\0\24\0\0296\0\0\0'\2\1\0B\0\2\0029\0\2\0009\0\3\0005\2\22\0005\3\20\0005\4\5\0005\5\4\0=\5\6\0045\5\b\0005\6\a\0=\6\t\5=\5\n\0045\5\15\0006\6\v\0009\6\f\0069\6\r\6'\b\14\0+\t\2\0B\6\3\2=\6\16\5=\5\17\0045\5\18\0=\5\19\4=\4\21\3=\3\23\2B\0\2\1K\0\1\0\rsettings\1\0\0\bLua\1\0\0\14telemetry\1\0\1\venable\1\14workspace\flibrary\1\0\0\5\26nvim_get_runtime_file\bapi\bvim\16diagnostics\fglobals\1\0\0\1\2\0\0\bvim\fruntime\1\0\0\1\0\1\fversion\vLuaJIT\nsetup\16sumneko_lua\14lspconfig\frequire\0" },
    loaded = true,
    path = "/Users/andrew/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-surround"] = {
    config = { "\27LJ\2\n?\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\18nvim-surround\frequire\0" },
    loaded = true,
    path = "/Users/andrew/.local/share/nvim/site/pack/packer/start/nvim-surround",
    url = "https://github.com/kylechui/nvim-surround"
  },
  ["nvim-tree.lua"] = {
    commands = { "NvimTreeToggle" },
    config = { "\27LJ\2\nº\1\0\0\a\0\n\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0005\4\6\0004\5\3\0005\6\5\0>\6\1\5=\5\a\4=\4\b\3=\3\t\2B\0\2\1K\0\1\0\tview\rmappings\tlist\1\0\0\1\0\2\bkey\6_\vaction\acd\1\0\1\18adaptive_size\2\1\0\2\18hijack_cursor\2\23sync_root_with_cwd\2\nsetup\14nvim-tree\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/andrew/.local/share/nvim/site/pack/packer/opt/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    after = { "nvim-treesitter-textobjects" },
    config = { "\27LJ\2\nø\3\0\0\6\0\21\0\0296\0\0\0009\0\1\0009\0\2\0'\2\3\0B\0\2\0016\0\0\0009\0\1\0009\0\2\0'\2\4\0B\0\2\0016\0\5\0'\2\6\0B\0\2\0029\0\a\0005\2\b\0005\3\t\0=\3\n\0025\3\v\0=\3\f\0025\3\r\0=\3\14\0025\3\18\0005\4\15\0005\5\16\0=\5\17\4=\4\19\3=\3\20\2B\0\2\1K\0\1\0\16textobjects\vselect\1\0\0\fkeymaps\1\0\4\aac\17@class.outer\aic\17@class.inner\aif\20@function.inner\aaf\20@function.outer\1\0\1\venable\2\14compilers\1\2\0\0\nclang\14highlight\1\0\1\venable\2\19ignore_install\1\2\0\0\vphpdoc\1\0\1\21ensure_installed\ball\nsetup\28nvim-treesitter.configs\frequire,set foldexpr=nvim_treesitter#foldexpr()\24set foldmethod=expr\17nvim_command\bapi\bvim\0" },
    load_after = {},
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/andrew/.local/share/nvim/site/pack/packer/opt/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-textobjects"] = {
    load_after = {
      ["nvim-treesitter"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/andrew/.local/share/nvim/site/pack/packer/opt/nvim-treesitter-textobjects",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/andrew/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/andrew/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/andrew/.local/share/nvim/site/pack/packer/opt/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/andrew/.local/share/nvim/site/pack/packer/opt/popup.nvim",
    url = "https://github.com/nvim-lua/popup.nvim"
  },
  ["sessions.nvim"] = {
    config = { "\27LJ\2\np\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\2\21session_filepath\28~/.config/nvim/.session\rabsolute\2\nsetup\rsessions\frequire\0" },
    loaded = true,
    path = "/Users/andrew/.local/share/nvim/site/pack/packer/start/sessions.nvim",
    url = "https://github.com/natecraddock/sessions.nvim"
  },
  ["telescope-file-browser.nvim"] = {
    loaded = true,
    path = "/Users/andrew/.local/share/nvim/site/pack/packer/start/telescope-file-browser.nvim",
    url = "https://github.com/nvim-telescope/telescope-file-browser.nvim"
  },
  ["telescope-fzy-native.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/andrew/.local/share/nvim/site/pack/packer/opt/telescope-fzy-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzy-native.nvim"
  },
  ["telescope.nvim"] = {
    after = { "nvim-treesitter" },
    config = { "\27LJ\2\nÃ\a\0\0\n\0000\0T6\0\0\0009\0\1\0009\0\2\0\14\0\0\0X\0\16Ä6\0\3\0009\0\4\0'\2\5\0B\0\2\0016\0\3\0009\0\4\0'\2\6\0B\0\2\0016\0\3\0009\0\4\0'\2\a\0B\0\2\0016\0\3\0009\0\4\0'\2\b\0B\0\2\0016\0\t\0'\2\n\0B\0\2\0029\0\v\0005\2\27\0005\3\17\0005\4\r\0005\5\f\0=\5\14\0045\5\15\0=\5\16\4=\4\18\0036\4\t\0'\6\19\0B\4\2\0029\4\20\0049\4\21\4=\4\22\0036\4\t\0'\6\19\0B\4\2\0029\4\23\0049\4\21\4=\4\24\0036\4\t\0'\6\19\0B\4\2\0029\4\25\0049\4\21\4=\4\26\3=\3\28\0025\3\30\0005\4\29\0=\4\31\3=\3 \0025\3,\0005\4*\0005\5%\0005\6#\0006\a\t\0'\t!\0B\a\2\0029\a\"\a=\a$\6=\6&\0055\6'\0006\a\t\0'\t!\0B\a\2\0029\a\"\a=\a(\6=\6)\5=\5+\4=\4-\3=\3.\2B\0\2\0016\0\t\0'\2\n\0B\0\2\0029\0/\0'\2\31\0B\0\2\1K\0\1\0\19load_extension\fpickers\fbuffers\1\0\0\rmappings\1\0\0\6n\6d\1\0\0\6i\1\0\0\n<C-d>\1\0\0\18delete_buffer\22telescope.actions\15extensions\15fzy_native\1\0\0\1\0\2\28override_generic_sorter\1\25override_file_sorter\2\rdefaults\1\0\0\21qflist_previewer\22vim_buffer_qflist\19grep_previewer\23vim_buffer_vimgrep\19file_previewer\bnew\19vim_buffer_cat\25telescope.previewers\18layout_config\1\0\2\21sorting_strategy\14ascending\17initial_mode\vnormal\rvertical\1\0\1\vmirror\1\15horizontal\1\0\0\1\0\2\20prompt_position\btop\18results_width\4\0ÄÄÄˇ\3\nsetup\14telescope\frequire(packadd telescope-file-browser.nvim&packadd telescope-fzy-native.nvim\23packadd popup.nvim\25packadd plenary.nvim\bcmd\bvim\vloaded\17plenary.nvim\19packer_plugins\0" },
    loaded = true,
    only_config = true,
    path = "/Users/andrew/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["tokyonight.nvim"] = {
    config = { "\27LJ\2\n:\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\27colorscheme tokyonight\bcmd\bvim\0" },
    loaded = true,
    path = "/Users/andrew/.local/share/nvim/site/pack/packer/start/tokyonight.nvim",
    url = "https://github.com/folke/tokyonight.nvim"
  },
  ["trouble.nvim"] = {
    config = { "\27LJ\2\nb\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\2\tmode\25document_diagnostics\15auto_close\2\nsetup\ftrouble\frequire\0" },
    loaded = true,
    path = "/Users/andrew/.local/share/nvim/site/pack/packer/start/trouble.nvim",
    url = "https://github.com/folke/trouble.nvim"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/Users/andrew/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: sessions.nvim
time([[Config for sessions.nvim]], true)
try_loadstring("\27LJ\2\np\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\2\21session_filepath\28~/.config/nvim/.session\rabsolute\2\nsetup\rsessions\frequire\0", "config", "sessions.nvim")
time([[Config for sessions.nvim]], false)
-- Config for: nvim-surround
time([[Config for nvim-surround]], true)
try_loadstring("\27LJ\2\n?\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\18nvim-surround\frequire\0", "config", "nvim-surround")
time([[Config for nvim-surround]], false)
-- Config for: markdown-preview.nvim
time([[Config for markdown-preview.nvim]], true)
try_loadstring("\27LJ\2\n4\0\0\2\0\3\0\0056\0\0\0009\0\1\0009\0\2\0B\0\1\1K\0\1\0\22mkdp#util#install\afn\bvim\0", "config", "markdown-preview.nvim")
time([[Config for markdown-preview.nvim]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\n∑\2\0\0\n\0\24\0\0296\0\0\0'\2\1\0B\0\2\0029\0\2\0009\0\3\0005\2\22\0005\3\20\0005\4\5\0005\5\4\0=\5\6\0045\5\b\0005\6\a\0=\6\t\5=\5\n\0045\5\15\0006\6\v\0009\6\f\0069\6\r\6'\b\14\0+\t\2\0B\6\3\2=\6\16\5=\5\17\0045\5\18\0=\5\19\4=\4\21\3=\3\23\2B\0\2\1K\0\1\0\rsettings\1\0\0\bLua\1\0\0\14telemetry\1\0\1\venable\1\14workspace\flibrary\1\0\0\5\26nvim_get_runtime_file\bapi\bvim\16diagnostics\fglobals\1\0\0\1\2\0\0\bvim\fruntime\1\0\0\1\0\1\fversion\vLuaJIT\nsetup\16sumneko_lua\14lspconfig\frequire\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\nÃ\a\0\0\n\0000\0T6\0\0\0009\0\1\0009\0\2\0\14\0\0\0X\0\16Ä6\0\3\0009\0\4\0'\2\5\0B\0\2\0016\0\3\0009\0\4\0'\2\6\0B\0\2\0016\0\3\0009\0\4\0'\2\a\0B\0\2\0016\0\3\0009\0\4\0'\2\b\0B\0\2\0016\0\t\0'\2\n\0B\0\2\0029\0\v\0005\2\27\0005\3\17\0005\4\r\0005\5\f\0=\5\14\0045\5\15\0=\5\16\4=\4\18\0036\4\t\0'\6\19\0B\4\2\0029\4\20\0049\4\21\4=\4\22\0036\4\t\0'\6\19\0B\4\2\0029\4\23\0049\4\21\4=\4\24\0036\4\t\0'\6\19\0B\4\2\0029\4\25\0049\4\21\4=\4\26\3=\3\28\0025\3\30\0005\4\29\0=\4\31\3=\3 \0025\3,\0005\4*\0005\5%\0005\6#\0006\a\t\0'\t!\0B\a\2\0029\a\"\a=\a$\6=\6&\0055\6'\0006\a\t\0'\t!\0B\a\2\0029\a\"\a=\a(\6=\6)\5=\5+\4=\4-\3=\3.\2B\0\2\0016\0\t\0'\2\n\0B\0\2\0029\0/\0'\2\31\0B\0\2\1K\0\1\0\19load_extension\fpickers\fbuffers\1\0\0\rmappings\1\0\0\6n\6d\1\0\0\6i\1\0\0\n<C-d>\1\0\0\18delete_buffer\22telescope.actions\15extensions\15fzy_native\1\0\0\1\0\2\28override_generic_sorter\1\25override_file_sorter\2\rdefaults\1\0\0\21qflist_previewer\22vim_buffer_qflist\19grep_previewer\23vim_buffer_vimgrep\19file_previewer\bnew\19vim_buffer_cat\25telescope.previewers\18layout_config\1\0\2\21sorting_strategy\14ascending\17initial_mode\vnormal\rvertical\1\0\1\vmirror\1\15horizontal\1\0\0\1\0\2\20prompt_position\btop\18results_width\4\0ÄÄÄˇ\3\nsetup\14telescope\frequire(packadd telescope-file-browser.nvim&packadd telescope-fzy-native.nvim\23packadd popup.nvim\25packadd plenary.nvim\bcmd\bvim\vloaded\17plenary.nvim\19packer_plugins\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: nvim-colorizer.lua
time([[Config for nvim-colorizer.lua]], true)
try_loadstring("\27LJ\2\nA\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\2\0\0\6*\nsetup\14colorizer\frequire\0", "config", "nvim-colorizer.lua")
time([[Config for nvim-colorizer.lua]], false)
-- Config for: trouble.nvim
time([[Config for trouble.nvim]], true)
try_loadstring("\27LJ\2\nb\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\2\tmode\25document_diagnostics\15auto_close\2\nsetup\ftrouble\frequire\0", "config", "trouble.nvim")
time([[Config for trouble.nvim]], false)
-- Config for: cabline.nvim
time([[Config for cabline.nvim]], true)
try_loadstring("\27LJ\2\n9\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\fcabline\frequire\0", "config", "cabline.nvim")
time([[Config for cabline.nvim]], false)
-- Config for: galaxyline.nvim
time([[Config for galaxyline.nvim]], true)
try_loadstring("\27LJ\2\n\20\0\0\1\0\1\0\2'\0\0\0L\0\2\0\t‚ñä Â\3\0\0\a\1&\0M5\0\1\0-\1\0\0009\1\0\1=\1\2\0-\1\0\0009\1\3\1=\1\4\0-\1\0\0009\1\5\1=\1\6\0-\1\0\0009\1\a\1=\1\b\0-\1\0\0009\1\t\1=\1\n\0-\1\0\0009\1\0\1=\1\v\0-\1\0\0009\1\0\1=\1\f\0-\1\0\0009\1\r\1=\1\14\0-\1\0\0009\1\15\1=\1\16\0-\1\0\0009\1\0\1=\1\17\0-\1\0\0009\1\0\1=\1\18\0-\1\0\0009\1\a\1=\1\19\0-\1\0\0009\1\20\1=\1\21\0-\1\0\0009\1\a\1=\1\22\0-\1\0\0009\1\20\1=\1\23\0-\1\0\0009\1\5\1=\1\24\0-\1\0\0009\1\5\1=\1\25\0-\1\0\0009\1\0\1=\1\26\0-\1\0\0009\1\3\1=\1\27\0-\1\0\0009\1\3\1=\1\28\0006\1\29\0009\1\30\0019\1\31\1'\3 \0006\4\29\0009\4!\0049\4\"\4B\4\1\0028\4\4\0'\5#\0-\6\0\0009\6$\6&\3\6\3B\1\2\1'\1%\0L\1\2\0\2¿\nÔåå  \abg\f guibg=\tmode\afn\27hi GalaxyViMode guifg=\17nvim_command\bapi\bvim\6V\6v\6t\6S\6s\aRv\arm\6R\vviolet\6r\ano\6n\aic\vyellow\6i\ngreen\acv\ace\6c\fmagenta\ar?\tcyan\6\19\vorange\6\22\tblue\6!\1\0\0\bredS\0\0\2\0\4\0\v5\0\0\0006\1\1\0009\1\2\0019\1\3\0018\1\1\0\15\0\1\0X\2\2Ä+\1\1\0L\1\2\0+\1\2\0L\1\2\0\rfiletype\abo\bvim\1\0\2\5\2\14dashboard\2\21\0\0\1\0\1\0\2'\0\0\0L\0\2\0\n Ôëø \17\0\0\1\0\1\0\2'\0\0\0L\0\2\0\6 \20\0\0\1\0\1\0\2'\0\0\0L\0\2\0\t ‚ñäè\22\1\0\f\0}\0Õ\0026\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1Ä2\0EÅ6\2\1\0'\4\3\0B\2\2\0029\2\4\0026\3\1\0'\5\5\0B\3\2\0029\4\6\0015\5\b\0=\5\a\0019\5\t\0045\6\16\0005\a\v\0003\b\n\0=\b\f\a4\b\3\0009\t\r\2>\t\1\b9\t\14\2>\t\2\b=\b\15\a=\a\17\6>\6\1\0059\5\t\0045\6\20\0005\a\19\0003\b\18\0=\b\f\a=\a\21\6>\6\2\0059\5\t\0045\6\26\0005\a\23\0009\b\22\3=\b\24\a4\b\3\0009\t\25\2>\t\1\b9\t\14\2>\t\2\b=\b\15\a=\a\27\6>\6\3\0059\5\t\0045\6\31\0005\a\28\0009\b\22\3=\b\24\a4\b\3\0006\t\1\0'\v\29\0B\t\2\0029\t\30\t>\t\1\b9\t\14\2>\t\2\b=\b\15\a=\a \6>\6\4\0059\5\t\0045\6#\0005\a!\0009\b\22\3=\b\24\a5\b\"\0009\t\25\2>\t\1\b9\t\14\2>\t\2\b=\b\15\a=\a$\6>\6\5\0059\5\t\0045\6(\0005\a%\0004\b\3\0009\t\25\2>\t\1\b9\t\14\2>\t\2\b=\b\15\a5\b&\0009\t\14\2>\t\2\b=\b'\a=\a)\6>\6\6\0059\5\t\0045\6-\0005\a+\0005\b*\0009\t\25\2>\t\1\b9\t\14\2>\t\2\b=\b\15\a5\b,\0009\t\14\2>\t\2\b=\b'\a=\a.\6>\6\a\0059\5\t\0045\0061\0005\a0\0004\b\3\0009\t/\2>\t\1\b9\t\14\2>\t\2\b=\b\15\a=\a2\6>\6\b\0059\5\t\0045\0065\0005\a4\0004\b\3\0009\t3\2>\t\1\b9\t\14\2>\t\2\b=\b\15\a=\a6\6>\6\t\0059\5\t\0045\0069\0005\a8\0004\b\3\0009\t7\2>\t\1\b9\t\14\2>\t\2\b=\b\15\a=\a:\6>\6\n\0059\5\t\0045\6<\0005\a;\0004\b\3\0009\t\r\2>\t\1\b9\t\14\2>\t\2\b=\b\15\a=\a=\6>\6\v\0059\5>\0045\6B\0005\a@\0003\b?\0=\b\24\a5\bA\0009\t3\2>\t\1\b9\t\14\2>\t\2\b=\b\15\a=\aC\6>\6\1\0059\5D\0045\6J\0005\aF\0009\bE\3=\b\24\a5\bH\0009\tG\2>\t\1\b9\t\14\2>\t\2\b=\b\15\a5\bI\0009\t\14\2>\t\2\b=\b'\a=\aK\6>\6\1\0059\5D\0045\6O\0005\aL\0009\bE\3=\b\24\a5\bM\0009\tG\2>\t\1\b9\t\14\2>\t\2\b=\b\15\a5\bN\0009\t\14\2>\t\2\b=\b'\a=\aP\6>\6\2\0059\5D\0045\6W\0005\aR\0003\bQ\0=\b\f\a9\bS\3=\b\24\a5\bU\0009\tT\2>\t\1\b9\t\14\2>\t\2\b=\b\15\a5\bV\0009\t\14\2>\t\2\b=\b'\a=\aX\6>\6\3\0059\5D\0045\6[\0005\aY\0009\bS\3=\b\24\a5\bZ\0009\tT\2>\t\1\b9\t\14\2>\t\2\b=\b\15\a=\a\\\6>\6\4\0059\5D\0045\6_\0005\a^\0003\b]\0=\b\f\a=\a`\6>\6\5\0059\5D\0045\6b\0005\aa\0009\bE\3=\b\24\a4\b\3\0009\tG\2>\t\1\b9\t\14\2>\t\2\b=\b\15\a=\ac\6>\6\6\0059\5D\0045\6f\0005\ad\0009\bE\3=\b\24\a4\b\3\0009\te\2>\t\1\b9\t\14\2>\t\2\b=\b\15\a=\ag\6>\6\a\0059\5D\0045\6i\0005\ah\0009\bE\3=\b\24\a4\b\3\0009\t/\2>\t\1\b9\t\14\2>\t\2\b=\b\15\a=\aj\6>\6\b\0059\5D\0045\6m\0005\al\0003\bk\0=\b\f\a4\b\3\0009\t\r\2>\t\1\b9\t\14\2>\t\2\b=\b\15\a=\an\6>\6\t\0059\5o\0045\6s\0005\aq\0005\bp\0009\t\r\2>\t\1\b9\t\14\2>\t\2\b=\b\15\a5\br\0009\t\14\2>\t\2\b=\b'\a=\at\6>\6\1\0059\5o\0045\6w\0005\au\0009\b\22\3=\b\24\a5\bv\0009\t\25\2>\t\1\b9\t\14\2>\t\2\b=\b\15\a=\ax\6>\6\2\0059\5y\0045\6{\0005\az\0004\b\3\0009\t\25\2>\t\1\b9\t\14\2>\t\2\b=\b\15\a=\a|\6>\6\1\0052\0\0ÄK\0\1\0K\0\1\0\15BufferIcon\1\0\0\1\0\1\rprovider\15BufferIcon\21short_line_right\14SFileName\1\0\0\1\4\0\0\0\0\tbold\1\0\1\rprovider\14SFileName\15BufferType\1\0\0\1\2\0\0\tNONE\1\0\2\rprovider\17FileTypeName\14separator\6 \1\4\0\0\0\0\tbold\20short_line_left\16RainbowBlue\1\0\0\1\0\0\0\15DiffRemove\1\0\0\1\0\2\rprovider\15DiffRemove\ticon\n ÔÖÜ \17DiffModified\1\0\0\vorange\1\0\2\rprovider\17DiffModified\ticon\t Ôßâ\fDiffAdd\1\0\0\1\0\2\rprovider\fDiffAdd\ticon\n ÔÉæ \14Separator\1\0\0\1\0\0\0\14GitBranch\1\0\0\1\4\0\0\0\0\tbold\1\0\1\rprovider\14GitBranch\fGitIcon\1\0\0\1\2\0\0\tNONE\1\4\0\0\0\0\tbold\vviolet\24check_git_workspace\1\0\1\14separator\6 \0\15FileFormat\1\0\0\1\2\0\0\tNONE\1\4\0\0\0\0\tbold\1\0\2\rprovider\15FileFormat\14separator\6 \15FileEncode\1\0\0\1\2\0\0\tNONE\1\4\0\0\0\0\tbold\ngreen\1\0\2\rprovider\15FileEncode\14separator\6 \18hide_in_width\nright\18ShowLspClient\1\0\0\1\4\0\0\0\0\tbold\1\0\2\rprovider\17GetLspClient\ticon\rÔÇÖ LSP:\0\bmid\19DiagnosticInfo\1\0\0\1\0\2\rprovider\19DiagnosticInfo\ticon\n ÔÅö \19DiagnosticHint\1\0\0\1\0\2\rprovider\19DiagnosticHint\ticon\n ÔÅ™ \tcyan\19DiagnosticWarn\1\0\0\1\0\2\rprovider\19DiagnosticWarn\ticon\n ÔÅ± \vyellow\20DiagnosticError\1\0\0\1\0\2\rprovider\20DiagnosticError\ticon\n ÔÅó \bred\fPerCent\1\0\0\1\2\0\0\tNONE\1\0\2\rprovider\16LinePercent\14separator\6 \1\4\0\0\0\0\tbold\rLineInfo\1\0\0\24separator_highlight\1\2\0\0\tNONE\1\0\2\rprovider\15LineColumn\14separator\6 \rFileName\1\0\0\1\4\0\0\0\0\tbold\1\0\1\rprovider\rFileName\rFileIcon\1\0\0\24get_file_icon_color!galaxyline.provider_fileinfo\1\0\1\rprovider\rFileIcon\rFileSize\1\0\0\afg\14condition\1\0\1\rprovider\rFileSize\21buffer_not_empty\vViMode\1\0\0\1\0\0\0\15RainbowRed\1\0\0\14highlight\abg\tblue\rprovider\1\0\0\0\tleft\1\5\0\0\rNvimTree\nvista\tdbui\vpacker\20short_line_list\fsection\25galaxyline.condition\fdefault\21galaxyline.theme\15galaxyline\frequire\npcall\0", "config", "galaxyline.nvim")
time([[Config for galaxyline.nvim]], false)
-- Config for: tokyonight.nvim
time([[Config for tokyonight.nvim]], true)
try_loadstring("\27LJ\2\n:\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\27colorscheme tokyonight\bcmd\bvim\0", "config", "tokyonight.nvim")
time([[Config for tokyonight.nvim]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.api.nvim_create_user_command, 'Colortils', function(cmdargs)
          require('packer.load')({'colortils.nvim'}, { cmd = 'Colortils', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'colortils.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Colortils ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'NvimTreeToggle', function(cmdargs)
          require('packer.load')({'nvim-tree.lua'}, { cmd = 'NvimTreeToggle', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'nvim-tree.lua'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('NvimTreeToggle ', 'cmdline')
      end})
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au BufRead * ++once lua require("packer.load")({'nvim-treesitter'}, { event = "BufRead *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
