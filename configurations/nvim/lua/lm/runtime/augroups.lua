LM.augroups = {
  colorscheme = vim.api.nvim_create_augroup("Colorscheme", {
    clear = true,
  }),
  chdir = vim.api.nvim_create_augroup("ChDir", {
    clear = true,
  }),
  gui = vim.api.nvim_create_augroup("Gui", {
    clear = true,
  }),
  lsp_menu = vim.api.nvim_create_augroup("LspMenu", {
    clear = true,
  }),
}
