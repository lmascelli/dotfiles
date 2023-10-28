return {
  'simrat39/rust-tools.nvim',
  ft = 'rust',
  dependencies = {
    { 'neovim/nvim-lspconfig' },
  },
  config = function()
    local rt = require('rust-tools')
    rt.setup {
      tools = {
        hover_actions = {
          auto_focus = true,
        },
      },
      server = {
        on_attach = function(_, bufnr)
          vim.keymap.set("n", "<leader>lK", rt.hover_actions.hover_actions,
            { buffer = bufnr, desc = "Documentation (RT)" })
          vim.keymap.set("n", "<leader>la", rt.code_action_group.code_action_group,
            { buffer = bufnr, desc = "Code action (RT)" })
        end
      },
    }
  end
}
