LM.plugins.with_lsp = true

return {
  {
    'neovim/nvim-lspconfig',
    lazy = true,
    event = { "BufReadPost", "BufNewFile", "BufWritePre" },
    init = function()
      local setup_server = function(server, opts)
        local lspconfig = require('lspconfig')
        if opts == nil then
          opts = {}
        end
        opts.on_attach = opts.on_attach or LM.lsp.on_attach.on_attach
        opts.capabilities = opts.capabilities or LM.lsp.capabilities
        lspconfig[server].setup(opts)
      end

      LM.lsp.setup_server = setup_server
    end,
  },
}
