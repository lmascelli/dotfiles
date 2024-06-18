vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3
vim.g.netrw_winsize = -25


if LM then
  if LM.api.toggle_explorer == nil then
    LM.api.toggle_explorer = function()
      vim.cmd('Lexplore')
    end
  end
end
