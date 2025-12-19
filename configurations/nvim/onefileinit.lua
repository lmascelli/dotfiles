if vim.fn.has('nvim-0.9') == 1 then
  vim.loader.enable()
end

--------------------------------------------------------------------------------
---                           CORE CONFIG UTILS
--------------------------------------------------------------------------------

LM = {
  augroups = {
    colorscheme = vim.api.nvim_create_augroup("LMColorscheme", {
      clear = true,
    }),
    chdir = vim.api.nvim_create_augroup("LMChDir", {
      clear = true,
    }),
    lspconfig = vim.api.nvim_create_augroup('UserLspConfig', {}),
  },
  fn = {
  },
}


local load_custom_file = function()
	-- check if there is a global custom config file that can hold
	-- different configuration from system to system. if not create
	-- a default one
	local custom_file = vim.fn.stdpath('config') .. '/custom.lua'
	if vim.fn.filereadable(custom_file) ~= 0 then
		local res, _ = pcall(dofile, custom_file)
		if not res then
			vim.notify("ERROR loading custom.lua")
		end
	else
		vim.fn.writefile(
			vim.fn.readfile(vim.fn.stdpath('config') .. '/custom_template.lua'),
			vim.fn.stdpath('config') .. '/custom.lua'
		)
	end
end


local edit_conf_dir = function(open_explorer)
  vim.fn.chdir(vim.fn.stdpath 'config')
  if open_explorer then
    LM.fn.toggle_explorer()
  end
end

-- open custom.lua configuration file
local edit_custom_config = function()
  local command = 'e ' .. vim.fn.stdpath('config') .. '/custom.lua'
  vim.cmd(command)
end

local format_buffer = function()
  local curpos = vim.fn.getcurpos()
  vim.api.nvim_feedkeys('gg=G', 'n', false)
  for k, v in ipairs(curpos) do print(k, v) end
  vim.fn.cursor(curpos[2], curpos[3])
end

local delete_buffer = function()
  local count = 0
  for _, v in pairs(vim.api.nvim_list_bufs()) do
    if vim.fn.buflisted(v) == 1 then
      count = count + 1
    end
  end
  if count == 1 then
    vim.api.nvim_create_buf(true, true)
  end
  pcall(vim.cmd, 'bprevious!')
  pcall(vim.cmd, 'bdelete!#')
end

-- spawn an external terminal in current directory
local spawn_terminal = function()
  local job = nil
  -- check if wezterm path is set or it's in PATH
  if (LM.wezterm_path and vim.fn.executable(LM.wezterm_path)) then
    job = LM.wezterm_path .. ' start --cwd .'
    vim.loop.spawn(
      LM.wezterm_path,
      {
        args = { 'start', '--cwd', '.' }
      },
      function(_, _) end
    )
    return
  elseif vim.fn.executable('wezterm') ~= 0 then
    job = "wezterm-gui start --cwd ."
  else
    -- use the set terminal or the default for the current OS
    if (LM.spawn_cmd and vim.fn.executable(LM.spawn_cmd) ~= 0) then
      job = LM.spawn_cmd
    else
      -- windows case
      if vim.fn.has('win32') ~= 0 then
        if vim.fn.executable('pwsh') ~= 0 then
          job = 'pwsh -c Start-Process pwsh'
        else
          job = 'powershell -c Start-Process pwsh'
        end
      else
        -- unix case
        if vim.fn.executable('xterm') ~= 0 then
          job = 'xterm'
        elseif vim.fn.executable('ghostty') ~= 0 then
          job = 'ghostty'
        elseif vim.fn.executable('konsole') ~= 0 then
          job = 'konsole'
        end
      end
    end
  end
  if job then
    print(job)
    vim.fn.jobstart(job .. ' ' .. vim.cmd('pwd'))
  end
end

--------------------------------------------------------------------------------
---                           EDITOR SETTINGS
--------------------------------------------------------------------------------

