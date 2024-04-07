LM.plugins.with_lsp = true

return {
  {
    'williamboman/mason.nvim',
    cmd = { "Mason", "MasonInstall", "MasonUninstall", "MasonUninstallAll", "MasonLog" },
    lazy = true,
    build = function()
      pcall(vim.cmd, 'MasonUpdate')
    end,
  },
  {
    'williamboman/mason-lspconfig.nvim',
    dependencies = {
      'williamboman/mason.nvim',
      'neovim/nvim-lspconfig',
    },
    cmd = { "LspInstall", "LspUninstall"},
    event = { "BufReadPost", "BufNewFile", "BufWritePre" },
    lazy = true,
    config = function()
      require('mason').setup()
      require('mason-lspconfig').setup({
        automatic_installation = true,
      })
    end
  }
}
