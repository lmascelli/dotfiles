vim.api.nvim_create_autocmd({ "ColorScheme" }, {
  group = LM.augroups.colorscheme,
  callback = function(_)
    -- restore termguicolors for some colorschemes
    vim.opt.termguicolors = true
    -- italic comments
    vim.cmd "highlight Comment cterm=italic gui=italic"
    -- nice windows separator
    vim.cmd "highlight WinSeparator guibg=None"
    -- vim.cmd 'highlight CursorLine gui=underline'
    vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })

    -- fix some highlights for some colorschemes
    if vim.g.colors_name == "default" or vim.g.colors_name == "zaibatsu" then
      if vim.fn.has("nvim-0.9") == 1 then
        vim.cmd 'hi! link Pmenu Title'
        vim.cmd 'hi! link SignColumn Normal'
      end
    end
  end,
})
