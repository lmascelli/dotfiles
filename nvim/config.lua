local config = {}

config.colorscheme = 'default'
config.font_name = 'FiraCode NF'
config.font_size = 10

config.after = function()
  if LM.which_key_enabled then
    vim.cmd 'hi WhichKeyFloat ctermbg=Black ctermfg=Black guibg=Black guifg=White'
  end
  vim.cmd 'hi Pmenu ctermbg=Black ctermfg=White guibg=Black guifg=White'
end

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
  'nvim-cmp',
  'luasnip',
  'comment',
  'nvim-autopairs',
  'toggleterm',
  'bufdelete',
  'treesitter'
}


config.lsp_list = {
  'lua',
  'clangd',
  'pyright',
  'rust_analyzer',
  'powershell',
}

config.matlab_exec = 'D:/Program Files/MATLAB/R2022b/bin/matlab'

return config
