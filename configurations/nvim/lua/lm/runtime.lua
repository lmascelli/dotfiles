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
  },
  appearence = {
    colorscheme = 'default',
    transparency = false,
    toggle_transparency = function()
      if LM.appearence.transparency then
        vim.cmd('colorscheme ' .. LM.appearence.colorscheme)
        LM.appearence.transparency = false
      else
        vim.cmd 'hi Normal guibg=NONE ctermbg=NONE'
        vim.cmd 'hi EndOfBuffer guibg=NONE ctermbg=NONE'
        LM.appearence.transparency = true
      end
    end
  },
}
