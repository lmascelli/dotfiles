<<<<<<< HEAD
local config = {}

config.colorscheme = 'default'
config.font_name = 'FiraCode NF'
config.font_size = 10

config.opts = {

}

config.settings = {
  colorcolumn = 80,
}

config.plugin_list = {
  'which-key',
  'nvim-tree',
  'telescope',
  'lualine',
  'bufferline',
  'lsp',
  'lspsaga',
  'nvim-cmp',
  'luasnip',
  'comment',
  'nvim-autopairs',
  'toggleterm',
  'treesitter',
  'startup-time',
  'black',
}


config.lsp_list = {
  'lua',
  'clangd',
--  'pyright',
  'pylsp',
  'rust_analyzer',
  'powershell',
}

config.matlab_exec = 'D:/Program Files/MATLAB/R2022b/bin/matlab'

return config
=======
local config = {}

config.colorscheme = 'default'
if LM.os_version == 'Linux' then
   config.font_name = 'FiraCode Nerd Fonts'
elseif LM.os_version == "Windows" then
   config.font_name = 'FiraCode NF'
end
   
config.font_size = 10

config.opts = {

}

config.settings = {
  colorcolumn = 80,
}

config.plugin_list = {
  'which-key',
  'nvim-tree',
  'telescope',
  'lualine',
  'bufferline',
  'lsp',
  'lspsaga',
  'nvim-cmp',
  'luasnip',
  'comment',
  'nvim-autopairs',
  'toggleterm',
  'bufdelete',
  'treesitter',
  'startup-time',
  'black',
}


config.lsp_list = {
  'lua',
  'clangd',
  'pyright',
  'rust_analyzer',
  'powershell',
}

return config
>>>>>>> 1f6cd88f7581e8de3631f69fc52c888c2e86ed29
