-- Leonardo Mascelli
-- lmascelli@gmail.com
-- My simple one file Neovim configuration

-- try compile the conf with impatient
pcall(require, 'impatient')

-------------------------------------------------------------------------------
--                                                                           --
--                              GLOBALS                                      --
--                                                                           --
-------------------------------------------------------------------------------
local opt = vim.opt
local fn = vim.fn


LM = {
  matlab_exec = 'D:/Program Files/MATLAB/R2022b/bin/matlab'
}

------------------------------------------------------------------------------
--                                                                           --
--                              OPTIONS                                      --
--                                                                           --
-------------------------------------------------------------------------------
do
  opt.backup = false
  opt.clipboard = "unnamedplus"
  -- opt.cmdheight = 2,
  opt.completeopt = { "menu", "menuone", "noselect" }
  opt.conceallevel = 0
  opt.ignorecase = true
  opt.mouse = 'a'
  opt.pumheight = 10
  opt.showmatch = true
  opt.showmode = false
  opt.showtabline = 2
  opt.smartcase = true
  opt.smartindent = true
  opt.splitbelow = true
  opt.splitright = true
  opt.swapfile = false
  opt.termguicolors = true
  opt.timeoutlen = 1000
  opt.undofile = true
  opt.updatetime = 300
  opt.writebackup = false
  opt.expandtab = true
  opt.shiftwidth = 2
  opt.tabstop = 2
  opt.cursorline = true
  opt.signcolumn = "auto"
  opt.wrap = false
  opt.scrolloff = 8
  opt.sidescrolloff = 8
  opt.virtualedit = "onemore" -- can move cursor one character before the end
  vim.o.colorcolumn = "80"

  -- line number
  opt.number = true
  opt.relativenumber = true
  opt.numberwidth = 4
  vim.cmd "autocmd TermOpen * setlocal nonumber norelativenumber"

  vim.cmd ":set fillchars+=eob:\\ " -- no $ after the end of buffer

  -- turn off fsync on Windows (because it slow down the editor)
  if vim.fn.has('win32') then
    vim.o.fsync = false
  end
end

-------------------------------------------------------------------------------
--                                                                           --
--                                UTILS                                      --
--                                                                           --
-------------------------------------------------------------------------------
do
  -- delete buffers without closing the window
  LM.buffer_delete = function()
    vim.cmd 'bprevious'
    vim.cmd 'bdelete#'
  end

  -- indent buffer
  LM.indent_buffer = function()
    local curpos = vim.fn.getcurpos()
    vim.api.nvim_feedkeys('gg=G', 'n', false)
    for k, v in ipairs(curpos) do print(k, v) end
    vim.fn.cursor(curpos[2], curpos[3])
  end

  -- exec a command in a floating terminal
  LM.exec_cmd = function(cmd)
    local buf = vim.api.nvim_create_buf(false, false)
    local margin = 0.1
    vim.api.nvim_open_win(buf, true, {
      relative = "editor",
      width = math.floor(vim.o.columns * (1 - 2 * margin)),
      height = math.floor(vim.o.lines * (1 - 2 * margin)),
      row = math.floor(vim.o.lines * margin),
      col = math.floor(vim.o.columns * margin),
    })
    vim.cmd(':terminal ' .. cmd)
  end

  -- exec PROJECT.PS1 script
  LM.project_ps1 = function()
    if (vim.fn.findfile('project.ps1') == 'project.ps1') then
      local action = vim.fn.input('arguments: ')
      local cmd = 'pwsh -Command ./project.ps1 ' .. action
      LM.exec_cmd(cmd)
      vim.cmd ':startinsert'
    else
      print 'project.ps1 script not found'
    end
  end

  -- exec PROJECT.LUA script
  LM.project_lua = function()
    if (vim.fn.findfile('project.lua') == 'project.lua') then
      vim.cmd ':source project.lua'
    else
      print 'project.ps1 script not found'
    end
  end

  LM.edit_conf = function()
    LM.push_dir()
    vim.cmd('cd ' .. vim.fn.stdpath('config'))
    vim.cmd 'e .'
  end
