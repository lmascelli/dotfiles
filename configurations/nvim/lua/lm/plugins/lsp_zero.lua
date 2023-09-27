return {
  'VonHeikemen/lsp-zero.nvim',
  event = 'VeryLazy',
  branch = 'v3.x',
  dependencies = {
    -- LSP Support
    { 'neovim/nvim-lspconfig' }, -- Required
    {                            -- Optional
      'williamboman/mason.nvim',
      build = function()
        pcall(vim.cmd, 'MasonUpdate')
      end,
    },
    { 'williamboman/mason-lspconfig.nvim' }, -- Optional

    -- Autocompletion
    { 'hrsh7th/nvim-cmp' },                    -- Required
    { 'hrsh7th/cmp-nvim-lsp' },                -- Required
    { 'L3MON4D3/LuaSnip' },                    -- Required
    { 'hrsh7th/cmp-nvim-lsp-signature-help' }, -- Required
  },
  config = function()
    local lsp = require('lsp-zero')

    local cmp = require('cmp')
    --    local cmp_select_opts = { behavior = cmp.SelectBehavior.Select }
    local cmp_action = lsp.cmp_action()
    require('luasnip.loaders.from_vscode').lazy_load()
    cmp.setup({
      preselect = 'item',
      completion = {
        completeopt = 'menu,menuone,noinsert'
      },
      mapping = {
        ['<CR>'] = cmp.mapping.confirm({ select = false }),
        ['<C-f>'] = cmp_action.luasnip_jump_forward(),
        ['<C-b>'] = cmp_action.luasnip_jump_backward(),
      },
      sources = {
        { name = 'nvim_lsp' },
        { name = 'buffer' },
        { name = 'luasnip' },
        { name = 'nvim_lsp_signature_help' },
      },
    })
    LM.api.complete = function()
      cmp.complete()
    end

    lsp.on_attach(function(client, bufnr)
      -- see :help lsp-zero-keybindings
      -- to learn the available actions
      -- lsp.default_keymaps({buffer = bufnr})
      vim.keymap.set('n', '<leader>lK', '<cmd>lua vim.lsp.buf.hover()<cr>', { desc = "Documentation" })
      vim.keymap.set('n', '<leader>lgd', '<cmd>lua vim.lsp.buf.definition()<cr>', { desc = "Definition" })
      vim.keymap.set('n', '<leader>lgD', '<cmd>lua vim.lsp.buf.declaration()<cr>', { desc = "Declaration" })
      vim.keymap.set('n', '<leader>lgi', '<cmd>lua vim.lsp.buf.implementation()<cr>', { desc = "Implementation" })
      vim.keymap.set('n', '<leader>lgo', '<cmd>lua vim.lsp.buf.type_definition()()<cr>', { desc = "Type definition" })
      vim.keymap.set('n', '<leader>lgr', '<cmd>lua vim.lsp.buf.references()<cr>', { desc = "References" })
      vim.keymap.set('n', '<leader>lgs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', { desc = "Signature" })
      vim.keymap.set('i', '<c-l>', '<cmd>lua vim.lsp.buf.signature_help()<cr>', { desc = "Signature" })
      vim.keymap.set('n', '<leader>lr', '<cmd>lua vim.lsp.buf.rename()<cr>', { desc = "Rename" })
      vim.keymap.set('n', '<leader>lf', '<cmd>lua vim.lsp.buf.format({async=true})<cr>', { desc = "Format" })
      vim.keymap.set('n', '<leader>la', '<cmd>lua vim.lsp.buf.code_action()<cr>', { desc = "Code action" })
      vim.keymap.set('n', '<leader>ldl', '<cmd>lua vim.diagnostic.setloclist()<cr>', { desc = "Show diagnostics" })
      vim.keymap.set('n', '<leader>ldp', '<cmd>lua vim.diagnostic.goto_prev()<cr>', { desc = "Previous diagnostic" })
      vim.keymap.set('n', '<leader>ldn', '<cmd>lua vim.diagnostic.goto_next()<cr>', { desc = "Next diagnostic" })

      LM.lsp.get_on_attach(vim.bo.filetype)(client, bufnr)
    end)

    lsp.set_sign_icons({
      error = '✘',
      warn = '▲',
      hint = '⚑',
      info = '»'
    })

    local lspconfig = require('lspconfig')
    LM.lsp.capabilities = lsp.get_capabilities()

    require('mason').setup({})
    require('mason-lspconfig').setup({
      handlers = {
        lsp.default_setup,
      }
    })

    -- (Optional) Configure lua language server for neovim
    lspconfig.lua_ls.setup(lsp.nvim_lua_ls())
    lspconfig.clangd.setup({
      cmd = {
        "clangd",
        "--background-index",
        "-j=12",
        "--query-driver=" .. LM.lsp.c_query_driver,
        "--clang-tidy",
        "--clang-tidy-checks=*",
        "--all-scopes-completion",
        "--cross-file-rename",
        "--completion-style=detailed",
        "--header-insertion-decorators",
        "--header-insertion=iwyu",
        "--pch-storage=memory",
      },
      capabilities = LM.lsp.capabilities,
      init_options = {
        clangdFileStatus = true, -- Provides information about activity on clangd’s per-file worker thread
        usePlaceholders = true,
        completeUnimported = true,
        semanticHighlighting = true,
      },
    })
    lspconfig.pylsp.setup({})
    -- to install also mypy run ':PylspInstall pyls-flake8 pylsp-mypy pyls-isort'
    lspconfig.powershell_es.setup({})
  end
}