------------------------------
--- buffer and text
------------------------------
vim.opt.colorcolumn = '0'          -- column to highlight (0 to disable)
vim.opt.conceallevel = 0
vim.opt.foldmethod = "expr"        -- use treesitter based folding, "manual" otherwise
vim.opt.foldexpr = ""              -- set to "nvim_treesitter#foldexpr()" for treesitter based folding
vim.opt.foldlevelstart = 99
vim.opt.hidden = true              -- required to keep multiple buffers and open multiple buffers
vim.opt.signcolumn = "auto"        -- show the sign column only if needed
vim.opt.smartindent = true
vim.opt.showmatch = true
vim.opt.wrap = false               -- display lines as one long line
vim.opt.termguicolors = true       -- set term gui colors (most terminals support this)
vim.cmd ":set fillchars+=eob:\\ "  -- EOF indicator

------------------------------
--- clipboard
------------------------------
vim.opt.clipboard = "unnamedplus" -- system clipboard by default

------------------------------
--- command line
------------------------------
vim.opt.cmdheight = 1             -- height of the commandline

------------------------------
--- completion
------------------------------
vim.opt.pumheight = 10
vim.opt.updatetime = 100     -- for faster completion
vim.opt.completeopt = { "menu", "menuone", "noselect" }
if vim.fn.has('nvim-0.11') == 1 then
  vim.opt.completeopt:append('fuzzy') -- Use fuzzy matching for built-in completion
end
vim.cmd 'set omnifunc=ccomplete#Complete'

------------------------------
--- cursor
------------------------------
vim.opt.cursorline = true       -- highlight the current line
vim.opt.virtualedit = "onemore" -- let the cursor go one char after the end of the line

------------------------------
--- file encoding
------------------------------
pcall(function()
  vim.opt.fileencoding = 'utf-8'
end)

------------------------------
--- junk files
------------------------------
vim.opt.backup = false             -- no backup files
vim.opt.swapfile = false           -- no swapfiles
vim.opt.undofile = true            -- save undos
vim.opt.writebackup = false        -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited

------------------------------
--- line number
------------------------------
vim.opt.number = true                                           -- show line numbers
vim.opt.relativenumber = true                                   -- show relative line numbers
vim.opt.numberwidth = 4                                         -- set number column width
vim.cmd "autocmd TermOpen * setlocal nonumber norelativenumber" -- no line number in terminal mode

------------------------------
--- searching
------------------------------
vim.opt.hlsearch = true   -- highlight all matches on previous search pattern
vim.opt.ignorecase = true -- ignore case in search patterns
vim.opt.matchpairs:append("<:>")
vim.opt.smartcase = true
-- used for find files in current path with :find
vim.cmd 'set path=**'
vim.cmd 'set wildignore+=*/.git/*'

------------------------------
--- tab spaces
------------------------------
vim.opt.expandtab = true     -- convert tabs to spaces
vim.opt.shiftwidth = 2       -- the number of spaces inserted for each indentation
vim.opt.tabstop = 2          -- insert 2 spaces for a tab

------------------------------
--- windows and scrolling
------------------------------
-- vim.opt.scrolloff = 8           -- minimal number of screen lines to keep above and below the cursor.
-- vim.opt.sidescrolloff = 8       -- minimal number of screen lines to keep left and right of the cursor.
vim.opt.laststatus = 3             -- only a statusline for all windows
vim.opt.splitbelow = true          -- force all horizontal splits to go below current window
vim.opt.splitright = true          -- force all vertical splits to go to the right of current window
vim.opt.title = true               -- modify the window title
vim.opt.titlestring = '%t'         -- set the window title to the buffer name
vim.opt.showmode = false           -- hide current mode in statusbar
vim.opt.showtabline = 1
vim.o.winborder = "single" 

