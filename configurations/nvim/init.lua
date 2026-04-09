-------------------------------------------------------------------------------
---                                                                         ---
---                                  PRELUDE                                ---
---                                                                         ---
-------------------------------------------------------------------------------
if vim.fn.has('nvim-0.9') == 1 then
  vim.loader.enable({
   enable = true
  })
end

-- global map
LM = {
    fn = {},
    augroups = {
        lspconfig = vim.api.nvim_create_augroup('LMLspConfig', {
          clear = true,
        }),
        colorscheme = vim.api.nvim_create_augroup('LMColorScheme', {
          clear = true,
        }),
    },
}


-------------------------------------------------------------------------------
---                                                                         ---
---                                  SETTINGS                               ---
---                                                                         ---
-------------------------------------------------------------------------------
-- enable the new message ui
require('vim._core.ui2').enable()

--- tabs
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

--- searching
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- junk files
vim.opt.undofile = true

-- clipboard
vim.opt.clipboard = 'unnamedplus'

-- line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- behaviour
vim.opt.exrc = true
vim.opt.mouse = 'a'
vim.opt.virtualedit = "onemore" -- let the cursor go one char after the end of the line

-- completion
vim.opt.pumheight = 10
vim.opt.updatetime = 100     -- for faster completion
vim.opt.completeopt = { "menu", "menuone", "noselect" }
if vim.fn.has('nvim-0.11') == 1 then
  vim.opt.completeopt:append('fuzzy') -- Use fuzzy matching for built-in completion
end

--- file encoding
vim.opt.fileencoding = 'utf-8'


-------------------------------------------------------------------------------
---                                                                         ---
---                                   KEYMAPS                               ---
---                                                                         ---
-------------------------------------------------------------------------------
vim.keymap.set("n", "<Space>", "<Nop>", { silent = true })
vim.g.mapleader = " "

-- NORMAL MODE
vim.keymap.set("n", "U", ":redo<CR>", {})
vim.keymap.set("n", "<TAB>", "==", {})
vim.keymap.set("n", "<S-h>", ":bprevious<CR>", {})
vim.keymap.set("n", "<S-l>", ":bnext<CR>", {})

-- INSERT MODE
vim.keymap.set("i", "jj", "<Esc>", {})

-- VISUAL
vim.keymap.set("x", "<TAB>", "=", {})

-- TERMINAL
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", {})


-------------------------------------------------------------------------------
---                                                                         ---
---                                   UTILS                                 ---
---                                                                         ---
-------------------------------------------------------------------------------
LM.fn.load_custom_file = function()
    -- check if there is a global custom config file that can hold
    -- different configuration from system to system. if not create
    -- a default one
    local custom_file = vim.fn.stdpath('config') .. '/custom.lua'
    if vim.fn.filereadable(custom_file) ~= 0 then
        local res, error = pcall(dofile, custom_file)
        if not res then
            vim.notify("ERROR loading custom.lua")
            vim.notify(error)
        end
    else
        vim.fn.writefile(
            vim.fn.readfile(vim.fn.stdpath('config') .. '/custom_template.lua'),
            vim.fn.stdpath('config') .. '/custom.lua'
        )
    end
end

LM.fn.install_plugin = function(plugin_name, load_fn)
    vim.pack.add({plugin_name})
    load_fn()
end

LM.fn.toggle_theme = function()
  if vim.opt.background == "dark" then
    vim.opt.background = "light"
  else
    vim.opt.background = "dark"
  end
end

-- open configuration directory
LM.fn.edit_conf_dir = function(open_explorer)
  vim.fn.chdir(vim.fn.stdpath 'config')
  if open_explorer then
    LM.fn.toggle_explorer()
  end
end

-- open custom.lua configuration file
LM.fn.edit_custom_config = function()
  local command = 'e ' .. vim.fn.stdpath('config') .. '/custom.lua'
  vim.cmd(command)
end

LM.fn.format_buffer = function()
  local curpos = vim.fn.getcurpos()
  vim.api.nvim_feedkeys('gg=G', 'n', false)
  for k, v in ipairs(curpos) do print(k, v) end
  vim.fn.cursor(curpos[2], curpos[3])
end

LM.fn.delete_buffer = function()
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
LM.fn.spawn_terminal = function()
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
          job = 'cmd /C start pwsh'
        else
          job = 'cmd /C start powershell'
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


-------------------------------------------------------------------------------
---                                                                         ---
---                                   COMMANDS                              ---
---                                                                         ---
-------------------------------------------------------------------------------
vim.api.nvim_create_user_command("LMOpenConfig", LM.fn.edit_custom_config, {desc = "Open custom.lua configuration file"})
vim.api.nvim_create_user_command("LMOpenConfigDir", function() LM.fn.edit_conf_dir(true) end, {desc = "Open the nvim configuration directory"})
vim.api.nvim_create_user_command("LMBdelete", function() LM.fn.delete_buffer(true) end, {desc = "Delete the current buffer"})
vim.cmd 'cnoremap bd LMBdelete'
vim.api.nvim_create_user_command("LMTerm", LM.fn.spawn_terminal, {desc = "Spawn an external terminal"})


-------------------------------------------------------------------------------
---                                                                         ---
---                                APPEARENCE                               ---
---                                                                         ---
-------------------------------------------------------------------------------
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
  end,
})


-------------------------------------------------------------------------------
---                                                                         ---
---                                     LSP                                 ---
---                                                                         ---
-------------------------------------------------------------------------------
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


-------------------------------------------------------------------------------
---                                                                         ---
---                                POST INIT                                ---
---                                                                         ---
-------------------------------------------------------------------------------
LM.fn.load_custom_file()