end
-------------------------------------------------------------------------------
--                                                                           --
--                              KEYMAPS                                      --
--                                                                           --
-------------------------------------------------------------------------------
local set_keymap = nil
do
  vim.g.mapleader = " "
  vim.g.maplocalleader = " "

  set_keymap = function(keymap)
    local opts = { noremap = true, silent = true }
    local term_opts = { silent = true }
    local buf = nil

    --------------------------------------  NORMAL -----------------------------

    --  Window navigation
    keymap("n", "<leader>w", "", opts, buf, "Window")
    keymap('n', '<leader>wc', '<cmd>q<cr>', opts, buf, 'Close window')
    keymap('n', '<leader>wo', '<cmd>only<cr>', opts, buf, 'Close other windows')
    keymap('n', '<leader>wv', '<C-w>v', opts, buf, 'Split vertical')
    keymap('n', '<leader>ws', '<C-w>s', opts, buf, 'Split horizontal')
    keymap("n", "<C-h>", "<C-w>h", opts, buf, 'Window left')
    keymap("n", "<C-j>", "<C-w>j", opts, buf, 'Window down')
    keymap("n", "<C-k>", "<C-w>k", opts, buf, 'Window up')
    keymap("n", "<C-l>", "<C-w>l", opts, buf, 'Window right')
    keymap("n", "<leader>q", "", opts, buf, "Quit")
    keymap('n', '<leader>qq', '<cmd>qa!<cr>', opts, buf, 'Quit')
    keymap('n', '<m-ScrollWheelUp>', 'zhzh', opts, buf, '')
    keymap('n', '<m-ScrollWheelDown>', 'zlzl', opts, buf, '')

    --  File explorer
    keymap("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", opts, buf, 'Explorer')

    -- ToggleTerm
    keymap('n', '<leader>ò', '<cmd>ToggleTerm<cr>',
      { silent = true, noremap = true }, nil, 'terminal')

    --  Window resizing
    keymap("n", "<leader>we", "<C-w>=", opts, buf, 'equalize')
    keymap("n", "<C-Up>", ":resize +2<cr>", opts, buf, '')
    keymap("n", "<C-Down>", ":resize -2<cr>", opts, buf, '')
    keymap("n", "<C-Left>", ":vertical resize -2<cr>", opts, buf, '')
    keymap("n", "<C-Right>", ":vertical resize +2<cr>", opts, buf, '')

    -- Buffer navigation
    keymap("n", "<S-l>", ":bnext<cr>", opts, buf, '')
    keymap("n", "<S-h>", ":bprevious<cr>", opts, buf, '')
    keymap("n", "<leader>b", "", opts, buf, "Buffer")
    keymap("n", "<leader>bd", "<cmd>:lua LM.buffer_delete()<cr>", opts, buf, "delete")
    keymap("n", "<leader>bf", "<cmd>:lua LM.indent_buffer()<cr>", opts, buf, "indent")

    keymap('n', '<a-1>', '<cmd>BufferLineGoToBuffer1<cr>', {}, buf, "")
    keymap('n', '<a-2>', '<cmd>BufferLineGoToBuffer2<cr>', {}, buf, "")
    keymap('n', '<a-3>', '<cmd>BufferLineGoToBuffer3<cr>', {}, buf, "")
    keymap('n', '<a-4>', '<cmd>BufferLineGoToBuffer4<cr>', {}, buf, "")
    keymap('n', '<a-5>', '<cmd>BufferLineGoToBuffer5<cr>', {}, buf, "")
    keymap('n', '<a-5>', '<cmd>BufferLineGoToBuffer5<cr>', {}, buf, "")
    keymap('n', '<a-6>', '<cmd>BufferLineGoToBuffer6<cr>', {}, buf, "")
    keymap('n', '<a-7>', '<cmd>BufferLineGoToBuffer7<cr>', {}, buf, "")
    keymap('n', '<a-8>', '<cmd>BufferLineGoToBuffer8<cr>', {}, buf, "")
    keymap('n', '<a-9>', '<cmd>BufferLineGoToBuffer9<cr>', {}, buf, "")
    keymap('n', '<c-tab>', '<cmd>BufferLineCycleNext<cr>', {}, buf, "")
    keymap('n', '<c-\\>', '<cmd>BufferLineCyclePrev<cr>', {}, buf, "")

    -- Buffer editing
    keymap("n", "<C-s>", ":w!<cr>", opts, buf, '')
    keymap("n", "U", ":redo<cr>", opts, buf, '')

    -- Searching in buffer
    keymap('n', '<leader>s', '', {}, nil, 'Search')
    keymap('n', '<leader>ss', '/', {silent = false}, nil, 'search')
    keymap('n', '<leader>sr', ':%s/', {silent = false}, nil, 'repleace')
    keymap('n', '<leader>sh', '<cmd>nohl<cr>', {}, nil, 'highlight off')

    -- Telescope searches
    keymap('n', '<leader>f', '<cmd>Telescope find_files<cr>', {}, nil, 'find files')
    keymap('n', '<leader>t', '', {}, nil, 'Telescope')
    keymap('n', '<leader>tc', '<cmd>Telescope commands<cr>', {
      silent = true,
      nowait = true,
    }, nil, 'commands')
    keymap('n', '<leader>ts', '<cmd>Telescope<cr>', {}, nil, 'list searches')
    keymap('n', '<leader>tg', '<cmd>Telescope live_grep<cr>', {}, nil, 'find in files')
    keymap('n', '<leader>tf', '<cmd>Telescope find_files noignore=true hiddent=true<cr>', {}, nil, 'find files')
    keymap('n', '<leader>tz', '<cmd>Telescope current_buffer_fuzzy_find<cr>', {}, nil, 'find in buffer')

    -- Script evaluating
    keymap('n', '<leader>v', '', opts, buf, 'Script')
    keymap('n', '<leader>vc', '<cmd>source %<cr>', {}, buf, 'Source this file')
    keymap('n', '<leader>vl', '<cmd>lua LM.project_lua()<cr>', {
      silent = true,
      nowait = true,
    }, buf, 'project.lua')
    keymap('n', '<leader>vp', '<cmd>lua LM.project_ps1()<cr>', {
      silent = true,
      nowait = true,
    }, buf, 'project.ps1')

    -- Appearence
    keymap('n', '<leader>a', '', opts, buf, 'Appearence')
    keymap('n', '<leader>a+', ':lua LM.font.increase_font_size()<cr>', opts, buf, 'Increase Font')
    keymap('n', '<leader>a-', ':lua LM.font.decrease_font_size()<cr>', opts, buf, 'Decrease Font')
    keymap("n", "<C-+>", ":lua LM.font.increase_font_size()<cr>", opts, buf, 'Increase Font')
    keymap("n", "<C-->", ":lua LM.font.decrease_font_size()<cr>", opts, buf, 'Decrease Font')


    ------------------------------------- INSERT -------------------------------

    keymap("i", "<C-ì>", "<C-k>'?", opts, buf, '')
    keymap("c", "<C-ì>", "<C-k>'?", opts, buf, '')
    keymap("i", "<C-'>", "<C-k>'!", opts, buf, '')
    keymap("c", "<C-'>", "<C-k>'!", opts, buf, '')
    keymap("i", "<s-cr>", "<c-o>O", opts, buf, '')
    keymap("i", "<c-cr>", "<c-o>o", opts, buf, '')

    -- Completion
    keymap("i", "<C-Space>", "<C-x><C-o>", opts, buf, '')

    -- File saving
    keymap("i", "<C-s>", "<cmd>:w!<cr>", opts, buf, '')


    ------------------------------------- VISUAL -------------------------------

    -- Moving text
    keymap("v", "<A-j>", ":m .+1<CR>==", opts, buf, '')
    keymap("v", "<A-k>", ":m .-2<CR>==", opts, buf, '')
    keymap("v", "p", '"_dP', opts, buf, '')


    ----------------------------------- VISUAL BLOCK ---------------------------

    -- Moving text
    keymap("x", "J", ":move '>+1<CR>gv-gv", opts, buf, '')
    keymap("x", "K", ":move '<-2<CR>gv-gv", opts, buf, '')
    keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts, buf, '')
    keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts, buf, '')


    ------------------------------------- TERMINAL -----------------------------
    keymap("t", "<Escape>", "<C-\\><C-n>", term_opts, buf, '')
    keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts, buf, '')
    keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts, buf, '')
    keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts, buf, '')
    keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts, buf, '')


    -- italian keyboard utility
    keymap('t', '<c-ì>', '~', {})
    keymap('t', '<c-\'>', '`', {})
  end
