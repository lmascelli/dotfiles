return {
  'nvim-orgmode/orgmode',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
  },
  event = 'VeryLazy',
  lazy = true,
  ft = { 'org' },
  config = function()
    -- Setup orgmode
    require('orgmode').setup({
      org_agenda_files = '~/orgfiles/**/*',
      org_default_notes_file = '~/orgfiles/refile.org',
      org_hide_leading_stars = true,
      org_highlight_latex_and_related = "entities",
      mappings = {
        org_return_uses_meta_return = true,
      }
    })
    if MiniClue then
      vim.keymap.set('n', '<leader>o', "", {desc = "+Org-mode"})
    end

    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'org',
      callback = function()
        vim.keymap.set('i', '<S-CR>', '<cmd>lua require("orgmode").action("org_mappings.meta_return")<CR>', {
          silent = true,
          buffer = true,
        })
      end,
    })
  end,
}
