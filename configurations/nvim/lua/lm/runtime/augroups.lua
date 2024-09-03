LM.augroups = {
  colorscheme = vim.api.nvim_create_augroup("LMColorscheme", {
    clear = true,
  }),
  chdir = vim.api.nvim_create_augroup("LMChDir", {
    clear = true,
  }),
  gui = vim.api.nvim_create_augroup("LMGui", {
    clear = true,
  }),
  lsp_menu = vim.api.nvim_create_augroup("LMLspMenu", {
    clear = true,
  }),
  lsp = vim.api.nvim_create_augroup("LMLspStart", {
    clear = true
  }),
}
