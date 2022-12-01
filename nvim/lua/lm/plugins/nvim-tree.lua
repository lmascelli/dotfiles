return {
  setup = function(use)
    use {
      'kyazdani42/nvim-tree.lua',
      opt = true,
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
    cmd = "NvimTreeToggle",
    config = function()

    require 'nvim-tree'.setup {
      view = {
        mappings = {
          list = {
            { key = "cd", action = "cd" },
            { key = "cc", action = "copy" },
          }
        }
      }
    }
    end
    }
  end,

  config = function()
    LM.explorer.toggle_explorer = function()
      vim.cmd ':NvimTreeToggle'
    end
  end,
}
