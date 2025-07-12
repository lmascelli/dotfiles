-- vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3
vim.g.netrw_winsize = -25

if LM then
  if LM.fn.toggle_explorer == nil then
    LM.fn.toggle_explorer = function()
      vim.cmd('Lexplore')
    end
  end
end
