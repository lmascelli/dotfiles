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
local should_profile = true
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
local package_path_str = "C:\\Users\\leonardo\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\share\\lua\\5.1\\?.lua;C:\\Users\\leonardo\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\share\\lua\\5.1\\?\\init.lua;C:\\Users\\leonardo\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\lib\\luarocks\\rocks-5.1\\?.lua;C:\\Users\\leonardo\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\lib\\luarocks\\rocks-5.1\\?\\init.lua"
local install_cpath_pattern = "C:\\Users\\leonardo\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\lib\\lua\\5.1\\?.so"
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
  ["Comment.nvim"] = {
    config = { "\27LJ\2\nK\0\0\5\0\4\0\n6\0\0\0006\2\1\0'\3\2\0B\0\3\3\15\0\0\0X\2\3�9\2\3\0014\4\0\0B\2\2\1K\0\1\0\nsetup\fComment\frequire\npcall\0" },
    keys = { { "", "gcc" }, { "", "gcb" }, { "v", "gc" }, { "v", "gb" }, { "x", "gc" }, { "x", "gb" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "C:\\Users\\leonardo\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  LuaSnip = {
    loaded = false,
    needs_bufread = true,
    path = "C:\\Users\\leonardo\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["bufferline.nvim"] = {
    loaded = true,
    path = "C:\\Users\\leonardo\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\bufferline.nvim",
    url = "https://github.com/akinsho/bufferline.nvim"
  },
  ["cmp-buffer"] = {
    after_files = { "C:\\Users\\leonardo\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\cmp-buffer\\after\\plugin\\cmp_buffer.lua" },
    loaded = false,
    needs_bufread = false,
    path = "C:\\Users\\leonardo\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    after_files = { "C:\\Users\\leonardo\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\cmp-cmdline\\after\\plugin\\cmp_cmdline.lua" },
    loaded = false,
    needs_bufread = false,
    path = "C:\\Users\\leonardo\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-nvim-lsp"] = {
    after_files = { "C:\\Users\\leonardo\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\cmp-nvim-lsp\\after\\plugin\\cmp_nvim_lsp.lua" },
    loaded = false,
    needs_bufread = false,
    path = "C:\\Users\\leonardo\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lsp-document-symbol"] = {
    after_files = { "C:\\Users\\leonardo\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\cmp-nvim-lsp-document-symbol\\after\\plugin\\cmp_nvim_lsp_document_symbol.lua" },
    loaded = false,
    needs_bufread = false,
    path = "C:\\Users\\leonardo\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\cmp-nvim-lsp-document-symbol",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp-document-symbol"
  },
  ["cmp-path"] = {
    after_files = { "C:\\Users\\leonardo\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\cmp-path\\after\\plugin\\cmp_path.lua" },
    loaded = false,
    needs_bufread = false,
    path = "C:\\Users\\leonardo\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  cmp_luasnip = {
    after_files = { "C:\\Users\\leonardo\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\cmp_luasnip\\after\\plugin\\cmp_luasnip.lua" },
    loaded = false,
    needs_bufread = false,
    path = "C:\\Users\\leonardo\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["friendly-snippets"] = {
    loaded = false,
    needs_bufread = false,
    path = "C:\\Users\\leonardo\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  ["impatient.nvim"] = {
    loaded = true,
    path = "C:\\Users\\leonardo\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\impatient.nvim",
    url = "https://github.com/lewis6991/impatient.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "C:\\Users\\leonardo\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    loaded = true,
    path = "C:\\Users\\leonardo\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\n@\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "C:\\Users\\leonardo\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    loaded = false,
    needs_bufread = false,
    path = "C:\\Users\\leonardo\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "C:\\Users\\leonardo\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-tree.lua"] = {
    commands = { "NvimTreeToggle" },
    config = { "\27LJ\2\n�\1\0\0\a\0\v\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\t\0005\3\a\0005\4\5\0004\5\3\0005\6\3\0>\6\1\0055\6\4\0>\6\2\5=\5\6\4=\4\b\3=\3\n\2B\0\2\1K\0\1\0\tview\1\0\0\rmappings\1\0\0\tlist\1\0\0\1\0\2\vaction\tcopy\bkey\acc\1\0\2\vaction\acd\bkey\acd\nsetup\14nvim-tree\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "C:\\Users\\leonardo\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n�\3\0\0\a\0\14\0\0226\0\0\0006\2\1\0'\3\2\0B\0\3\3\15\0\0\0X\2\15�9\2\3\0015\4\5\0005\5\4\0=\5\6\0044\5\0\0=\5\a\0045\5\b\0004\6\0\0=\6\t\5=\5\n\4B\2\2\0016\2\v\0009\2\f\2'\4\r\0B\2\2\1K\0\1\0Y        set foldmethod=expr\n        set foldexpr=nvim_treesitter#foldexpr()\n        \bcmd\bvim\14highlight\fdisable\1\0\2&additional_vim_regex_highlighting\1\venable\2\19ignore_install\21ensure_installed\1\0\2\17auto_install\2\17sync_install\1\1\6\0\0\bcpp\blua\bvim\thelp\vpython\nsetup\28nvim-treesitter.configs\frequire\npcall\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "C:\\Users\\leonardo\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "C:\\Users\\leonardo\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-web-devicons",
    url = "https://github.com/nvim-tree/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "C:\\Users\\leonardo\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "C:\\Users\\leonardo\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["telescope-symbols.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "C:\\Users\\leonardo\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\telescope-symbols.nvim",
    url = "https://github.com/nvim-telescope/telescope-symbols.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\nM\0\0\5\0\4\0\n6\0\0\0006\2\1\0'\3\2\0B\0\3\3\15\0\0\0X\2\3�9\2\3\0014\4\0\0B\2\2\1K\0\1\0\nsetup\14telescope\frequire\npcall\0" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "C:\\Users\\leonardo\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["toggleterm.nvim"] = {
    commands = { "ToggleTerm" },
    config = { "\27LJ\2\n�\1\0\0\a\0\t\0\14'\0\0\0006\1\1\0006\3\2\0'\4\3\0B\1\3\3\15\0\1\0X\3\6�9\3\4\0025\5\6\0005\6\5\0=\6\a\5=\0\b\5B\3\2\1K\0\1\0\nshell\15float_opts\1\0\1\14direction\nfloat\1\0\1\vborder\vcurved\nsetup\15toggleterm\frequire\npcall\tpwsh\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "C:\\Users\\leonardo\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\toggleterm.nvim",
    url = "https://github.com/akinsho/toggleterm.nvim"
  },
  ["which-key.nvim"] = {
    loaded = true,
    path = "C:\\Users\\leonardo\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.api.nvim_create_user_command, 'ToggleTerm', function(cmdargs)
          require('packer.load')({'toggleterm.nvim'}, { cmd = 'ToggleTerm', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'toggleterm.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('ToggleTerm ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'NvimTreeToggle', function(cmdargs)
          require('packer.load')({'nvim-tree.lua'}, { cmd = 'NvimTreeToggle', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'nvim-tree.lua'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('NvimTreeToggle ', 'cmdline')
      end})
time([[Defining lazy-load commands]], false)

-- Keymap lazy-loads
time([[Defining lazy-load keymaps]], true)
vim.cmd [[xnoremap <silent> gb <cmd>lua require("packer.load")({'Comment.nvim'}, { keys = "gb", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> gcb <cmd>lua require("packer.load")({'Comment.nvim'}, { keys = "gcb", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> gcc <cmd>lua require("packer.load")({'Comment.nvim'}, { keys = "gcc", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> gc <cmd>lua require("packer.load")({'Comment.nvim'}, { keys = "gc", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[vnoremap <silent> gc <cmd>lua require("packer.load")({'Comment.nvim'}, { keys = "gc", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[vnoremap <silent> gb <cmd>lua require("packer.load")({'Comment.nvim'}, { keys = "gb", prefix = "" }, _G.packer_plugins)<cr>]]
time([[Defining lazy-load keymaps]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType python ++once lua require("packer.load")({'nvim-treesitter'}, { ft = "python" }, _G.packer_plugins)]]
vim.cmd [[au FileType cpp ++once lua require("packer.load")({'nvim-treesitter'}, { ft = "cpp" }, _G.packer_plugins)]]
vim.cmd [[au FileType lua ++once lua require("packer.load")({'nvim-treesitter'}, { ft = "lua" }, _G.packer_plugins)]]
vim.cmd [[au FileType c ++once lua require("packer.load")({'nvim-treesitter'}, { ft = "c" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au VimEnter * ++once lua require("packer.load")({'telescope.nvim', 'nvim-autopairs'}, { event = "VimEnter *" }, _G.packer_plugins)]]
vim.cmd [[au FileReadPost * ++once lua require("packer.load")({'nvim-treesitter'}, { event = "FileReadPost *" }, _G.packer_plugins)]]
vim.cmd [[au BufNewFile * ++once lua require("packer.load")({'nvim-treesitter'}, { event = "BufNewFile *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles(1) end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
