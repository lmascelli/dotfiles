return {
  "folke/zen-mode.nvim",
  cmd = "ZenMode",
  init = function()
    vim.keymap.set("n", "<leader>ao", "<cmd>ZenMode<cr>", { desc = "ZenMode" })
  end,
  config = function()
    local zenmode = require('zen-mode')
    zenmode.setup {}
  end,
}
