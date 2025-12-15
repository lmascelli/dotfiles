-- vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3
vim.g.netrw_winsize = -25
vim.g.netrw_bufsettings = "noma nomod nonu nowrap ro bl"

vim.keymap.set("n", "J", ":e .<CR>", {desc = "Open Netrw here"})

if LM then
  if LM.fn.toggle_explorer == nil then
    LM.fn.toggle_explorer = function()
      vim.cmd('e .')
    end
  end
end
