local M = {}

M.url = "folke/zen-mode.nvim"
M.lazy = true
M.cmd = "ZenMode"
M.config = function()
  local ok, zenmode = pcall(require, 'zen-mode')
  if ok then
    zenmode.setup {
      on_open = function(win)
        vim.o.colorcolumn = ''
      end,
      on_close = function(win)
        if LM.g.settings.colorcolumn then
          vim.o.colorcolumn = tostring(LM.g.settings.colorcolumn_number)
        end
      end
    }
  end
end

M.init = function()
  LM.keymaps.add_map("n", "<leader>ao", "<cmd>ZenMode<cr>", nil, nil, "ZenMode")
end
return M
