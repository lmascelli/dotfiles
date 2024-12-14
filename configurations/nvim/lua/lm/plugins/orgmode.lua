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
    })
    if MiniClue then
      vim.keymap.set('n', '<leader>o', "", {desc = "+Org-mode"})
    end
  end,
}
