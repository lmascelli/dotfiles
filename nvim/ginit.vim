lua << EOF
-- LM.keymaps.set_keymap('i', '<C-Space>', '<cmd>:lua LM.complete()<cr>', {})
pcall(vim.cmd, 'GuiLoad')
vim.api.nvim_set_keymap('i', '<c- >', '<cmd>:lua LM.complete()<cr>', {})
EOF
