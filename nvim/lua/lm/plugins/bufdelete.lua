return {
  setup = function(use)
    use 'famiu/bufdelete.nvim'
  end,
  config = function()
    vim.g.lm.append('buffer_delete', function()
      vim.cmd 'Bdelete'
    end)
  end
}