end

-------------------------------------------------------------------------------
--                                                                           --
--                              PLUGINS                                      --
--                                                                           --
-------------------------------------------------------------------------------
do
  local ensure_packer = function()
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
      fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
      vim.cmd [[packadd packer.nvim]]
      return true
    end
    return false
  end
  local packer_bootstrap = ensure_packer()

  do -- packer config
    local packer = require 'packer'
    local util = require 'packer.util'
    packer.reset()
    packer.init(
      {
        ensure_dependencies  = true, -- Should packer install plugin dependencies?
        snapshot             = nil, -- Name of the snapshot you would like to load at startup
        snapshot_path        = util.join_paths(fn.stdpath 'cache', 'packer.nvim'), -- Default save directory for snapshots
        package_root         = util.join_paths(vim.fn.stdpath('data'), 'site', 'pack'),
        compile_path         = util.join_paths(vim.fn.stdpath('config'), 'plugin', 'packer_compiled.lua'),
        plugin_package       = 'packer', -- The default package for plugins
        max_jobs             = nil, -- Limit the number of simultaneous jobs. nil means no limit
        auto_clean           = true, -- During sync(), remove unused plugins
        compile_on_sync      = true, -- During sync(), run packer.compile()
        disable_commands     = false, -- Disable creating commands
        opt_default          = true, -- Default to using opt (as opposed to start) plugins
        transitive_opt       = false, -- Make dependencies of opt plugins also opt by default
        transitive_disable   = true, -- Automatically disable dependencies of disabled plugins
        auto_reload_compiled = true, -- Automatically reload the compiled file after creating it.
        preview_updates      = false, -- If true, always preview updates before choosing which plugins to update, same as `PackerUpdate --preview`.
        git                  = {
          cmd = 'git', -- The base command for git operations
          subcommands = { -- Format strings for git subcommands
            update         = 'pull --ff-only --progress --rebase=false',
            install        = 'clone --depth %i --no-single-branch --progress',
            fetch          = 'fetch --depth 999999 --progress',
            checkout       = 'checkout %s --',
            update_branch  = 'merge --ff-only @{u}',
            current_branch = 'branch --show-current',
            diff           = 'log --color=never --pretty=format:FMT --no-show-signature HEAD@{1}...HEAD',
            diff_fmt       = '%%h %%s (%%cr)',
            get_rev        = 'rev-parse --short HEAD',
            get_msg        = 'log --color=never --pretty=format:FMT --no-show-signature HEAD -n 1',
            submodules     = 'submodule update --init --recursive --progress'
          },
          depth = 1, -- Git clone depth
          clone_timeout = 60, -- Timeout, in seconds, for git clones
          default_url_format = 'https://github.com/%s' -- Lua format string used for "aaa/bbb" style plugins
        },
        display              = {
          non_interactive = false, -- If true, disable display windows for all operations
          compact         = false, -- If true, fold updates results by default
          open_fn         = nil, -- An optional function to open a window for packer's display
          open_cmd        = '65vnew \\[packer\\]', -- An optional command to open a window for packer's display
          working_sym     = '⟳', -- The symbol for a plugin being installed/updated
          error_sym       = '✗', -- The symbol for a plugin with an error in installation/updating
          done_sym        = '✓', -- The symbol for a plugin which has completed installation/updating
          removed_sym     = '-', -- The symbol for an unused plugin which was removed
          moved_sym       = '→', -- The symbol for a plugin which was moved (e.g. from opt to start)
          header_sym      = '━', -- The symbol for the header line in packer's display
          show_all_info   = true, -- Should packer show all update details automatically?
          prompt_border   = 'double', -- Border style of prompt popups.
          keybindings     = { -- Keybindings for the display window
            quit = 'q',
            toggle_update = 'u', -- only in preview
            continue = 'c', -- only in preview
            toggle_info = '<CR>',
            diff = 'd',
            prompt_revert = 'r',
          }
        },
        luarocks             = {
          python_cmd = 'python' -- Set the python command to use for running hererocks
        },
        log                  = { level = 'warn' }, -- The default print log level. One of: "trace", "debug", "info", "warn", "error", "fatal".
        profile              = {
          enable = true,
          threshold = 1, -- integer in milliseconds, plugins which load faster than this won't be shown in profile output
        },
        autoremove           = false, -- Remove disabled or unused plugins without prompting the user
      }
    )
  end

  local use = require 'packer'.use

  do -- template for use
    --    use {
    --   'myusername/example',        -- The plugin location string
    --   -- The following keys are all optional
    --   disable = boolean,           -- Mark a plugin as inactive
    --   as = string,                 -- Specifies an alias under which to install the plugin
    --   installer = function,        -- Specifies custom installer. See "custom installers" below.
    --   updater = function,          -- Specifies custom updater. See "custom installers" below.
    --   after = string or list,      -- Specifies plugins to load before this plugin. See "sequencing" below
    --   rtp = string,                -- Specifies a subdirectory of the plugin to add to runtimepath.
    --   opt = boolean,               -- Manually marks a plugin as optional.
    --   bufread = boolean,           -- Manually specifying if a plugin needs BufRead after being loaded
    --   branch = string,             -- Specifies a git branch to use
    --   tag = string,                -- Specifies a git tag to use. Supports '*' for "latest tag"
    --   commit = string,             -- Specifies a git commit to use
    --   lock = boolean,              -- Skip updating this plugin in updates/syncs. Still cleans.
    --   run = string, function, or table, -- Post-update/install hook. See "update/install hooks".
    --   requires = string or list,   -- Specifies plugin dependencies. See "dependencies".
    --   rocks = string or list,      -- Specifies Luarocks dependencies for the plugin
    --   config = string or function, -- Specifies code to run after this plugin is loaded.
    --   -- The setup key implies opt = true
    --   setup = string or function,  -- Specifies code to run before this plugin is loaded.
    --   -- The following keys all imply lazy-loading and imply opt = true
    --   cmd = string or list,        -- Specifies commands which load this plugin. Can be an autocmd pattern.
    --   ft = string or list,         -- Specifies filetypes which load this plugin.
    --   keys = string or list,       -- Specifies maps which load this plugin. See "Keybindings".
    --   event = string or list,      -- Specifies autocommand events which load this plugin.
    --   fn = string or list          -- Specifies functions which load this plugin.
    --   cond = string, function, or list of strings/functions,   -- Specifies a conditional test to load this plugin
    --   module = string or list      -- Specifies Lua module names for require. When requiring a string which starts
    --                                -- with one of these module names, the plugin will be loaded.
    --   module_pattern = string/list -- Specifies Lua pattern of Lua module names for require. When requiring a string which matches one of these patterns, the plugin will be loaded.
    -- }
  end

  use { 'lewis6991/impatient.nvim', opt = false }

  use { 'wbthomason/packer.nvim', opt = false }

  use { 'nvim-lua/plenary.nvim', opt = false }

  use { 'nvim-tree/nvim-web-devicons', opt = false }

  do -- bufferline
    use {
      'akinsho/bufferline.nvim',
      opt = false,
      requires = 'nvim-tree/nvim-web-devicons'
    }
    local ok, bufferline = pcall(require, 'bufferline')
    if ok then
      bufferline.setup {
        options = {
          diagnostics_indicator = function(count, level, diagnostics_dict, context)
            local s = " "
            for e, n in pairs(diagnostics_dict) do
              local sym = e == "error" and " "
                  or (e == "warning" and " " or "")
              s = s .. n .. sym
            end
            return s
          end
        }
      }
    end
  end

  use { -- telescope
    'nvim-telescope/telescope.nvim',
    opt = false,
    requires = {
      { 'nvim-telescope/telescope-symbols.nvim', opt = false },
    },
    event = "VimEnter",
    config = function()
      local ok, telescope = pcall(require, 'telescope')
      if ok then
        telescope.setup {
          pickers = {
            -- find_files = true,
          }
        }
      end
    end,
  }

  use { -- nvim-treesitter
    'nvim-treesitter/nvim-treesitter',
    event  = { "BufNewFile", "FileReadPost" },
    ft     = { "lua", "python", "c", "cpp" },
    config = function()
      local ok, treesitter_config = pcall(require, 'nvim-treesitter.configs')
      if ok then
        treesitter_config.setup {
          -- A list of parser names, or "all"
          ensure_installed = { "cpp", "lua", "vim", "help", "python" },

          -- Install parsers synchronously (only applied to `ensure_installed`)
          sync_install = false,

          auto_install = true,

          ignore_install = {},

          ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
          -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

          highlight = {
            enable = true,

            -- list of language that will be disabled
            disable = {},
            -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
            -- disable = function(lang, buf)
            --   local max_filesize = 100 * 1024 -- 100 KB
            --   local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            --   if ok and stats and stats.size > max_filesize then
            --     return true
            --   end
            -- end,

            -- Instead of true it can also be a list of languages
            additional_vim_regex_highlighting = false,
          },
        }

        vim.cmd [[
        set foldmethod=expr
        set foldexpr=nvim_treesitter#foldexpr()
        ]]
      end
    end,
  }

  use { -- nvim-tree
    'kyazdani42/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
    cmd = "NvimTreeToggle",
    -- event = "VimEnter",
    config = function()
      require("nvim-tree").setup {
        view = {
          mappings = {
            list = {
              { key = "cd", action = "cd" },
              { key = "cc", action = "copy" },
            }
          }
        }
      }
    end
  }

  do -- which-key
    use { 'folke/which-key.nvim', opt = false }

    local ok, wk = pcall(require, 'which-key')
    if ok then
      local function wk_set_keymap(mode, map, expr, opts, buf, name)
        opts = opts or {
          silent = true,
          noremap = true,
          nowait = false,
        }
        local mapping = {}
        local mapping_data = {}
        if string.len(expr) > 0 then
          table.insert(mapping_data, 0, expr)
          table.insert(mapping_data, 1, name)
        else
          mapping_data.name = name or ''
        end
        mapping[map] = mapping_data

        local wk_opts = {
          mode = mode,
          buffer = buf,
          silent = opts.silent,
          noremap = opts.noremap,
          nowait = opts.nowait,
        }
        wk.register(mapping, wk_opts)
      end

      LM.keymap = wk_set_keymap

      set_keymap(wk_set_keymap)
    end
  end

  use { -- lsp
    { "williamboman/mason.nvim", opt = false },
    { "williamboman/mason-lspconfig.nvim", opt = false },
    { "neovim/nvim-lspconfig", opt = false },
  }


  do -- nvim-autopairs
    use 'windwp/nvim-autopairs'

    local ok, npairs = pcall(require, 'nvim-autopairs')

    if ok then
      npairs.setup {
        map_cr = true
      }
    end
  end

  use { -- toggleterm
    'akinsho/toggleterm.nvim',
    cmd = "ToggleTerm",
    config = function()
      local shell = 'pwsh'
      local ok, toggleterm = pcall(require, 'toggleterm')
      if ok then
        toggleterm.setup {
          float_opts = { border = 'curved' },
          direction = 'float',
          shell = shell,
        }
      end
    end,
  }

  use {
    'numToStr/Comment.nvim',
    keys = { "gcc", "gcb", { "v", "gc" }, { "v", "gb" }, { "x", "gc" }, { "x", "gb" } },
    config = function()
      local ok, comment = pcall(require, 'Comment')
      if ok then
        comment.setup {}
      end
    end,
  }

  -- sync packer if installed
  if packer_bootstrap then
    local packer = require 'packer'
    packer.sync()
    packer.compile()
  end

  -- sync and compile when saving this file
  vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = "*/nvim/init.lua",
    callback = function(par)
      vim.cmd(':source ' .. os.getenv("MYVIMRC"))
      local packer = require 'packer'
      packer.sync()
      packer.compile()
    end
  })
