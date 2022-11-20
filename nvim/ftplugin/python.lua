LM.format_black = function()
  vim.cmd 'Black'
end

LM.keymap("n", "<leader>lf",
  '<cmd>lua LM.format_black()<cr>', {}, nil, 'format with black')
