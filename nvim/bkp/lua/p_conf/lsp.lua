local install = function()
  local packer = require 'packer'
  packer.use { 'williamboman/nvim-lsp-installer',
    { 'neovim/nvim-lspconfig',
      config = function()
      end,
    },
    'p00f/clangd_extensions.nvim',
  }
end

local config = function()
  local path = require "nvim-lsp-installer.core.path"
  local lsp_config = require 'lspconfig'
  require 'nvim-lsp-installer'.setup {}
  vim.g.lsp_path = path.concat { vim.fn.stdpath "data", "lsp_servers" }

  -- KEYBINDINGS

  local on_attach
  if vim.g.whichkey then
    local wk = require 'which-key'
    on_attach = function(client, bufnr)
      local opts = { noremap = true, silent = true }
      vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
      vim.api.nvim_buf_set_keymap(bufnr, 'i', '<c-l>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
      wk.register {
        ["<leader>"] = {
          l = {
            name = '+lsp',
            f = { '<cmd>lua vim.lsp.buf.formatting {async = true}<cr>', 'Format buffer' },
            d = {
              name = "+diagnostics",
              e = { '<cmd>lua vim.diagnostic.open_float()<cr>', 'Diagnostics' },
              n = { '<cmd>lua vim.diagnostic.goto_next()<cr>', 'Next problem' },
              p = { '<cmd>lua vim.diagnostic.goto_previous()<cr>', 'Previous problem' },
              l = { '<cmd>lua vim.diagnostic.setloclist()<cr>', 'Set loc list' },
            },
            K = { '<cmd>lua vim.lsp.buf.hover()<cr>', 'Documentation' },
            k = { '<cmd>lua vim.lsp.buf.signature_help()<cr>', 'Signature help' },
            D = { '<cmd>lua vim.lsp.buf.type_definition()<cr>', 'Type definition' },
            ["ql"] = { '<cmd>lua vim.lsp.buf.code_action()<cr>', 'Code actions' },
            ["rn"] = { '<cmd>lua vim.lsp.buf.rename()<cr>', 'Refactor' },
            ["ca"] = { '<cmd>lua vim.lsp.buf.code_action()<cr>', 'Code actions' },
            w = {
              name = "+workspace",
              a = { '<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>', 'Add workspace folder' },
              r = { '<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>', 'Remove workspace folder' },
              l = { '<cmd>lua vim.lsp.buf.list_workspace_folders()<cr>', 'List workspace folder' },
            },
            g = {
              name = "+Go to",
              d = { '<cmd>lua vim.lsp.buf.definition()<cr>', 'Definition' },
              D = { '<cmd>lua vim.lsp.buf.declaration()<cr>', 'Declaration' },
              i = { '<cmd>lua vim.lsp.buf.implementation()<cr>', 'Implementation' },
              r = { '<cmd>lua vim.lsp.buf.references()<cr>', 'References' },
            }
          }
        }
      }
    end
  else
    local opts = { noremap = true, silent = true }
    vim.api.nvim_set_keymap('n', '<leader>le', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
    vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
    vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
    vim.api.nvim_set_keymap('n', '<leader>ql', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

    -- Use an on_attach function to only map the following keys
    -- after the language server attaches to the current buffer
    on_attach = function(client, bufnr)
      -- Enable completion triggered by <c-x><c-o>
      vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

      -- Mappings.
      -- See `:help vim.lsp.*` for documentation on any of the below functions
      vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>k', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'i', '<c-l>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lwa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lwr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lwl',
        '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
    end
  end

  local lsputil = lsp_config.util

  lsp_config.util.default_config = vim.tbl_extend(
    "force",
    lsp_config.util.default_config,
    {
      on_attach = on_attach
    }
  )

  lsp_config.sumneko_lua.setup {
    settings = {
      Lua = {
        runtime = {
          version = 'LuaJIT',
        },
        diagnostics = {
          globals = { 'vim' },
        },
        workspace = {
          library = vim.api.nvim_get_runtime_file("", true),
        },
        telemetry = {
          enable = false,
        }
      }
    }
  }

  require 'clangd_extensions'.setup {
    server = {
      on_attach = function(client, bufnr)
        on_attach(client, bufnr)
        if vim.g.whichkey then
          local wk = require 'which-key'
          wk.register {
            ["<leader>lh"] = { "<cmd>ClangdSwitchSourceHeader<cr>", "Switch Source-Header" },
          }
        end
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

  local function get_python_venv()
    if vim.env.VIRTUAL_ENV then return vim.env.VIRTUAL_ENV end
    local match = vim.fn.glob(lsputil.path.join(vim.fn.getcwd(), 'Pipfile'))
    if match ~= '' then return vim.fn.trim(vim.fn.system(
        'PIPENV_PIPFILE=' .. match .. ' pipenv --venv'))
    end
    match = vim.fn.glob(lsputil.path.join(vim.fn.getcwd(), 'poetry.lock'))
    if match ~= '' then return vim.fn.trim(vim.fn.system('poetry env info -p')) end
  end

  lsp_config.pylsp.setup {
    cmd = { "pylsp", "-v" },
    cmd_env = { VIRTUAL_ENV = get_python_venv(),
      PATH = lsputil.path.join(get_python_venv(), 'bin') .. ':' .. vim.env.PATH,
    }
  }

  lsp_config.powershell_es.setup {
    on_attach = on_attach,
    bundle_path = vim.g.lsp_path .. '/PowerShellEditorServices',
    shell = 'pwsh',
  }

  --[[ lsp_config.dartls.setup {
    on_attach = on_attach,
  } ]]
end

return {
  install = install,
  config = config,
}