------------------------------
--- behaviour
------------------------------
vim.opt.exrc = true                                                 -- automatically load .nvim.lua in root folder
vim.opt.packpath = vim.opt.packpath + (vim.fn.getcwd() .. '/.nvim') -- add the .nvim local folder to manual plugins paths
vim.opt.mouse = 'a'                                                 -- allow the mouse to be used in neovim
vim.opt.timeoutlen = 500                                            -- time to wait for a mapped sequence to complete (in milliseconds)

------------------------------
--- Windows options
------------------------------
vim.o.fsync = false

------------------------------
--- Lsp options
------------------------------
vim.api.nvim_create_autocmd('LspAttach', {
  group = LM.augroups.lspconfig,
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
  end })

-- q closes quickfix window
vim.api.nvim_create_autocmd('FileType', {
  group = LM.augroups.lspconfig,
  callback = function(ev)
    if ev.file == "qf" then
      vim.api.nvim_buf_set_keymap(0, 'n', 'q', '<cmd>quit<cr>', { noremap = true, silent = true })
    end
  end
})

--------------------------------------------------------------------------------
---                           CUSTOM KEYMAPS
--------------------------------------------------------------------------------

-- LEADER
vim.g.mapleader = " "

------------------------------------- NORMAL ----------------------------------

-- QUIT
vim.keymap.set("n", "<leader>qq", "<cmd>qa!<cr>", { desc = "Quit" })
vim.keymap.set("", "<c-z>", "")

-- EDIT
vim.keymap.set("n", "gh", "0", { desc = "Start of the line"})
vim.keymap.set("n", "gl", "$", { desc = "End of the line"})

-- PROJECT

-- EXPLORER

-- DIAGNOSTICS

-- VARIOUS
vim.keymap.set("n", "<C-s>", "<cmd>w<cr>", {})
vim.keymap.set("n", "<C-g>", "<Escape>", {})
vim.keymap.set("n", "U", ":redo<cr>", {})
vim.keymap.set("n", "<tab>", "==", {})
vim.keymap.set("n", "<leader><leader>", ":", { desc = "Command mode" })
vim.keymap.set("n", "<leader>'", ":make ", { desc = "Shell command" })
vim.keymap.set("n", "<C-'>", ":make ", { desc = "Shell command" })

--  WINDOWS
vim.keymap.set('n', '<m-ScrollWheelUp>', 'zhzh', { desc = "" })
vim.keymap.set('n', '<m-ScrollWheelDown>', 'zlzl', { desc = "" })
vim.keymap.set("n", "<C-Up>", ":resize +2<cr>", { desc = "" })
vim.keymap.set("n", "<C-Down>", ":resize -2<cr>", { desc = "" })
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<cr>", { desc = "" })
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<cr>", { desc = "" })

-- BUFFERS
vim.keymap.set("n", "<S-l>", ":bnext<cr>", { desc = "" })
vim.keymap.set("n", "<S-h>", ":bprevious<cr>", { desc = "" })
vim.keymap.set("n", "<leader>bf", "<cmd>:lua require('core.utils').format_buffer()<cr>", { desc = "Format" })
vim.keymap.set("n", "<leader>bd", "<cmd>:lua require('core.utils').delete_buffer()<cr>", { desc = "Delete" })

-- SEARCHING
vim.keymap.set('n', '<leader>ff', ':find ', { desc = 'Find file' })
vim.keymap.set('n', '<leader>fh', '<cmd>nohl<cr>', { desc = 'highlight off' })

-- APPEARENCE

-- SOME EMACSY keymaps
--  <C-g> as Escape
vim.keymap.set("n", "<C-g>", "<Escape>", {})
vim.keymap.set("n", "<M-x>", ":lua ", {})

-- tab management
vim.keymap.set("n", "<C-c>tn", "<cmd>:tabnew<cr>", {})
vim.keymap.set("n", "<C-c>t0", "<cmd>:tabclose<cr>", {})

-- ------------------------------------- INSERT ----------------------------------

