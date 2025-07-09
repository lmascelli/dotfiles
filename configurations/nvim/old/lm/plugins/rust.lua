local rust_tools = {
  'simrat39/rust-tools.nvim',
  ft = 'rust',
  dependencies = {
    { 'neovim/nvim-lspconfig' },
  },
  config = function()
    local rt = require('rust-tools')
    rt.setup {
      tools = {
        hover_actions = {
          auto_focus = true,
        },
      },
      server = {
        on_attach = function(_, bufnr)
          vim.keymap.set("n", "<leader>lk", rt.hover_actions.hover_actions,
            { buffer = bufnr, desc = "Documentation (RT)" })
          vim.keymap.set("n", "<leader>la", rt.code_action_group.code_action_group,
            { buffer = bufnr, desc = "Code action (RT)" })
          vim.keymap.set('n', '<leader>lf', '<cmd>lua vim.lsp.buf.format({async=true})<cr>',
            { buffer = bufnr, desc = "Format" })
          vim.keymap.set('n', '<leader>ldd', '<cmd>lua vim.diagnostic.open_float(nil, {focus=true})<cr>',
            { buffer = bufnr, desc = "Show hover" })
        end
      },
    }
  end
}

local rustaceanvim = {
  'mrcjkb/rustaceanvim',
  version = '^3', -- Recommended
  ft = { 'rust' },
  init = function()
    LM.rustaceanvim = true
  end,
  config = function()
    vim.g.rustaceanvim = {
      -- Plugin configuration
      tools = {
      },
      -- LSP configuration
      server = {
        on_attach = function(client, bufnr)
          -- you can also put keymaps in here
          vim.keymap.set("n", "<leader>lk", "<cmd>RustLsp hover actions<cr>",
            { buffer = bufnr, desc = "Documentation (RT)" })
          vim.keymap.set("n", "<leader>la", "<cmd>RustLsp codeAction<cr>",
            { buffer = bufnr, desc = "Code action (RT)" })
          vim.keymap.set('n', '<leader>lf', '<cmd>lua vim.lsp.buf.format({async=true})<cr>',
            { buffer = bufnr, desc = "Format" })
          vim.keymap.set('n', '<leader>ldd', '<cmd>lua vim.diagnostic.open_float(nil, {focus=true})<cr>',
            { buffer = bufnr, desc = "Show hover" })
        end,
        settings = {
          -- rust-analyzer language server configuration
          ['rust-analyzer'] = {
            capabilities = {
              textDocument = {
                completion = {
                  completionItem = {
                    snippetSupport = false
                  },
                },
              },
            },
            checkOnSave = { command = 'clippy' },
          },
        },
      },
      -- DAP configuration
      dap = {
      },
    }
  end
}

-- local crates = {
--   'saecki/crates.nvim',
--   dependencies = {
--     'nvim-lua/plenary.nvim'
--   }
--   tag = 'stable',
--   config = function()
--     require('crates').setup()
--   end,
-- }

return rustaceanvim

-- return { rustaceanvim, crates }
