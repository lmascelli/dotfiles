colorscheme slate
lua << EOF
  if vim.fn.exists(':GuiFont') then
    LM.font.update_font = function()
      vim.cmd (':GuiFont! ' .. LM.font.font_name .. ':h' .. LM.font.font_size) 
    end
    LM.font.update_font()
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
