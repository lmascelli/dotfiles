local colorscheme = require 'lm_settings'.colorscheme
local os = require 'os'

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found")
  return
end
-- italic font for comments
vim.cmd "highlight Comment cterm=italic gui=italic"

local time = os.date("*t", os.time())

LM.dynamic_background = function()
  if (time.hour >= 9 and time.hour < 19) then
    vim.opt.background = "light"
  else
    vim.opt.background = "dark"
  end
end
