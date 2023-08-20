LM.api.list_colorschemes = function()
  local list_colors_keys = vim.api.nvim_replace_termcodes(
    '<esc>:colorscheme \t\b', true, false, true)
  vim.api.nvim_feedkeys(list_colors_keys, 'n', false)
end

LM.api.dynamic_background = function()
  local open_time = os.date("*t", os.time())
  if (open_time.hour >= 9 and open_time.hour < 19) then
    vim.opt.background = "light"
  else
    vim.opt.background = "dark"
  end
end

LM.api.load_colorscheme = function()
  if LM.custom.config then
    local colorscheme = LM.custom.config.colorscheme
    local os = require 'os'

    local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
    if not status_ok then
      vim.notify("colorscheme " .. colorscheme .. " not found")
      return
    end
  end
end
