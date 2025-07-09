LM.augroups = {
  colorscheme = vim.api.nvim_create_augroup("LMColorscheme", {
    clear = true,
  }),
  chdir = vim.api.nvim_create_augroup("LMChDir", {
    clear = true,
  }),
  lspconfig = vim.api.nvim_create_augroup('UserLspConfig', {}),
}
