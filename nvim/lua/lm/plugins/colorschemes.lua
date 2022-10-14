return {
  setup = function(use)
    use 'wittyjudge/gruvbox-material.nvim'
  end,

  config = function()
    vim.g.gruvbox_material_enable_italic_comment = 1
    require('gruvbox-material').setup()
  end
}