end


-------------------------------------------------------------------------------
--                                                                           --
--                                LSP                                        --
--                                                                           --
-------------------------------------------------------------------------------
do
  local ok_mason, mason = pcall(require, 'mason')
  local ok_mason_lspcinfig, mason_lspconfig = pcall(require, 'mason-lspconfig')
  local ok_lsp, lsp_config = pcall(require, 'lspconfig')

  if ok_mason and ok_mason_lspcinfig then
    mason.setup()
    mason_lspconfig.setup()
  end

  if ok_lsp then
    local on_attach = function(client, bufnr)
      local keymap = LM.keymap
      local opts = { noremap = true, silent = true }
      keymap('n', '<leader>l', '', opts, bufnr, 'lsp')
      keymap('n', '<leader>ld', '', opts, bufnr, 'diagnostic')
      keymap('n', '<leader>lde', '<cmd>lua vim.diagnostic.open_float()<CR>', opts, bufnr, 'list float')
      keymap('n', '<leader>ldp', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts, bufnr, 'prev')
      keymap('n', '<leader>ldn', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts, bufnr, 'next')
      keymap('n', '<leader>ldl', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts, bufnr, 'list')

      -- Use an on_attach function to only map the following keys
      -- after the language server attaches to the current buffer
      -- Enable completion triggered by <c-x><c-o>
      vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

      -- Mappings.
      -- See `:help vim.lsp.*` for documentation on any of the below functions
      keymap('n', '<leader>lg', '', opts, bufnr, 'go to')
      keymap('n', '<leader>lgD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts, bufnr, 'declaration')
      keymap('n', '<leader>lgd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts, bufnr, 'definition')
      keymap('n', '<leader>lgi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts, bufnr, 'implementation')
      keymap('n', '<leader>lgD', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts, bufnr, 'type definition')
      keymap('n', '<leader>lgr', '<cmd>lua vim.lsp.buf.references()<CR>', opts, bufnr, 'references')
      keymap('n', '<leader>lK', '<cmd>lua vim.lsp.buf.hover()<CR>', opts, bufnr, 'documentation')
      keymap('n', '<leader>lk', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts, bufnr, 'signature')
      keymap('i', '<c-l>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts, bufnr, '')
      keymap('n', '<leader>lw', '', opts, bufnr, 'workspace')
      keymap('n', '<leader>lwa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts, bufnr, 'add')
      keymap('n', '<leader>lwr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts, bufnr, 'remove')
      keymap('n', '<leader>lwl',
        '<cmdint(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts, bufnr, 'list')
      keymap('n', '<leader>lr', '<cmd>lua vim.lsp.buf.rename()<CR>', opts, bufnr, 'rename')
      keymap('n', '<leader>lc', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts, bufnr, 'code action')
      keymap('n', '<leader>lf', '<cmd>lua vim.lsp.buf.format()<CR>', opts, bufnr, 'format')
    end

    lsp_config.sumneko_lua.setup {
      on_attach = on_attach,
      settings = {
        Lua = {
          runtime = {
            version = 'LuaJIT',
          },
          diagnostics = {
            globals = { 'vim' },
          },
          workspace = {
            library = {
              [vim.fn.expand("$VIMRUNTIME/lua")] = true,
              [vim.fn.stdpath("config") .. "/lua"] = true,
            }
          },
          telemetry = {
            enable = false,
          }
        }
      },
    }

    lsp_config.clangd.setup { -- clangd
      server = {
        on_attach = function(client, bufnr)
          LM.clangd_create_mingw_conf = LM.clangd_create_mingw_conf or function()
            vim.fn.writefile({ "CompileFlags:",
              " Add: [-target, x86_64-pc-windows-gnu]" },
              ".clangd")
          end
          on_attach(client, bufnr)
          LM.keymap("n", "<leader>lh", "<cmd>ClangdSwitchSourceHeader<cr>", {}, nil,
            "Switch Source-Header")
          LM.keymap("n", "<leader>lcl", "<cmd>lua LM.clangd_create_mingw_conf()<cr>",
            {}, nil, "Create .clangd for mingw")
        end,
        cmd = {
          "clangd",
          "--log=verbose",
        },
      },
      extensions = {
        inlay_hints = {
          only_current_line = true,
        },
        cmd = { "clangd", "--completion-style=detailed" },
      },
    }


    lsp_config.powershell_es.setup {
      on_attach = on_attach,
    }

    lsp_config.pyright.setup {
      on_attach = function(client, bufnr)
        on_attach(client, bufnr)
      end
    }
  end
end

-------------------------------------------------------------------------------
--                                                                           --
--                               LOOK
--                                                                           --
-------------------------------------------------------------------------------
do
  local font = {
    font_name = 'FiraCode NF',
    font_size = 10,
  }

  font.update_font = function()
    vim.opt.guifont = font.font_name .. ':h' .. font.font_size
  end

  font.increase_font_size = function()
    font.font_size = font.font_size + 1
    font.update_font()
  end

  font.decrease_font_size = function()
    font.font_size = font.font_size - 1
    font.update_font()
  end

  font.update_font()

  LM.font = font

  vim.cmd 'colorscheme slate'

  -- italic font for comments
  vim.cmd "highlight Comment cterm=italic gui=italic"
end
