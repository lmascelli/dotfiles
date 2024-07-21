LM.local_plugins.lsp_config = {
  install = function ()
    if LM.api.project.chech_local_nvim() then
      print "Installing lsp_config locally"
      return LM.api.project.install_local_git_plugin('https://github.com/neovim/nvim-lspconfig')
    else
      print "No local configuration"
      return false
    end
  end,

  config = function ()
    vim.cmd 'packadd nvim-lspconfig'

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
  end
}
