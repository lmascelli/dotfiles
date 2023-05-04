lua << EOF
-- LM.keymaps.set_keymap('i', '<C-Space>', '<cmd>:lua LM.complete()<cr>', {})
vim.api.nvim_set_keymap('i', '<c- >', '<cmd>:lua LM.complete()<cr>', {})
EOF
