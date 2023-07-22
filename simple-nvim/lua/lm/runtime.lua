LM = {
  font = {
    font_name = '',
    font_size = 10,
  },
  augroups = {
    colorscheme = vim.api.nvim_create_augroup("Colorscheme", {
      clear = true,
    }),
    gui = vim.api.nvim_create_augroup("Gui", {
      clear = true,
    })
  }
}
