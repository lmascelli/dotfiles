local packer = require 'packer'

local install = function()
  packer.use { 'akinsho/bufferline.nvim', 'kyazdani42/nvim-web-devicons' }
end

local config = function()
  local keymap = vim.api.nvim_set_keymap

  require 'bufferline'.setup {
    options = {
      show_close_icon = false,
    }
  }
  keymap('n', '<a-1>', '<cmd>BufferLineGoToBuffer1<cr>', {})
  keymap('n', '<a-2>', '<cmd>BufferLineGoToBuffer2<cr>', {})
  keymap('n', '<a-3>', '<cmd>BufferLineGoToBuffer3<cr>', {})
  keymap('n', '<a-4>', '<cmd>BufferLineGoToBuffer4<cr>', {})
  keymap('n', '<a-5>', '<cmd>BufferLineGoToBuffer5<cr>', {})
  keymap('n', '<a-5>', '<cmd>BufferLineGoToBuffer5<cr>', {})
  keymap('n', '<a-6>', '<cmd>BufferLineGoToBuffer6<cr>', {})
  keymap('n', '<a-7>', '<cmd>BufferLineGoToBuffer7<cr>', {})
  keymap('n', '<a-8>', '<cmd>BufferLineGoToBuffer8<cr>', {})
  keymap('n', '<a-9>', '<cmd>BufferLineGoToBuffer9<cr>', {})
  keymap('n', '<c-tab>', '<cmd>BufferLineCycleNext<cr>', {})
  keymap('n', '<c-\\>', '<cmd>BufferLineCyclePrev<cr>', {})
end

return {
  install = install,
  config = config,
}
