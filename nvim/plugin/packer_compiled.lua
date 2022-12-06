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
    loaded = true,
    path = "C:\\Users\\leonardo\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  LuaSnip = {
    loaded = true,
    path = "C:\\Users\\leonardo\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["black.vim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "C:\\Users\\leonardo\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\black.vim",
    url = "https://github.com/C:/Users/leonardo/AppData/Local/nvim/lua/lm/plugins/src/black.vim"
  },
  ["bufferline.nvim"] = {
    loaded = true,
    path = "C:\\Users\\leonardo\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\bufferline.nvim",
    url = "https://github.com/akinsho/bufferline.nvim"
  },
  ["clangd_extensions.nvim"] = {
    loaded = true,
    path = "C:\\Users\\leonardo\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\clangd_extensions.nvim",
    url = "https://github.com/p00f/clangd_extensions.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "C:\\Users\\leonardo\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "C:\\Users\\leonardo\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "C:\\Users\\leonardo\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lsp-document-symbol"] = {
    loaded = true,
    path = "C:\\Users\\leonardo\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\cmp-nvim-lsp-document-symbol",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp-document-symbol"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "C:\\Users\\leonardo\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  cmp_luasnip = {
    loaded = true,
    path = "C:\\Users\\leonardo\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "C:\\Users\\leonardo\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  ["impatient.nvim"] = {
    loaded = true,
    path = "C:\\Users\\leonardo\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\impatient.nvim",
    url = "https://github.com/lewis6991/impatient.nvim"
  },
  ["lspsaga.nvim"] = {
    config = { "\27LJ\2\n®\b\0\0\6\0\28\0!6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\3\0005\4\4\0=\4\5\0035\4\6\0=\4\a\0035\4\b\0=\4\t\0035\4\n\0=\4\v\0035\4\r\0005\5\f\0=\5\14\0045\5\15\0=\5\16\4=\4\17\0035\4\18\0=\4\19\0035\4\20\0=\4\21\0035\4\22\0=\4\23\0035\4\24\0=\4\25\0034\4\0\0=\4\26\0034\4\0\0=\4\27\3B\1\2\1K\0\1\0\24server_filetype_map\16custom_kind\17show_outline\1\0\b\17auto_preview\2\15auto_enter\2\14win_width\3\30\rwin_with\5\rjump_key\6o\17win_position\nright\17auto_refresh\2\14virt_text\b‚îÉ\21symbol_in_winbar\1\0\6\19file_formatter\5\14show_file\2\venable\2\14separator\tÔëä \14in_custom\1\18click_support\1\27definition_action_keys\1\0\5\tquit\6q\ttabe\v<C-c>t\vvsplit\v<C-c>v\tedit\v<C-c>o\nsplit\v<C-c>i\21code_action_keys\1\0\2\tquit\6q\texec\t<CR>\23finder_action_keys\tquit\1\3\0\0\6q\n<ESC>\topen\1\0\3\ttabe\6t\vvsplit\6s\nsplit\6i\1\3\0\0\6o\t<CR>\17finder_icons\1\0\3\bdef\nÓàï  \bref\tÔ™æ \tlink\nÔ†∏  \26code_action_lightbulb\1\0\a\16update_time\3ñ\1\17virtual_text\2\venable\2\18sign_priority\3\20\tsign\2\22cache_code_action\2\21enable_in_insert\2\22diagnostic_header\1\5\0\0\tÔÅó \tÔÅ™ \tÔÅö \tÔ¥û \17move_in_saga\1\0\2\tprev\n<C-p>\tnext\n<C-n>\1\0\t\23rename_action_quit\n<C-c>\18saga_winblend\3\0\17border_style\vsingle\27finder_request_timeout\3‹\v\29code_action_num_shortcut\2\21code_action_icon\tüí°\22max_preview_lines\3\n\24preview_lines_above\3\0\21rename_in_select\2\18init_lsp_saga\flspsaga\frequire\0" },
    loaded = true,
    path = "C:\\Users\\leonardo\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\lspsaga.nvim",
    url = "https://github.com/glepnir/lspsaga.nvim"
  },
  ["lualine.nvim"] = {
    loaded = true,
    path = "C:\\Users\\leonardo\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
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
    loaded = true,
    path = "C:\\Users\\leonardo\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "C:\\Users\\leonardo\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "C:\\Users\\leonardo\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-tree.lua"] = {
    commands = { "NvimTreeToggle" },
    config = { "\27LJ\2\n©\1\0\0\a\0\v\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\t\0005\3\a\0005\4\5\0004\5\3\0005\6\3\0>\6\1\0055\6\4\0>\6\2\5=\5\6\4=\4\b\3=\3\n\2B\0\2\1K\0\1\0\tview\1\0\0\rmappings\1\0\0\tlist\1\0\0\1\0\2\vaction\tcopy\bkey\acc\1\0\2\vaction\acd\bkey\acd\nsetup\14nvim-tree\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "C:\\Users\\leonardo\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n÷\2\0\0\4\0\r\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\2B\0\2\0016\0\n\0009\0\v\0'\2\f\0B\0\2\1K\0\1\0Y        set foldmethod=expr\n        set foldexpr=nvim_treesitter#foldexpr()\n        \bcmd\bvim\vindent\1\0\1\venable\1\14highlight\1\0\2\venable\2&additional_vim_regex_highlighting\1\21ensure_installed\1\0\1\17auto_install\2\1\6\0\0\bcpp\blua\bvim\thelp\vpython\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "C:\\Users\\leonardo\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "C:\\Users\\leonardo\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
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
    loaded = true,
    path = "C:\\Users\\leonardo\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\telescope-symbols.nvim",
    url = "https://github.com/nvim-telescope/telescope-symbols.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\n¸\5\0\0\v\0\"\0I6\0\0\0006\2\1\0'\3\2\0B\0\3\3\15\0\0\0X\2BÄ9\2\3\0015\4\a\0005\5\5\0005\6\4\0=\6\6\5=\5\b\4B\2\2\0016\2\t\0009\2\n\0029\2\v\2\18\3\2\0'\5\f\0'\6\r\0'\a\14\0004\b\0\0+\t\0\0'\n\15\0B\3\a\1\18\3\2\0'\5\f\0'\6\16\0'\a\17\0004\b\0\0+\t\0\0'\n\18\0B\3\a\1\18\3\2\0'\5\f\0'\6\19\0'\a\20\0005\b\21\0+\t\0\0'\n\22\0B\3\a\1\18\3\2\0'\5\f\0'\6\23\0'\a\24\0004\b\0\0+\t\0\0'\n\25\0B\3\a\1\18\3\2\0'\5\f\0'\6\26\0'\a\27\0004\b\0\0+\t\0\0'\n\28\0B\3\a\1\18\3\2\0'\5\f\0'\6\29\0'\a\30\0004\b\0\0+\t\0\0'\n\15\0B\3\a\1\18\3\2\0'\5\f\0'\6\31\0'\a \0004\b\0\0+\t\0\0'\n!\0B\3\a\1K\0\1\0\19find in buffer1<cmd>Telescope current_buffer_fuzzy_find<cr>\15<leader>tz=<cmd>Telescope find_files noignore=true hiddent=true<cr>\15<leader>tf\18find in files!<cmd>Telescope live_grep<cr>\15<leader>tg\18list searches\23<cmd>Telescope<cr>\15<leader>ts\rcommands\1\0\2\vsilent\2\vnowait\2 <cmd>Telescope commands<cr>\15<leader>tc\14Telescope\5\14<leader>t\15find files\"<cmd>Telescope find_files<cr>\14<leader>f\6n\15set_keymap\vkeymap\aLM\fpickers\1\0\0\15find_files\1\0\0\1\0\1\vhidden\2\nsetup\14telescope\frequire\npcall\0" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "C:\\Users\\leonardo\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["toggleterm.nvim"] = {
    commands = { "ToggleTerm" },
    config = { "\27LJ\2\nÜ\1\0\0\5\0\b\0\v'\0\0\0006\1\1\0'\3\2\0B\1\2\0029\1\3\0015\3\4\0005\4\5\0=\4\6\3=\0\a\3B\1\2\1K\0\1\0\nshell\15float_opts\1\0\1\vborder\vcurved\1\0\1\14direction\nfloat\nsetup\15toggleterm\frequire\tpwsh\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "C:\\Users\\leonardo\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\toggleterm.nvim",
    url = "https://github.com/akinsho/toggleterm.nvim"
  },
  ["vim-startuptime"] = {
    commands = { "StartupTime" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "C:\\Users\\leonardo\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\vim-startuptime",
    url = "https://github.com/dstein64/vim-startuptime"
  },
  ["which-key.nvim"] = {
    loaded = true,
    path = "C:\\Users\\leonardo\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: lspsaga.nvim
time([[Config for lspsaga.nvim]], true)
try_loadstring("\27LJ\2\n®\b\0\0\6\0\28\0!6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\3\0005\4\4\0=\4\5\0035\4\6\0=\4\a\0035\4\b\0=\4\t\0035\4\n\0=\4\v\0035\4\r\0005\5\f\0=\5\14\0045\5\15\0=\5\16\4=\4\17\0035\4\18\0=\4\19\0035\4\20\0=\4\21\0035\4\22\0=\4\23\0035\4\24\0=\4\25\0034\4\0\0=\4\26\0034\4\0\0=\4\27\3B\1\2\1K\0\1\0\24server_filetype_map\16custom_kind\17show_outline\1\0\b\17auto_preview\2\15auto_enter\2\14win_width\3\30\rwin_with\5\rjump_key\6o\17win_position\nright\17auto_refresh\2\14virt_text\b‚îÉ\21symbol_in_winbar\1\0\6\19file_formatter\5\14show_file\2\venable\2\14separator\tÔëä \14in_custom\1\18click_support\1\27definition_action_keys\1\0\5\tquit\6q\ttabe\v<C-c>t\vvsplit\v<C-c>v\tedit\v<C-c>o\nsplit\v<C-c>i\21code_action_keys\1\0\2\tquit\6q\texec\t<CR>\23finder_action_keys\tquit\1\3\0\0\6q\n<ESC>\topen\1\0\3\ttabe\6t\vvsplit\6s\nsplit\6i\1\3\0\0\6o\t<CR>\17finder_icons\1\0\3\bdef\nÓàï  \bref\tÔ™æ \tlink\nÔ†∏  \26code_action_lightbulb\1\0\a\16update_time\3ñ\1\17virtual_text\2\venable\2\18sign_priority\3\20\tsign\2\22cache_code_action\2\21enable_in_insert\2\22diagnostic_header\1\5\0\0\tÔÅó \tÔÅ™ \tÔÅö \tÔ¥û \17move_in_saga\1\0\2\tprev\n<C-p>\tnext\n<C-n>\1\0\t\23rename_action_quit\n<C-c>\18saga_winblend\3\0\17border_style\vsingle\27finder_request_timeout\3‹\v\29code_action_num_shortcut\2\21code_action_icon\tüí°\22max_preview_lines\3\n\24preview_lines_above\3\0\21rename_in_select\2\18init_lsp_saga\flspsaga\frequire\0", "config", "lspsaga.nvim")
time([[Config for lspsaga.nvim]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.api.nvim_create_user_command, 'NvimTreeToggle', function(cmdargs)
          require('packer.load')({'nvim-tree.lua'}, { cmd = 'NvimTreeToggle', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'nvim-tree.lua'}, { cmd = 'NvimTreeToggle' }, _G.packer_plugins)
          vim.api.nvim_input('<space><bs><tab>')
      end})
pcall(vim.api.nvim_create_user_command, 'ToggleTerm', function(cmdargs)
          require('packer.load')({'toggleterm.nvim'}, { cmd = 'ToggleTerm', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'toggleterm.nvim'}, { cmd = 'ToggleTerm' }, _G.packer_plugins)
          vim.api.nvim_input('<space><bs><tab>')
      end})
pcall(vim.api.nvim_create_user_command, 'StartupTime', function(cmdargs)
          require('packer.load')({'vim-startuptime'}, { cmd = 'StartupTime', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'vim-startuptime'}, { cmd = 'StartupTime' }, _G.packer_plugins)
          vim.api.nvim_input('<space><bs><tab>')
      end})
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType cpp ++once lua require("packer.load")({'nvim-treesitter'}, { ft = "cpp" }, _G.packer_plugins)]]
vim.cmd [[au FileType python ++once lua require("packer.load")({'nvim-treesitter', 'black.vim'}, { ft = "python" }, _G.packer_plugins)]]
vim.cmd [[au FileType lua ++once lua require("packer.load")({'nvim-treesitter'}, { ft = "lua" }, _G.packer_plugins)]]
vim.cmd [[au FileType c ++once lua require("packer.load")({'nvim-treesitter'}, { ft = "c" }, _G.packer_plugins)]]
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'nvim-treesitter'}, { ft = "markdown" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au BufNewFile * ++once lua require("packer.load")({'nvim-treesitter'}, { event = "BufNewFile *" }, _G.packer_plugins)]]
vim.cmd [[au FileReadPost * ++once lua require("packer.load")({'nvim-treesitter'}, { event = "FileReadPost *" }, _G.packer_plugins)]]
vim.cmd [[au VimEnter * ++once lua require("packer.load")({'telescope.nvim'}, { event = "VimEnter *" }, _G.packer_plugins)]]
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
