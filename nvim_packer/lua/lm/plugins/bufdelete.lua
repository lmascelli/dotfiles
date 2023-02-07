return {
  setup = function(use)
    use 'famiu/bufdelete.nvim'
  end,
  config = function()
    LM.buffer_delete = function()
      vim.cmd 'Bdelete'
    end
  end
}
