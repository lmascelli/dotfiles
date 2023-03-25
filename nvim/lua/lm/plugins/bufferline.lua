local M = {}

M.name = 'bufferline'
M.url = 'akinsho/bufferline.nvim'
M.requires = { { url='nvim-tree/nvim-web-devicons'}, }

M.config = function()
  require 'bufferline'.setup {
    options = {
      show_close_icon = false,
      diagnostics_indicator = function(_, _, diagnostics_dict, _) -- hidden count, level, context
        local s = " "
        for e, n in pairs(diagnostics_dict) do
          local sym = e == "error" and " "
          or (e == "warning" and " " or "")
          s = s .. n .. sym
        end
        return s
      end
    }
  }
end
M.init = function()

  local keymap = LM.keymaps.add_map

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

return M
