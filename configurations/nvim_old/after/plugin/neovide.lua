if vim.g.neovide then
  vim.g.neovide_scale_factor = 0.80
  vim.g.neovide_scroll_animation_length = 0.1
  vim.keymap.set("n", "<C-+>", "<esc>:let g:neovide_scale_factor*=1.1<cr>", {
    silent = true,
    desc = "Increase font size",
  })
  vim.keymap.set("n", "<C-->", "<esc>:let g:neovide_scale_factor/=1.1<cr>", {
    silent = true,
    desc = "Decrease font size",
  })
end
