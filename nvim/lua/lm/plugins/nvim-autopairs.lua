local M = {}

M.name = 'nvim-autopairs'
M.url = 'windwp/nvim-autopairs'
M.requires = {}
M.config = function()
  local ok, npairs = pcall(require, 'nvim-autopairs')
  if ok then
    npairs.setup {
      map_cr = true
    }
  end
end

return M
