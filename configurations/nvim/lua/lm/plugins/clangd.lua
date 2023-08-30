return {
  'p00f/clangd_extensions.nvim',
  dependencies = {
    { 'neovim/nvim-lspconfig' },
  },
  ft = { 'c', 'cpp' },
  config = function()
    -- require('clangd_extensions').setup {
    --   inlay_hints = {
    --     inline = true,
    --   }
    -- }
    local on_attach = function(client, bufnr)
      require('clangd_extensions.inlay_hints').setup_autocmd()
      require('clangd_extensions.inlay_hints').set_inlay_hints()
    end
    LM.lsp.on_attach.c = on_attach
    LM.lsp.on_attach.cpp = on_attach
  end
}
