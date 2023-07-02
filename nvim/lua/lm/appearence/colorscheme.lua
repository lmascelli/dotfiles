local custom = LM.config

-- italic font for comments
vim.api.nvim_create_autocmd("Colorscheme", {
  callback = function()
    print 'AAA'
    vim.cmd "highlight Comment cterm=italic gui=italic"
    vim.cmd "highlight WinSeparator guibg=None"
  end
})

local open_time = os.date("*t", os.time())

LM.appearence = {
  list_colorschemes = function()
    list_colors_keys = vim.api.nvim_replace_termcodes(
      '<esc>:colorscheme \t\b', true, false, true)
    vim.api.nvim_feedkeys(list_colors_keys, 'n', false)
  end
}

LM.appearence.dynamic_background = function()
  if (open_time.hour >= 9 and open_time.hour < 19) then
    vim.opt.background = "light"
  else
    vim.opt.background = "dark"
  end
end

if custom then
  local colorscheme = custom.colorscheme
  local os = require 'os'

  local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
  if not status_ok then
    vim.notify("colorscheme " .. colorscheme .. " not found")
    return
  end
end
