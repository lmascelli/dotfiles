return {
  'nvim-orgmode/orgmode',
  config = function()
    require('orgmode').setup {
      org_hide_leading_stars = true,
      org_highlight_latex_and_related = "entities",
      emacs_config = LM.orgmode_emacs_config,
      mappings = {
        -- prefix = '<C-c>',
      }
    }
  end
}
