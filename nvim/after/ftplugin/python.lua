LM.format_black = function()
  vim.cmd 'Black'
end

require 'which-key'.register({
  ["<leader>lb"] = { '<cmd>Black<cr>', 'format with black' }
},
  { buffer = vim.fn.bufnr('%'), }
)