-- dumb autopair
vim.keymap.set("i", "(", "()<esc>i", {})
vim.keymap.set("i", "[", "[]<esc>i", {})
vim.keymap.set("i", "{", "{}<esc>i", {})
vim.keymap.set("i", '"', '""<esc>i', {})

--  <C-g> as Escape
vim.keymap.set("i", "<C-g>", "<Escape>", {})
vim.keymap.set("i", "<C-ì>", "<C-k>'?", {})
vim.keymap.set("i", "<C-'>", "<C-k>'!", {})
vim.keymap.set("i", "<s-cr>", "<c-o>O", {})
vim.keymap.set("i", "<c-cr>", "<c-o>o", {})

-- ------------------------------------- VISUAL ----------------------------------

--  <C-g> as Escape
vim.keymap.set("x", "<C-g>", "<Escape>", {})

-- Moving text
vim.keymap.set("x", "<A-j>", ":m .+1<CR>==", {})
vim.keymap.set("x", "<A-k>", ":m .-2<CR>==", {})
vim.keymap.set("x", "p", '"_dP', {})

-- Surrounding selected text
vim.cmd ':vnoremap s <Nop>'
vim.keymap.set("x", "s(", '"9xi()<escape>h"9p', {})
vim.keymap.set("x", "s)", '"9xi()<escape>h"9p', {})
vim.keymap.set("x", "s[", '"9xi[]<escape>h"9p', {})
vim.keymap.set("x", "s]", '"9xi[]<escape>h"9p', {})
vim.keymap.set("x", "sc", '"9xi{}<escape>h"9p', {})
vim.keymap.set("x", "s'", "\"9xi''<escape>h\"9p", {})
vim.keymap.set("x", 's"', '"9xi""<escape>h"9p', {})

-- Moving text
vim.keymap.set("x", "J", ":move '>+1<CR>gv-gv", {})
vim.keymap.set("x", "K", ":move '<-2<CR>gv-gv", {})
vim.keymap.set("x", "<A-j>", ":move '>+1<CR>gv-gv", {})
vim.keymap.set("x", "<A-k>", ":move '<-2<CR>gv-gv", {})

-- Indenting
vim.keymap.set("x", "<tab>", "=", {})

-- Eval region
vim.keymap.set("x", "g,", "<cmd>lua LM.utils.eval_region()<cr>", {})

------------------------------   COMMAND LINE ---------------------------------

--  <C-g> as Escape
vim.keymap.set("c", "<C-g>", "<Escape>", {})

vim.keymap.set("c", "<C-ì>", "<C-k>'?", {})
vim.keymap.set("c", "<C-'>", "<C-k>'!", {})


------------------------------------- TERMINAL --------------------------------

vim.keymap.set("t", "<Escape>", "<C-\\><C-n>", {})

vim.keymap.set("t", "<C-h>", "<C-\\><C-N><C-w>h", {})
vim.keymap.set("t", "<C-j>", "<C-\\><C-N><C-w>j", {})
vim.keymap.set("t", "<C-k>", "<C-\\><C-N><C-w>k", {})
vim.keymap.set("t", "<C-l>", "<C-\\><C-N><C-w>l", {})

-- italian keyboard utility
vim.keymap.set('t', '<c-ì>', '~', {})
vim.keymap.set('t', '<c-\'>', '`', {})

--------------------------------------------------------------------------------
---                        APPEARENCE SETTINGS
--------------------------------------------------------------------------------

vim.api.nvim_create_autocmd({ "ColorScheme" }, {
  group = LM.augroups.colorscheme,
  callback = function(_)
    -- restore termguicolors for some colorschemes
    vim.opt.termguicolors = true
    -- italic comments
    vim.cmd "highlight Comment cterm=italic gui=italic"
    -- nice windows separator
    vim.cmd "highlight WinSeparator guibg=None"
    vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })

    -- fix some highlights for some colorschemes
    if vim.g.colors_name == "default" or vim.g.colors_name == "zaibatsu" then
      if vim.fn.has("nvim-0.9") == 1 then
        vim.cmd 'hi! link Pmenu Title'
        vim.cmd 'hi! link SignColumn Normal'
      end
    end
  end,
})

