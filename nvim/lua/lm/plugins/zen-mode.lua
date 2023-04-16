local M = {}

M.url = "folke/zen-mode.nvim"
M.lazy = true
M.cmd = "ZenMode"

M.init = function ()
  LM.keymaps.add_map("n", "<leader>ao", "<cmd>ZenMode<cr>", nil, nil, "ZenMode")
end
return M
