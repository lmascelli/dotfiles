local M = {}

M.name = 'nvim-tree'
M.url = 'kyazdani42/nvim-tree.lua'
M.lazy = true
M.requires = {
  { url = 'nvim-tree/nvim-web-devicons' }, 
}
M.cmd = "NvimTreeToggle"
M.config = function()
  local ok, nvim_tree = pcall(require, 'nvim-tree')
  if ok then
    nvim_tree.setup {
      view = {
        mappings = {
          list = {
            { key = "cd", action = "cd" },
            { key = "cc", action = "copy" },
          }
        }
      }
    }
  else
    print 'nvim-tree: config error'
  end
end
M.init = function()
  LM.explorer.toggle_explorer = function()
    vim.cmd ':NvimTreeToggle'
  end
end

return M