--------------------------------------------------------------------------------
---                             PLUGINS
--------------------------------------------------------------------------------

if LM.lazy_loaded == nil then
  -- Bootstrap lazy.nvim
  local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
  if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
      vim.api.nvim_echo({
        { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
        { out, "WarningMsg" },
        { "\nPress any key to exit..." },
      }, true, {})
      vim.fn.getchar()
      os.exit(1)
    end
  end
  vim.opt.rtp:prepend(lazypath)
  LM.lazy_loaded = true

  -- Setup lazy.nvim
  require("lazy").setup({
    spec = {
      -- nvim-lspconfig
      {
        "https://github.com/neovim/nvim-lspconfig",
        event = { "BufReadPost", "BufNewFile", "BufWritePre" },
      },

      -- nvim-treesitter
      {
        "nvim-treesitter/nvim-treesitter",
        branch = 'master',
        lazy = true,
        build = ":TSUpdate",
        event = {"BufRead"},
      },

      -- mini.nvim
      {
        'echasnovski/mini.nvim',
        version = '*',
        enabled = true,
        config = function() 
          require('mini.fuzzy').setup()
          require('mini.notify').setup()
          require('mini.icons').setup()

          require('mini.completion').setup()

          require('mini.pick').setup() 
          vim.api.nvim_create_autocmd({'ColorScheme', 'VimEnter'}, {
            group = LM.augroups.colorscheme,
            callback = function()
              vim.cmd "hi! link MiniPickNormal Pmenu"
              vim.cmd "hi! link MiniPickMatchCurrent PmenuSel"
            end,
          })
          vim.keymap.set('n', '<leader>ff', MiniPick.builtin.files, {desc = 'find file'})

          local miniclue = require('mini.clue')
          miniclue.setup({
            triggers = {
              -- Leader triggers
              { mode = 'n', keys = '<Leader>' },
              { mode = 'x', keys = '<Leader>' },

              -- Built-in completion
              { mode = 'i', keys = '<C-x>' },

              -- `g` key
              { mode = 'n', keys = 'g' },
              { mode = 'x', keys = 'g' },

              -- Marks
              { mode = 'n', keys = "'" },
              { mode = 'n', keys = '`' },
              { mode = 'x', keys = "'" },
              { mode = 'x', keys = '`' },

              -- Registers
              { mode = 'n', keys = '"' },
              { mode = 'x', keys = '"' },
              { mode = 'i', keys = '<C-r>' },
              { mode = 'c', keys = '<C-r>' },

              -- Window commands
              { mode = 'n', keys = '<C-w>' },

              -- `z` key
              { mode = 'n', keys = 'z' },
              { mode = 'x', keys = 'z' },
            },

            clues = {
              -- Enhance this by adding descriptions for <Leader> mapping groups
              miniclue.gen_clues.builtin_completion(),
              miniclue.gen_clues.g(),
              miniclue.gen_clues.marks(),
              miniclue.gen_clues.registers(),
              miniclue.gen_clues.windows(),
              miniclue.gen_clues.z(),
              { mode = 'n', keys = '<Leader>b', desc = '+Buffers' },
              { mode = 'n', keys = '<Leader>f', desc = '+Find' },
              { mode = 'n', keys = '<Leader>p', desc = '+Project' },
              { mode = 'n', keys = '<Leader>q', desc = '+Quit' },
            },
            window = {
              config = {
                width = 'auto'
              }
            },
          })
        end
      },
    },
    checker = { enabled = false },
  })
end

--------------------------------------------------------------------------------
---                           LOAD CUSTOM FILE
--------------------------------------------------------------------------------

load_custom_file()
