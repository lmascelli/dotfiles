local M = {}
M.name = 'toggleterm'
M.url = 'akinsho/toggleterm.nvim'
M.lazy = true
M.cmd = "ToggleTerm"
M.config = function()
  local shell = 'pwsh'
  local ok, toggleterm = pcall(require, 'toggleterm')
  if ok then
    toggleterm.setup {
      direction = 'float',
      float_opts = { border = 'curved' },
      shell = shell,
    }
  end
end
M.init = function()
  LM.keymaps.add_map('n', '<leader>ò', '<cmd>ToggleTerm<cr>',
    { silent = true, noremap = true }, nil, 'terminal')
end
return M
