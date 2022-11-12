lua << EOF
  if vim.fn.exists(':GuiFont') then
    LM.update_font = function()
      vim.cmd (':GuiFont! ' .. LM.font_name .. ':h' .. LM.font_size) 
    end
    LM.update_font()
  end

  if vim.fn.exists(':GuiScrollBar') then
    vim.cmd ':GuiScrollBar 0'
  end

  if vim.fn.exists(':GuiPopupmenu') then
    vim.cmd ':GuiPopupmenu 1'
  end

  if vim.fn.exists(':GuiTabline') then
    vim.cmd ':GuiTabline 0'
  end
EOF
