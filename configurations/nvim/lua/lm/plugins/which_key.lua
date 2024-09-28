LM.with_which_key = true

return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
  config = function()
    local wk = require("which-key")

    wk.setup {
      plugins = {
        marks = true,     -- shows a list of your marks on ' and `
        registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        -- the presets plugin, adds help for a bunch of default keybindings in Neovim
        -- No actual key bindings are created
        spelling = {
          enabled = true,   -- enabling this will show WhichKey when pressing z= to select spelling suggestions
          suggestions = 20, -- how many suggestions should be shown in the list?
        },
        presets = {
          operators = true,    -- adds help for operators like d, y, ...
          motions = true,      -- adds help for motions
          text_objects = true, -- help for text objects triggered after entering an operator
          windows = true,      -- default bindings on <c-w>
          nav = true,          -- misc bindings to work with windows
          z = true,            -- bindings for folds, spelling and others prefixed with z
          g = true,            -- bindings for prefixed with g
        },
      },
      -- add operators that will trigger motion and text object completion
      -- to enable all native operators, set the preset / operators plugin above
      icons = {
        breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
        separator = "➜", -- symbol used between a key and it's label
        group = "+", -- symbol prepended to a group
      },
      keys = {
        scroll_down = "<c-d>", -- binding to scroll down inside the popup
        scroll_up = "<c-u>", -- binding to scroll up inside the popup
      },
      win = {
        -- don't allow the popup to overlap with the cursor
        no_overlap = true,
        -- width = 1,
        -- height = { min = 4, max = 25 },
        -- col = 0,
        -- row = math.huge,
        -- border = "none",
        padding = { 1, 2 }, -- extra window padding [top/bottom, right/left]
        title = true,
        title_pos = "center",
        zindex = 1000,
        -- Additional vim.wo and vim.bo options
        bo = {},
        wo = {
          -- winblend = 10, -- value between 0-100 0 for fully opaque and 100 for fully transparent
        },
      },
      layout = {
        height = { min = 4, max = 25 }, -- min and max height of the columns
        width = { min = 20, max = 50 }, -- min and max width of the columns
        spacing = 3,                    -- spacing between columns
        align = "left",                 -- align columns left, center or right
      },
      show_help = true,                 -- show a help message in the command line for using WhichKey
      show_keys = true,                 -- show the currently pressed key and its label as a message in the command line
      -- list of triggers, where WhichKey should not wait for timeoutlen and show immediately
      -- disable the WhichKey popup for certain buf types and file types.
      -- Disabled by default for Telescope
      disable = {
        buftypes = {},
        filetypes = {},
      },
    }

    vim.cmd 'hi! link WhichKey Normal'
    vim.cmd 'hi! link WhichKeyGroup Normal'
    vim.cmd 'hi! link WhichKeySeparator Normal'
    vim.cmd 'hi! link WhichKeyDesc Normal'
    vim.cmd 'hi! link WhichKeyBorder Normal'
    vim.cmd 'hi! link WhichKeyFloat Normal'

    -- wk.register({
    --   q = { name = 'Quit' },
    --   a = { name = 'Appearence' },
    --   c = { name = 'Configuration' },
    --   d = { name = 'Diagnostics' },
    --   p = { name = 'Project' },
    --   w = { name = 'Window' },
    --   t = { name = 'Tab' },
    --   b = { name = 'Buffer' },
    --   f = { name = 'Find' },
    --   l = {
    --     name = 'Lsp',
    --     g = { name = 'Go To' },
    --     d = { name = 'Diagnostics' },
    --   },
    -- }, { prefix = "<leader>" })
    wk.add({
      { "<leader>a",  group = "Appearence" },
      { "<leader>b",  group = "Buffer" },
      { "<leader>c",  group = "Configuration" },
      { "<leader>d",  group = "Diagnostics" },
      { "<leader>f",  group = "Find" },
      { "<leader>l",  group = "Lsp" },
      { "<leader>ld", group = "Diagnostics" },
      { "<leader>lg", group = "Go To" },
      { "<leader>p",  group = "Project" },
      { "<leader>q",  group = "Quit" },
      { "<leader>t",  group = "Tab" },
      { "<leader>w",  group = "Window" },
    })
  end
}
